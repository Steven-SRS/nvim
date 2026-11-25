require("config.lazy")

require("vim._core.ui2").enable({})
require("options")
require("keymaps")
require("autocmds")

require("config.telescope")
require("config.treesitter")
require("config.undotree")
require("config.mini")
require("config.dadbod")
require("config.inline-diagnostic")

vim.api.nvim_create_user_command("NewIpynb", function(opts)
  local filename = opts.args
  if filename == "" then
    vim.notify("Provide a filename, e.g. :NewIpynb notebook.ipynb", vim.log.levels.WARN)
    return
  end
  if not filename:match("%.ipynb$") then
    filename = filename .. ".ipynb"
  end
  vim.fn.writefile({
    "{",
    ' "cells": [],',
    ' "metadata": {',
    '  "kernelspec": {',
    '   "display_name": "Python 3",',
    '   "language": "python",',
    '   "name": "python3"',
    "  },",
    '  "language_info": {',
    '   "name": "python"',
    "  }",
    " },",
    ' "nbformat": 4,',
    ' "nbformat_minor": 5',
    "}",
  }, filename)
  vim.cmd.edit(vim.fn.fnameescape(filename))
end, { nargs = "?", complete = "file" })
