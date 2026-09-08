# Maincard Infrastructure

## Infra Notes
Read `.infra-notes/` at the start of any infrastructure investigation. It contains known broken
things (`known-issues.md`) and recurring failure patterns (`patterns.md`) that save diagnostic time.

## Overview

Multi-repo GitOps infrastructure for a white-label casino SaaS platform running on AWS EKS. Deployments are driven by ArgoCD (main cluster) and Flux CD (tech cluster). Each casino client runs as an isolated Kubernetes namespace with its own database, secrets, and full application stack.

## AWS

- **Account ID**: `379862102886`
- **Region**: `us-east-1`
- **EKS cluster**: `maincard`
- **aws-vault profile**: `maincard`

## Repositories

All repos live under `/home/denny/Workspace/maincard/`. Each is an independent git repo hosted at `gitlab.maincard.io`.

| Repo | GitLab path | Purpose |
|------|------------|---------|
| `aws/` | `infra/aws` | IAM roles/policies scripts (IRSA, Grafana CloudWatch, LB controller, Loki S3) |
| `generic-casino-chart/` | `infra/generic-casino-chart` | Helm chart for the full casino application stack |
| `generic-casino-pipeline/` | `infra/generic-casino-pipeline` | GitLab CI pipeline managing casino lifecycle (create/delete/update via Terraform + gitops) |
| `gitops/` | `infra/gitops` | ArgoCD source of truth — declares all applications and their values |
| `k8s-settings/` | `infra/k8s-settings` | Cluster bootstrap: ArgoCD, ingress-nginx, kube-prometheus-stack, Loki, ExternalSecrets, GitLab runner |
| `shared-services-chart/` | `infra/shared-services-chart` | Helm chart for shared (cross-casino) services |
| `tech-cluster/` | `infra/tech-cluster` | Separate Flux CD cluster running a shared aggregated Redash instance |
| `cluster-gitops/` | `infra/cluster-gitops` | Unified-ArgoCD infra GitOps (epic SND-1947): per-cluster infrastructure components, vendored `_charts/`, app-of-apps. Kept separate from `gitops/` for least-privilege (app-gitops takes direct CI image-tag pushes) |

## Deployment Architecture

```
gitops repo (source of truth)
  └─ ArgoCD ApplicationSets scan gitops and generate Application objects
       ├─ generic-casino/{dev,prod}/apps/<casino>/config.yaml  →  dev/prod-generic-casino-<name>
       ├─ shared-services/apps/<service>/values.{dev,prod}.yaml  →  dev/prod-shared-<service>
       ├─ shared-services/infra/<service>/values.{dev,prod}.yaml  →  uses in-repo chart
       └─ generic-casino-mr-frontend/<mr>.values.yaml  →  ephemeral frontend review envs
```

- `config.yaml` presence is what activates an ArgoCD Application for a casino — without it, the directory is ignored.
- `dev` uses chart branch `main`; `prod` uses branch `production`.
- Shared services always have automated sync with prune + selfHeal. Casino sync is opt-in via `config.yaml`.

## Active Casinos

**Dev**: devslots, infra3, luckytzaky777, luxury-slots, mr-2345, pupalupacom, revenuetestcom

**Prod**: betklix, betsharkio, dawgbet, democasino, dontdeletemecom, doublejack, evokecom, felistra, miamirush, nwr, prodcasino, redstarbetcasino, streakz, varynbetcom

Casino namespaces follow the pattern `{env}-generic-casino-{name}`.

## Shared Services (gitops/shared-services/apps/)

admin, admin-frontend, billing, builder-frontend, cronsShared, fraud, gateway, ice-builder-frontend, insurance, internal_admin_panel, kyc, sandboxAuth, sandbox-builder-frontend, sandboxBuilder, smartico, zendesk

Shared service namespaces: `{env}-shared-{service}`.

## Generic Casino Application Stack (per casino)

Each casino runs: frontend, gateway, auth-service2, wallet, billing, fraud, kyc, crons, admin-data-provider, smartico, zendesk, insurance, search, affiliate (disabled by default), centrifugo, redis, dtm (Distributed Transaction Manager).

Images pulled from `r.gitlab.maincard.io`. Credentials via `gitlab-registry-secret`.

## Secrets

