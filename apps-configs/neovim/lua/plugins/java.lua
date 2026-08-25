-- internalConsole: avoid nvim-dap runInTerminal ("requires unmodified buffer" bug on restart);
-- debuggee output goes to the dap-ui REPL/console pane instead of a terminal buffer
-- stepFilters: step-into skips JDK/library/synthetic frames, lands in own code only
local config_overrides = {
  console = "internalConsole",
  stepFilters = {
    skipClasses = { "$JDK", "$Libraries" },
    skipSynthetics = true,
    skipStaticInitializers = true,
  },
}

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Large maven monorepos (SecuTransfer: ~35 modules) OOM/thrash jdtls on its
      -- default heap; extend cmd instead of replacing it so the lombok javaagent
      -- arg from the LazyVim java extra survives
      vim.list_extend(opts.cmd, {
        "--jvm-arg=-Xmx4g",
        "--jvm-arg=-XX:+UseParallelGC",
      })
      opts.dap.config_overrides = config_overrides
      opts.dap_main.config_overrides = config_overrides
      return opts
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Attach to a JVM started with -agentlib:jdwp=...address=*:5005
      -- (SecuTransfer: `mise run serve:debug`). jdtls' main-class discovery
      -- merges by name, so this manual entry survives.
      local dap = require("dap")
      dap.configurations.java = dap.configurations.java or {}
      table.insert(dap.configurations.java, {
        type = "java",
        request = "attach",
        name = "Attach to JVM :5005",
        hostName = "127.0.0.1",
        port = 5005,
      })
    end,
  },
}
