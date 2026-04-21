local local_dir = vim.fn.expand("~/Workplace/other/kube-utils-nvim")
local use_local = vim.fn.isdirectory(local_dir) == 1

return {
  {
    "behoof4mind/kube-utils-nvim",
    dir = use_local and local_dir or nil,
    dependencies = { "nvim-telescope/telescope.nvim", "folke/which-key.nvim" },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("kube-utils-nvim").setup({})

      local kube_utils_mappings = {
        { "<leader>k", group = "Kubernetes" },
        { "<leader>kh", group = "Helm" },
        { "<leader>khT", "<cmd>HelmDryRun<CR>", desc = "Helm DryRun Buffer" },
        { "<leader>khb", "<cmd>HelmDependencyBuildFromBuffer<CR>", desc = "Helm Dependency Build" },
        { "<leader>khd", "<cmd>HelmDeployFromBuffer<CR>", desc = "Helm Deploy Buffer to Context" },
        { "<leader>khr", "<cmd>RemoveDeployment<CR>", desc = "Helm Remove Deployment From Buffer" },
        { "<leader>kht", "<cmd>HelmTemplateFromBuffer<CR>", desc = "Helm Template From Buffer" },
        { "<leader>khu", "<cmd>HelmDependencyUpdateFromBuffer<CR>", desc = "Helm Dependency Update" },
        { "<leader>kk", group = "Kubectl" },
        { "<leader>kkC", "<cmd>SelectSplitCRD<CR>", desc = "Download CRD Split" },
        { "<leader>kkD", "<cmd>DeleteNamespace<CR>", desc = "Kubectl Delete Namespace" },
        { "<leader>kkK", "<cmd>OpenK9s<CR>", desc = "Open K9s" },
        { "<leader>kka", "<cmd>KubectlApplyFromBuffer<CR>", desc = "Kubectl Apply From Buffer" },
        { "<leader>kkc", "<cmd>SelectCRD<CR>", desc = "Download CRD" },
        { "<leader>kkk", "<cmd>OpenK9sSplit<CR>", desc = "Split View K9s" },
        { "<leader>kkl", "<cmd>ToggleYamlHelm<CR>", desc = "Toggle YAML/Helm" },
        { "<leader>kl", group = "Logs" },
        { "<leader>klf", "<cmd>JsonFormatLogs<CR>", desc = "Format JSON" },
        { "<leader>klv", "<cmd>ViewPodLogs<CR>", desc = "View Pod Logs" },
      }

      require("which-key").add(kube_utils_mappings)
    end,
  },
}
