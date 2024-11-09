return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.mapping["<C-b>"] = cmp.mapping.scroll_docs(-4)
    opts.mapping["<C-f>"] = cmp.mapping.scroll_docs(4)
    opts.mapping["<C-e>"] = cmp.mapping.abort()
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = true }

    cmp.setup {
      snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
      },
    }
  end,
}
