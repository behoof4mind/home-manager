{ pkgs, vars }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {

      # Ftapi
      ftedb = "kubectl exec -n percona-database cluster1-pxc-1 -c pxc -it -- /bin/bash -c 'mysql -uroot -p\$MYSQL_ROOT_PASSWORD'";
      ftgnr = "kubectl get pods -A | grep secutransfer | grep '0/1'";
      ftgoom = "kubectl get pods -A -o jsonpath='{range .items[?(@.status.containerStatuses[0].lastState.terminated.reason=='OOMKilled')]}{.status.containerStatuses[0].lastState.terminated.finishedAt} {.metadata.namespace} {.metadata.name} {.metadata.annotations.ftapi_com_hack_url}{'\\n'}{end}' | sort -r";
      ftgpl = "kubectl -n=percona-database cp -c pxc cluster1-pxc-1:/var/lib/mysql/mysqld-error.log ./pxc-1-error.log";

      "..." = "cd ../..";
      gtp = "cd ${vars.currentProject}";
      gtw = "cd ${vars.currentProject} && nvim .";

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

      # Docker
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
      kc = "kubectl create";
      kdel = "kubectl delete";
      ke = "kubectl edit";
      kg = "kubectl get";
      kga = "kubectl get all";
      kgaa = "kubectl get all -A";

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

      ## kubectl statefullset
      kdsts = "kubectl describe statefulsets";
      kdelsts = "kubectl delete statefulsets";
      kdelstsn = "kubectl delete statefulsets --namespace";
      kests = "kubectl edit statefulsets";
      kgsts = "kubectl get statefulsets";
      kgstsn = "kubectl get statefulsets --namespace";

      kdelpvc = "kubectl delete pvc";
      kdelpvcn = "kubectl delete pvc --namespace";
      kdpvc = "kubectl describe pvc";
      kepvc = "kubectl edit pvc";
      kgpvc = "kubectl get pvc";
      kgpvcn = "kubectl get pvc --namespace";

      kdelpv = "kubectl delete pv";
      kdpv = "kubectl describe pv";
      kgpv = "kubectl get pv";

      kdcm = "kubectl describe configmap";
      kdelcm = "kubectl delete configmap";
      kecm = "kubectl edit configmap";
      kecmn = "kubectl edit configmap --namespace";
      kgcm = "kubectl get configmap";
      kgcmn = "kubectl get configmap --namespace";

      kge = "kubectl get events";
      kgea = "kubectl get events -A";

      kgi = "kubectl get ingress";
      kgin = "kubectl get ingress --namespace";
      kdi = "kubectl describe ingress";
      kdin = "kubectl describe ingress --namespace";
      kdeli = "kubectl delete ingress";

      kgnode = "kubectl get nodes";
      kgnodew = "kubectl get nodes --wide";

      kdnp = "kubectl describe networkpolicy";
      kdelnp = "kubectl delete networkpolicy";
      kdelnpn = "kubectl delete networkpolicy --namespace";
      kenp = "kubectl edit networkpolicy";
      kenpn = "kubectl edit networkpolicy --namespace";
      kgnp = "kubectl get networkpolicy";
      kgnpa = "kubectl get networkpolicy -A";
      kgnpn = "kubectl get networkpolicy --namespace";

      kcgc = "kubectl config get-contexts";
      kcsccn = "kubectl config set-context --current --namespace";
      kcuc = "kubectl config use-context";
      kcv = "kubectl config view";

      kaf = "kubectl apply -f";
      ksh = "kubectl exec -it";
      ktn = "kubectl top node";
      ktp = "kubectl top pod";

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

      tf = "terraform";
      tfa = "terraform apply";
      tfp = "terraform plan";
      tg = "terragrunt";
      tga = "terragrunt apply";
      tgp = "terragrunt plan";

      weather = "wego -owm-api-key '87e5d08c45b15d860c42fa1f466f2ea1' -l Freilassing";
      prs = "gh-dash";

      hms = "home-manager switch";
      kk = "k9s";

      m = "minikube";
      ms = "mini-start";
      mdash = "minikube dashboard";
      mssh = "minikube ssh";
    };
    interactiveShellInit = ''
      export "PATH=$PATH:$HOME/kubectl-plugins"
      export EDITOR="nvim"
      set -gx  LC_ALL en_US.UTF-8
      export PATH="$PATH:/opt/homebrew/bin"
      export VISUAL="nvim"
      export XDG_CONFIG_HOME="$HOME/.config"
      export KUBECONFIG="$HOME/.config/kube/config"
      export ATAC_KEY_BINDINGS="~/.atac_vim_key_bindings.toml"
      export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
      kubectl completion fish | source
      source ~/.iterm2_shell_integration.fish
      thefuck --alias | source
      zoxide init fish | source
    '';
    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
      kubectl = {
        body = "command kubecolor $argv";
        wraps = "kubectl";
      };
      kubecolor = {
        body = "command kubecolor $argv";
        wraps = "kubectl";
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
