return {
  "ej-shafran/compile-mode.nvim",
  branch = "latest",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- you can disable colors by uncommenting this line
     no_baleia_support = true,
     default_command = "gcc"
  }
}
