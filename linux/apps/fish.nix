{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      "..." = "cd ../..";
      gtw = "cd ~/MyGitHub";

      # Ftapi
      ftedb = "kubectl exec -n percona-database cluster1-pxc-1 -c pxc -it -- /bin/bash -c 'mysql -uroot -p\$MYSQL_ROOT_PASSWORD'";
      ftgnr = "kubectl get pods -A | grep secutransfer | grep '0/1'";
      ftgpl = "kubectl -n=percona-database cp -c pxc cluster1-pxc-1:/var/lib/mysql/mysqld-error.log ./pxc-1-error.log";

      # Switching contexts by custom fish functions
      auc = "aws-set-profile";
      kuc = "kubectl-set-context";
      mcuc = "mc-set-alias";

      # Minio client
      mcal = "mc alias list";

      # AWS cli
      alo = "aws s3api list-objects";
      aloot = "aws s3api list-objects --output table";
      alooy = "aws s3api list-objects --output yaml";
      alb = "aws s3api list-buckets";
      albot = "aws s3api list-buckets --output table";
      alboy = "aws s3api list-buckets --output yaml";

      g = "git";
      nv = "nvim";
      v = "nvim";

      # Podman
      p = "podman";
      pms = "podman machine start";
      pps = "podman ps";
      ppsa = "podman ps -a";
      psh = "podman exec -it";
      prm = "podman rm";
      prmf = "podman rm --force";
      pvl = "podman volume list";
      pvrm = "podman volume rm";
      pils = "podman image ls";
      pirm = "podman image rm";
      pcu = "podman-compose up";
      pcub = "podman-compose up --build";
      pcd = "podman-compose down";
      pcud = "podman-compose up -d";

      ## Docker
      d = "docker";
      dps = "docker ps";
      dpsa = "docker ps -a";
      dsh = "docker exec -it";
      drm = "docker rm";
      drmf = "docker rm --force";
      dvl = "docker volume list";
      dvrm = "docker volume rm";
      dils = "docker image ls";
      dirm = "docker image rm";
      dcu = "docker-compose up";
      dcd = "docker-compose down";
      dcud = "docker-compose up -d";

      ## kubectl global
      k = "kubectl";
      kar = "kubectl api-resources";
      kun = "kubectl-set-namespace";
      kc = "kubectl create";
      kga = "kubectl get all";
      kgaa = "kubectl get all -A";
      kg = "kubectl get";
      kdel = "kubectl delete";
      ke = "kubectl edit";

      ## kubectl pods
      kdelp = "kubectl delete pod";
      kdelpn = "kubectl delete pod --namespace";
      kdelpa = "kubectl delete pod --all";
      kdelpna = "kubectl delete pod --all --namespace";
      kdp = "kubectl describe pod";
      kdpn = "kubectl describe pod --namespace";
      kep = "kubectl edit pod";
      kgp = "kubectl get pods";
      kgpa = "kubectl get pods -A";
      kgpn = "kubectl get pods --namespace";
      kl = "kubectl logs";
      kln = "kubectl logs --namespace";
      krun = "kubectl run temorary-pod --image";
      kruny = "kubectl run temorary-pod --dry-run=client -o yaml --image";

      ## kubectl services
      kdels = "kubectl delete service";
      kds = "kubectl describe service";
      kdsn = "kubectl describe service --namespace";
      kes = "kubectl edit service";
      kgs = "kubectl get service";
      kgsn = "kubectl get service --namespace";

      ## kubectl endpoints
      kdelep = "kubectl delete endpoint";
      kdep = "kubectl describe endpoint";
      kdepn = "kubectl describe endpoint --namespace";
      keep = "kubectl edit endpoint";
      kgep = "kubectl get endpoint";
      kgepn = "kubectl get endpoint --namespace";

      ## kubectl secrets
      kdelsec = "kubectl delete secret";
      kdsec = "kubectl describe secret";
      kdsecn = "kubectl describe secret --namespace";
      kesec = "kubectl edit secret";
      kgsec = "kubectl get secret";
      kgsecn = "kubectl get secret --namespace";

      ## kubectl namespaces
      kdelns = "kubectl delete namespace";
      kdns = "kubectl describe ns";
      kens = "kubectl edit namespace";
      kgns = "kubectl get ns";

      ## kubectl deploy
      kddep = "kubectl describe deploy";
      kdeldep = "kubectl delete deploy";
      kdeldepn = "kubectl delete deploy --namespace";
      kedep = "kubectl edit deploy";
      kgdep = "kubectl get deploy";
      kgdepn = "kubectl get deploy --namespace";

      ## kubectl statefulset
      kdsts = "kubectl describe statefulsets";
      kdelsts = "kubectl delete statefulsets";
      kdelstsn = "kubectl delete statefulsets --namespace";
      kests = "kubectl edit statefulsets";
      kgsts = "kubectl get statefulsets";
      kgstsn = "kubectl get statefulsets --namespace";

      ## kubectl pvc
      kdelpvc = "kubectl delete pvc";
      kdelpvcn = "kubectl delete pvc --namespace";
      kdpvc = "kubectl describe pvc";
      kepvc = "kubectl edit pvc";
      kgpvc = "kubectl get pvc";
      kgpvcn = "kubectl get pvc --namespace";

      ## kubectl pv
      kdelpv = "kubectl delete pv";
      kdpv = "kubectl describe pv";
      kgpv = "kubectl get pv";

      ## kubectl configmap
      kdelcm = "kubectl delete configmap";
      kdcm = "kubectl describe configmap";
      kecm = "kubectl edit configmap";
      kecmn = "kubectl edit configmap --namespace";
      kgcm = "kubectl get configmap";
      kgcmn = "kubectl get configmap --namespace";

      ## kubectl events
      kge = "kubectl get events";
      kgea = "kubectl get events -A";

      ## kubectl nodes
      kgnode = "kubectl get nodes";
      kgnodew = "kubectl get nodes --wide";

      ## kubectl ingress
      kgi = "kubectl get ingress";
      kgin = "kubectl get ingress --namespace";
      kdi = "kubectl describe ingress";
      kdin = "kubectl describe ingress --namespace";
      kdeli = "kubectl delete ingress";

      ## kubectl networkpolicy
      kdnp = "kubectl describe networkpolicy";
      kdelnp = "kubectl delete networkpolicy";
      kdelnpn = "kubectl delete networkpolicy --namespace";
      kenp = "kubectl edit networkpolicy";
      kenpn = "kubectl edit networkpolicy --namespace";
      kgnp = "kubectl get networkpolicy";
      kgnpa = "kubectl get networkpolicy -A";
      kgnpn = "kubectl get networkpolicy --namespace";

      ## kubectl context/config
      kcgc = "kubectl config get-contexts";
      kcuc = "kubectl config use-context";
      kcv = "kubectl config view";
      kcsccn = "kubectl config set-context --current --namespace";

      kaf = "kubectl apply -f";
      ksh = "kubectl exec -it";
      ktp = "kubectl top pod";
      ktn = "kubectl top node";

      # kubectl flux-helmrelease
      kghr = "kubectl get helmrelease";
      kghrn = "kubectl get helmrelease --namespace";

      # flux gitrepositories
      kgg = "kubectl get gitrepositories";
      kggn = "kubectl get gitrepositories --namespace";

      # kubectl flux-kustomizations
      kgks = "kubectl get kustomization";
      kgksn = "kubectl get kustomization --namespace";
      keks = "kubectl edit kustomization";
      keksn = "kubectl edit kustomization --namespace";
      kdelks = "kubectl delete kustomization";
      kdelksn = "kubectl delete kustomization --namespace";

      # flux resume/suspend
      fsusks = "flux suspend kustomization --namespace";
      fresks = "flux resume kustomization --namespace";
      fsushr = "flux suspend helmrelease --namespace";
      freshr = "flux resume helmrelease --namespace";

      # flux sources
      fgsa = "flux get sources all";

      # flux reconciliation
      fr = "flux reconcile";
      frhr = "flux reconcile helmrelease --namespace";
      frhrf = "flux reconcile helmrelease --force --namespace";
      frhrff = "flux reconcile helmrelease --force --with-source --namespace";
      frsg = "flux reconcile source git";
      frks = "flux reconcile kustomization --namespace";
      frksf = "flux reconcile kustomization --with-source --namespace";

      tg = "terragrunt";
      tga = "terragrunt apply";
      tgp = "terragrunt plan";
      tf = "terraform";
      tfa = "terraform apply";
      tfp = "terraform plan";

      prs = "gh-dash";
      kk = "k9s";
      m = "minikube";
      ms = "mini-start";
      mdash = "minikube dashboard";
      mssh = "minikube ssh";

      hms = "home-manager switch";
    };
    interactiveShellInit = ''
      set fish_greeting
      export PATH="$PATH:$HOME/.local/bin"
      export PATH="$PATH:$HOME/kubectl-plugins"
      export EDITOR="nvim"
      export VISUAL="nvim"
      export XDG_CONFIG_HOME="$HOME/.config"
      export KUBECONFIG="$HOME/.config/kube/config"
      set -gx LC_ALL en_US.UTF-8
      kubectl completion fish | source
      direnv hook fish | source
      zoxide init fish | source
    '';
    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
      fish_user_key_bindings = {
        body = ''
          fish_vi_key_bindings
          bind -M visual 'y' fish_clipboard_copy
        '';
      };
      fish_clipboard_copy = {
        body = ''
          set -l cursor_pos (commandline -C)
          set -l selection (commandline -j)
          if test -n "$selection"
              if command -q wl-copy
                  echo -n $selection | wl-copy
              else if command -q xclip
                  echo -n $selection | xclip -selection clipboard
              else
                  echo "No clipboard tool found!" >&2
              end
          else
              echo "No text selected." >&2
          end
          commandline -f cancel
          commandline -C $cursor_pos
          commandline -f repaint
        '';
      };
      kubectl = {
        body = "command kubecolor $argv";
        wraps = "kubectl";
      };
      kubectl-set-context = {
        body = ''
          set contexts (kubectl config get-contexts --output=name)
          if test -n "$contexts"
              set selected (printf "%s\n" $contexts | fzf --prompt="Select Kubernetes Context: " --height=10 --border --ansi)
              if test -n "$selected"
                  kubectl config use-context $selected
              else
                  echo "No context selected."
              end
          else
              echo "No Kubernetes contexts found."
          end
        '';
      };
      kubectl-set-namespace = {
        body = ''
          set namespaces (kubectl get namespaces -o jsonpath="{.items[*].metadata.name}" | tr ' ' '\n')
          if test -n "$namespaces"
              set selected (printf "%s\n" $namespaces | fzf --prompt="Select Kubernetes Namespace: " --height=10 --border --ansi)
              if test -n "$selected"
                  kubectl config set-context --current --namespace=$selected
                  echo "Switched to Kubernetes namespace: $selected"
              else
                  echo "No namespace selected."
              end
          else
              echo "No Kubernetes namespaces found."
          end
        '';
      };
      mc-set-alias = {
        body = ''
          set aliases (jq -r ".aliases | keys[]" ~/.mc/config.json 2>/dev/null)
          if test -n "$aliases"
              set selected (printf "%s\n" $aliases | fzf --prompt="Select MinIO Alias: " --height=10 --border --ansi)
              if test -n "$selected"
                  set -Ux MC_ALIAS $selected
                  echo -n "$MC_ALIAS" | wl-copy
                  echo "MC_ALIAS set to $selected"
              else
                  echo "No alias selected."
              end
          else
              echo "No aliases found in ~/.mc/config.json."
          end
        '';
      };
      aws-set-profile = {
        body = ''
          set profiles (awk -F ' ' '/^\[profile / {gsub(/[\[\]]/, "", $2); print $2} /^\[default\]/ {gsub(/[\[\]]/, "", $1); print $1}' ~/.aws/config)
          if set -q profiles[1]
              set selected (printf "%s\n" $profiles | fzf --prompt="Select AWS Profile: " --height=10 --border --ansi)
              if test -n "$selected"
                  set -Ux AWS_PROFILE $selected
                  echo "AWS_PROFILE set to $selected"
              else
                  echo "No profile selected."
              end
          else
              echo "No profiles found in ~/.aws/config."
          end
        '';
      };
    };
    plugins = [
      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
          sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        };
      }
      {
        name = "abbreviation-tips";
        src = pkgs.fetchFromGitHub {
          owner = "gazorby";
          repo = "fish-abbreviation-tips";
          rev = "4ff1f565b5773aadba028051f432984def921762";
          sha256 = "1bkgpmvyp1pk3p12lmrmjyslx3d2sfn9nfcry6bqis4k3yyr7xvy";
        };
      }
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "kubectl";
        src = pkgs.fetchFromGitHub {
          owner = "evanlucas";
          repo = "fish-kubectl-completions";
          rev = "ced676392575d618d8b80b3895cdc3159be3f628";
          sha256 = "09qcj82qfs4y4nfwvy90y10xmx6vc9yp33nmyk1mpvx0dx6ri21r";
        };
      }
    ];
  };
}
