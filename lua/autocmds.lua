-- Treesitter attach to ipynb/markdown file
vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype

    -- Fallback for .ipynb buffers loaded via jupytext's BufReadCmd
    if ft == "" and vim.api.nvim_buf_get_name(buf):match("%.ipynb$") then
      ft = "markdown" -- change to "python" if you are using # %% format
      vim.bo[buf].filetype = ft
    end

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang)
    if not ok_add then
      return
    end

    pcall(vim.treesitter.start, buf, lang)
  end,
})
