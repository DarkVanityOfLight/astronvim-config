return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {
      hint_prefix = "󰯫 ",
    },
    config = function(_, opts) require("lsp_signature").setup(opts) end,
  },
}
