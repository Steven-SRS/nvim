return {
  {
    "https://github.com/neovim/nvim-lspconfig",
    config = function()

    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "pyright",
        "laravel_lsp",
        -- "pint" --> Install manually using MasonInstall pint,
        "panache",
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

}
