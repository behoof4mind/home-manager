-- Leaner dap-ui: default layout stacks 4 mostly-empty panes left and starves the
-- bottom repl. Keep scopes+stacks left, tall repl bottom; float breakpoints/watches
-- on demand instead of parking them in the layout.
return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      -- on stop, jump to a window already showing the file, else the biggest
      -- normal code window — never replace a dap-ui pane (repl/logs) with code
      require("dap").defaults.fallback.switchbuf = function(bufnr, line, column)
        local wins = vim.api.nvim_tabpage_list_wins(0)
        for _, win in ipairs(wins) do
          if vim.api.nvim_win_get_buf(win) == bufnr then
            vim.api.nvim_set_current_win(win)
            pcall(vim.api.nvim_win_set_cursor, win, { line, column - 1 })
            return
          end
        end
        local best, best_area = nil, -1
        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_win_get_config(win).relative == "" and vim.bo[buf].buftype == "" then
            local area = vim.api.nvim_win_get_width(win) * vim.api.nvim_win_get_height(win)
            if area > best_area then
              best, best_area = win, area
            end
          end
        end
        if not best then
          vim.cmd("vsplit")
          best = vim.api.nvim_get_current_win()
        end
        vim.api.nvim_win_set_buf(best, bufnr)
        vim.api.nvim_set_current_win(best)
        pcall(vim.api.nvim_win_set_cursor, best, { line, column - 1 })
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.65 }, -- variables: the pane you actually read
            { id = "stacks", size = 0.35 },
          },
          position = "left",
          size = 45,
        },
        {
          elements = {
            { id = "repl", size = 1.0 }, -- app output lands here (internalConsole)
          },
          position = "bottom",
          size = 15,
        },
      },
    },
    keys = {
      {
        "<leader>dq",
        function()
          require("dapui").float_element("breakpoints", { enter = true })
        end,
        desc = "Breakpoints (float)",
      },
      {
        "<leader>dW",
        function()
          require("dapui").float_element("watches", { enter = true })
        end,
        desc = "Watches (float)",
      },
    },
  },
}
