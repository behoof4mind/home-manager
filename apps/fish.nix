{ pkgs, vars }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {

      "..." = "cd ../..";
      gtp = "cd ${vars.currentProject}";
      gtw = "cd ${vars.currentProject} && nvim .";

      g = "git";
      nv = "nvim";
      v = "vim";

      # Podman
      p = "podman";
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
      k = "kubecolor";
      kar = "kubecolor api-resources";
      kc = "kubecolor create";
      kdel = "kubecolor delete";
      ke = "kubecolor edit";
      kg = "kubecolor get";
      kga = "kubecolor get all";
      kgaa = "kubecolor get all -A";

      ## kubectl pods
      kdelp = "kubecolor delete pod";
      kdp = "kubecolor describe pod";
      kep = "kubecolor edit pod";
      kgp = "kubecolor get pods";
      kgpa = "kubecolor get pods -A";
      kgpn = "kubecolor get pods --namespace";
      kl = "kubecolor logs";
      krun = "kubecolor run temorary-pod --image";
      kruny = "kubecolor run temorary-pod --dry-run=client -o yaml --image";

      ## kubectl secrets
      kdelsec = "kubecolor delete secret";
      kdsec = "kubecolor get secret --namespace";
      kesec = "kubecolor edit secret";
      kgsec = "kubecolor get secret";
      kgsecn = "kubecolor get secret --namespace";

      ## kubectl namespaces
      kdelns = "kubecolor delete namespace";
      kdns = "kubecolor describe ns";
      kens = "kubecolor edit namespace";
      kgns = "kubecolor get ns";

      ## kubectl deploy
      kddep = "kubecolor describe deploy";
      kdeldep = "kubecolor delete deploy";
      kdeldepn = "kubecolor delete deploy --namespace";
      kedep = "kubecolor edit deploy";
      kgdep = "kubecolor get deploy";
      kgdepn = "kubecolor get deploy --namespace";

      ## kubectl statefullset
      kdsts = "kubecolor describe statefulsets";
      kdelsts = "kubecolor delete statefulsets";
      kdelstsn = "kubecolor delete statefulsets --namespace";
      kests = "kubecolor edit statefulsets";
      kgsts = "kubecolor get statefulsets";
      kgstsn = "kubecolor get statefulsets --namespace";

      kdelpvc = "kubecolor delete pvc";
      kdelpvcn = "kubecolor delete pvc --namespace";
      kdpvc = "kubecolor describe pvc";
      kepvc = "kubecolor edit pvc";
      kgpvc = "kubecolor get pvc";
      kgpvcn = "kubecolor get pvc --namespace";

      kdelpv = "kubecolor delete pv";
      kdpv = "kubecolor describe pv";
      kgpv = "kubecolor get pv";

      kdcm = "kubecolor describe configmap";
      kdelcm = "kubecolor delete configmap";
      kecm = "kubecolor edit configmap";
      kecmn = "kubecolor edit configmap --namespace";
      kgcm = "kubecolor get configmap";
      kgcmn = "kubecolor get configmap --namespace";

      kge = "kubecolor get events";
      kgea = "kubecolor get events -A";

      kgi = "kubecolor get ingress";
      kdi = "kubecolor describe ingress";
      kdeli = "kubecolor delete ingress";

      kgnode = "kubecolor get nodes";
      kgnodew = "kubecolor get nodes --wide";

      kdelnp = "kubecolor delete networkpolicy";
      kdelnpn = "kubecolor delete networkpolicy --namespace";
      kenp = "kubecolor edit networkpolicy";
      kenpn = "kubecolor edit networkpolicy --namespace";
      kgnp = "kubecolor get networkpolicy";
      kgnpa = "kubecolor get networkpolicy -A";
      kgnpn = "kubecolor get networkpolicy --namespace";

      kcgc = "kubecolor config get-contexts";
      kcsccn = "kubecolor config set-context --current --namespace";
      kcuc = "kubecolor config use-context";
      kcv = "kubecolor config view";

      kaf = "kubecolor apply -f";
      ksh = "kubecolor exec -it";
      ktn = "kubecolor top node";
      ktp = "kubecolor top pod";

      tf = "terraform";
      tfa = "terraform apply";
      tfp = "terraform plan";
      tg = "terragrunt";
      tga = "terragrunt apply";
      tgp = "terragrunt plan";

      hms = "home-manager switch";
    };
    interactiveShellInit = ''
      export "PATH=$PATH:$HOME/kubectl-plugins"
      export EDITOR="nvim"
      export PATH="$PATH:/opt/homebrew/bin"
      export VISUAL="nvim"
      export XDG_CONFIG_HOME="$HOME/.config"
      export KUBECONFIG="$HOME/.config/kube/config"
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
