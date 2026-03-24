return {
  {
    "behoof4mind/kube-utils-nvim",
    dir = "/Users/denislavrushko/Workplace/other/kube-utils-nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "folke/which-key.nvim" },
    lazy = true,
    event = "VeryLazy",
    config = function()
      -- 1. Initialize the plugin (registers the <cmd> commands)
      require("kube-utils-nvim").setup({})

      -- 2. Register keybindings
      local kube_utils_mappings = {
        { "<leader>k", group = "Kubernetes" },
        -- Helm Commands
        { "<leader>kh", group = "Helm" },
        { "<leader>khT", "<cmd>HelmDryRun<CR>", desc = "Helm DryRun Buffer" },
        { "<leader>khb", "<cmd>HelmDependencyBuildFromBuffer<CR>", desc = "Helm Dependency Build" },
        { "<leader>khd", "<cmd>HelmDeployFromBuffer<CR>", desc = "Helm Deploy Buffer to Context" },
        { "<leader>khr", "<cmd>RemoveDeployment<CR>", desc = "Helm Remove Deployment From Buffer" },
        { "<leader>kht", "<cmd>HelmTemplateFromBuffer<CR>", desc = "Helm Template From Buffer" },
        { "<leader>khu", "<cmd>HelmDependencyUpdateFromBuffer<CR>", desc = "Helm Dependency Update" },
        -- Kubectl Commands
        { "<leader>kk", group = "Kubectl" },
        { "<leader>kkC", "<cmd>SelectSplitCRD<CR>", desc = "Download CRD Split" },
        { "<leader>kkD", "<cmd>DeleteNamespace<CR>", desc = "Kubectl Delete Namespace" },
        { "<leader>kkK", "<cmd>OpenK9s<CR>", desc = "Open K9s" },
        { "<leader>kka", "<cmd>KubectlApplyFromBuffer<CR>", desc = "Kubectl Apply From Buffer" },
        { "<leader>kkc", "<cmd>SelectCRD<CR>", desc = "Download CRD" },
        { "<leader>kkk", "<cmd>OpenK9sSplit<CR>", desc = "Split View K9s" },
        { "<leader>kkl", "<cmd>ToggleYamlHelm<CR>", desc = "Toggle YAML/Helm" },
        -- Logs Commands
        { "<leader>kl", group = "Logs" },
        { "<leader>klf", "<cmd>JsonFormatLogs<CR>", desc = "Format JSON" },
        { "<leader>klv", "<cmd>ViewPodLogs<CR>", desc = "View Pod Logs" },
      }

      require("which-key").add(kube_utils_mappings)
    end,
  },
}
