{ ... }:

{
  programs.git = {
    enable = true;
    includes = [
      {
          path = "~/.gitconfig-my-github";
          condition = "gitdir:~/MyGitHub/**";
      }
      {
          path = "~/.gitconfig-my-github";
          condition = "gitdir:~/.config/home-manager/**";
      }
      {
          path = "~/.gitconfig-my-github";
          condition = "gitdir:~/Workplace/other/";
      }
      {
          path = "~/.gitconfig-my-github";
          condition = "gitdir:~/Workplace/other/**";
      }
      {
          path = "~/.gitconfig-ftapi-github";
          condition = "gitdir:~/Workplace/ftapi/";
      }
      {
          path = "~/.gitconfig-ftapi-github";
          condition = "gitdir:~/Workplace/ftapi/**";
      }
    ];
    extraConfig = {
          core = {
            editor = "nvim";
            excludesfile = "~/.config/git/ignore";
          };
          psh = {
            default = "simple";
          };
          user = {
            username = "behoof4mind";
            name = "Denis Lavrushko";
          };
    };
    ignores = [
      "# Macos"
      ".DS_Store"
      "._.DS_Store"
      "**/.DS_Store"
      "**/._.DS_Store"
      ""
      "# VSCode"
      ".vscode/*"
      "!.vscode/settings.json"
      "!.vscode/tasks.json"
      "!.vscode/launch.json"
      "!.vscode/extensions.json"
      "!.vscode/*.code-snippets"
      ""
      "# Local History for Visual Studio Code"
      ".history/"
      ""
      "# Built Visual Studio Code Extensions"
      "*.vsix"
      ""
      "# Local .terraform directories"
      "**/.terraform/*"
      ""
      "# .tfstate files"
      "*.tfstate"
      "*.tfstate.*"
      ""
      "# Crash log files"
      "crash.log"
      "crash.*.log"
      ""
      "# Exclude all .tfvars files, which are likely to contain sensitive data, such as"
      "# password, private keys, and other secrets. These should not be part of version"
      "# control as they are data points which are potentially sensitive and subject"
      "# to change depending on the environment."
      "*.tfvars"
      "*.tfvars.json"
      ""
      "# Ignore override files as they are usually used to override resources locally and so"
      "# are not checked in"
      "override.tf"
      "override.tf.json"
      "*_override.tf"
      "*_override.tf.json"
      ""
      "# Ignore transient lock info files created by terraform apply"
      ".terraform.tfstate.lock.info"
      ""
      "# Helm dependencies"
      "**/charts/*.tgz"
    ];
  };
}
