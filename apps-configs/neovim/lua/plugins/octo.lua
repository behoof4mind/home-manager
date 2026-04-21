if vim.loop.os_uname().sysname == "Linux" then
  return {}
end

return {
  {
    "pwntester/octo.nvim",
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = "squash",
      picker = "snacks",
    },
  },
}
