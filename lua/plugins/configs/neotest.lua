require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn test -u",
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
  },
  icons = {
    failed = "",
    passed = "",
    running = "",
    skipped = "",
    unknown = "",
  }
})
