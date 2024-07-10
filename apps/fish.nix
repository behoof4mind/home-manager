{ pkgs, ... }:

let
  vars = import ../variables.nix;
in
{
  programs.fish = {
    enable = true;
    shellAbbrs = {

      "..." = "cd ../..";
      gtp = "cd ${vars.currentProject}";
      gtw = "cd ${vars.currentProject} && nvim .";

      ## Docker
      g = "git";
      nv = "nvim";
      v = "vim";

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

      ## Kubectl
      k = "kubectl";
      krun = "kubectl run temorary-pod --image";
      kruny = "kubectl run temorary-pod --dry-run=client -o yaml --image";
      kc = "kubectl create";
      kg = "kubectl get";
      kdel = "kubectl delete";
      ke = "kubectl edit";
      kar = "kubectl api-resources";
      kgp = "kubectl get pods";
      kgpa = "kubectl get pods -A";
      kgpn = "kubectl get pods --namespace";
      kdp = "kubectl describe pod";
      kep = "kubectl edit pod";
      kdelp = "kubectl delete pod";

      kgsec = "kubectl get secret";
      kgsecn = "kubectl get secret --namespace";
      kdsec = "kubectl get secret --namespace";
      kesec = "kubectl edit secret";
      kdelsec = "kubectl delete secret";

      kgns = "kubectl get ns";
      kdns = "kubectl describe ns";
      kens = "kubectl edit namespace";
      kdelns = "kubectl delete namespace";

      kgdep = "kubectl get deploy";
      kgdepn = "kubectl get deploy --namespace";
      kddep = "kubectl describe deploy";
      kedep = "kubectl edit deploy";
      kdeldep = "kubectl delete deploy";
      kdeldepn = "kubectl delete deploy --namespace";

      kgpvc = "kubectl get pvc";
      kgpvcn = "kubectl get pvc --namespace";
      kdpvc = "kubectl describe pvc";
      kepvc = "kubectl edit pvc";
      kdelpvc = "kubectl delete pvc";
      kdelpvcn = "kubectl delete pvc --namespace";

      kgpv = "kubectl get pv";
      kdpv = "kubectl describe pv";
      kdelpv = "kubectl delete pv";

      kgcm = "kubectl get configmap";
      kgcmn = "kubectl get configmap --namespace";
      kdcm = "kubectl describe configmap";
      kecm = "kubectl edit configmap";
      kecmn = "kubectl edit configmap --namespace";
      kdelcm = "kubectl delete configmap";

      kge = "kubectl get events";
      kgea = "kubectl get events -A";

      kgnode = "kubectl get nodes";
      kgnodew = "kubectl get nodes --wide";

      kgnp = "kubectl get networkpolicy";
      kgnpa = "kubectl get networkpolicy -A";
      kgnpn = "kubectl get networkpolicy --namespace";
      kenp = "kubectl edit networkpolicy";
      kenpn = "kubectl edit networkpolicy --namespace";
      kdelnp = "kubectl delete networkpolicy";
      kdelnpn = "kubectl delete networkpolicy --namespace";

      kcv = "kubectl config view";
      kcgc = "kubectl config get-contexts";
      kcuc = "kubectl config use-context";
      kcsccn = "kubectl config set-context --current --namespace";

      kaf = "kubectl apply -f";
      ksh = "kubectl exec -it";
      ktp = "kubectl top pod";
      ktn = "kubectl top node";

      tg = "terragrunt";
      tga = "terragrunt apply";
      tgp = "terragrunt plan";
      tf = "terraform";
      tfa = "terraform apply";
      tfp = "terraform plan";

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
    '';
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