- Stored in **AWS Secrets Manager**
- Synced into Kubernetes via **External Secrets Operator** (`ClusterSecretStore`: `aws-cluster-secretstore`)
- Secret paths:
  - `generic-casino/db-credentials/{env}/{casino}` — DB host/name/user/password
  - `generic-casino/client-secrets/{env}/{casino}` — session/centrifugo secrets
  - `generic-casino/common/{env}` — shared API keys (Praxis, Fireblocks, Zendesk, etc.)
  - `shared-services/{env}` — Sendgrid, Seon, Kafka, etc.
- Terraform (via CI) creates per-casino secrets at casino creation time

## Casino Lifecycle (generic-casino-pipeline)

Triggered via GitLab API or manually. Key variables: `CASINO`, `ACTION` (CREATE/DELETE/RUN_TF), `ENVIRONMENT` (dev/prod).

**CREATE flow**:
1. Init gitops folder from `_template/`, set `client.name` and `frontend.image.repository`
2. Run Terraform: provision RDS (MySQL) + client secrets in Secrets Manager
3. Trigger frontend build pipeline
4. Copy `config.yaml` → activates ArgoCD Application

**DELETE flow**:
1. (prod only) Manual confirmation gate
2. Terraform destroy: delete RDS + secrets
3. Remove casino from gitops repo
4. Delete sandbox entry, GitLab container registry images

Terraform state stored in GitLab at project ID `47` with key `{env}-generic-{module}-{casino}`.

## Cluster Bootstrap (k8s-settings)

Installed Helm charts (from `_charts/`):
- `argocd` — namespace `argocd`
- `aws-load-balancer-controller` — namespace `kube-system`, SA uses IRSA
- `ingress-nginx` — namespace `ingress-nginx`, backed by AWS ALB (`app/ingress-nginx`, `*.maincard.io`). Custom prod casino domains (e.g. `betshark.gg`) front this ALB via a **per-casino AWS Global Accelerator** (named `<casino-domain>`, e.g. `betshark-gg`, region `us-west-2`). DNS path: `customdomain → GA anycast IPs → ingress-nginx ALB (us-east-1) → nginx host-routing`. GA IPs live in well-known anycast ranges (`75.2.x`, `99.83.x`, `166.117.x`, `15.197.x`) — a domain resolving to those is ours, verify via `aws globalaccelerator list-accelerators --region us-west-2`.
- `external-secrets` — namespace `external-secrets`, uses IAM key secret `awssm-secret`
- `kube-prometheus-stack` — namespace `monitoring`
- `loki` + `promtail` — namespace `loki`, Loki uses S3 buckets `maincard-loki-aws-chunks` / `maincard-loki-aws-ruler`
- `gitlab-runner` — namespace `gitlab-runner`

## Tech Cluster (Redash)

Separate cluster (`maincard-tech`) using Flux CD + Terraform Controller + External Secrets Operator. Runs a single shared **aggregated** Redash instance (namespace `redash-aggregated`) covering all brands; datasources are actualized per brand into that one instance. (The old per-casino generator model — `redash-instances-generator-{dev,prod}` / `redash-init-cronjob-{casino}` — was removed.)

AWS services used: EKS, RDS PostgreSQL (aggregated instance), Secrets Manager, Route 53.

## Values Layering

**Casino**: `generic-casino/{env}/common/values.yaml` → `generic-casino/{env}/apps/{casino}/values.yaml`

**Shared services**: `shared-services/common/values.yaml` → `common/values.{env}.yaml` → `apps/{service}/values.yaml` → `apps/{service}/values.{env}.yaml`

## Common Operations

```bash
# Check all active ArgoCD applications
kubectl get applications -n argocd

# Get ArgoCD admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Delete all RDS instances matching a prefix (DESTRUCTIVE)
aws rds describe-db-instances --query "DBInstances[?starts_with(DBInstanceIdentifier, 'PREFIX')].DBInstanceIdentifier" \
  --output text | tr '\t' '\n' | xargs -I {} aws rds delete-db-instance --db-instance-identifier {} --skip-final-snapshot

# Bulk Terraform update for existing casinos
python3 generic-casino-pipeline/tools/tf-bulk-update.py

# Render casino chart locally
cd generic-casino-chart && helm template . > rendered.yaml
```

## Key Domains

- `*.maincard.io` — production
- `*.dev.sandbox.maincard.io` — dev sandbox
- `sandbox-builder.shared.maincard.io` / `sandbox-builder.shared-dev.maincard.io` — casino builder
- `*.redash.maincard.io` — aggregated Redash (tech cluster)
