# mygithub - Denny's personal universe

Everything under this directory is PERSONAL (GitHub behoof4mind, AWS 613852762845). Maincard work lives in `~/Workspace/maincard/` and never mixes with this - one deliberate exception below.

Start personal Claude sessions from THIS directory, not from maincard paths.

## Repos

| Repo | Purpose | Details |
|---|---|---|
| `personal-infra/` | Terraform (AWS) + nix flake deploying daemon-box | its CLAUDE.md |
| `kladovka-boxes/` | Box inventory PWA, boxes.kladovka.dev | its CLAUDE.md + README |
| `kladovka-cards/` | Gift card wallet PWA, cards.kladovka.dev | its CLAUDE.md + README |
| `automation/` | Automation platform: Claude agents, skills, scheduled routines. Handles ANY automation - personal AND professional (`domains/work/` = maincard automation, the one sanctioned work/personal crossover; extraction candidate) | its README |
| `home-manager/` | Dotfiles/HM for linux + mac, wires automation onto machines | its CLAUDE.md |
| `side-activity/` | Scratch notes, not a repo |

## Shared facts

- **daemon-box**: NixOS EC2 t4g.small arm64, EIP `3.126.159.255`, `ssh root@` (key denny-ed25519). Runs Caddy (TLS), kladovka apps, telegram bot, tdl, wezterm mux
- **AWS**: profile `personal` (aws-vault via credential_process; do NOT wrap `terraform apply` in `aws-vault exec` - provider resolves creds itself), region eu-central-1
- **Secrets on box**: `/var/lib/kladovka-secrets/*.env` root-only; write via ssh stdin only (heredoc mangles `$2a$` bcrypt)
- **Backups**: S3 `kladovka-backups-613852762845` (KMS, versioning), daily 03:30 UTC timer; restore procedures in app READMEs
- **Domain**: kladovka.dev (Route53), subdomains per app

## Deploy cycle (both kladovka apps)

```
git push <app repo>
cd ~/Workspace/mygithub/personal-infra/nix
nix flake update <kladovka|kladovka-cards>
nix run nixpkgs#nixos-rebuild -- switch --flake .#daemon-box --target-host root@3.126.159.255 --build-host root@3.126.159.255
git commit -am "flake.lock: bump ..." && git push
```

Run as one background chain; NEVER mask nixos-rebuild's exit code with `| tail` - capture `$?`. Guardrail toggle must be a SEPARATE bash call before the chain. Service restart kills the in-memory extraction queue (cards recovers receipts on startup) and gives ~seconds of 502 - use retry loops when verifying. Verify deploys via authenticated python/urllib checks against the live site.

Go deps changed -> recompute vendorHash in nix/package.nix (fake `sha256-AAAA...=`, build, take "got:").
