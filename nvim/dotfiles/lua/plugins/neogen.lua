return {
  "danymat/neogen",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
    vim.api.nvim_set_keymap("n", "<leader>mc", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
  end

}
