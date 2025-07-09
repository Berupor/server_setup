vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd [[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
    ]]
  end
})