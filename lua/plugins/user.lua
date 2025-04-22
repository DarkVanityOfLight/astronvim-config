-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  { "andweeb/presence.nvim" },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "  ╔════════════════════════════════════════════════╗",
        "  ║                                                ║",
        "  ║                                                ║",
        "  ║          .,,           .,,.                    ║",
        "  ║        ,lc,,ll ','  .cl:,,ll                   ║",
        "  ║      .ll.    ,l;,,cll.     ;occcccccccc,       ║",
        "  ║     .d,                     ;d         ,ll.    ║",
        "  ║    .d,                       lc          'o,   ║",
        "  ║    o:                        .x           .x   ║",
        "  ║   .xoc  ',;   ,'   ;;    .;c, d,          ,d   ║",
        "  ║   .xlo. .,, .;oo;  :;.   cxc, x.        .:o'   ║",
        "  ║    :o,''..   ,','         'c'cl .,,:::::ol     ║",
        "  ║    :o'',;;::::::::::::::::::lx:::''      ,l:   ║",
        "  ║  .lc                       'kll.           ,o; ║",
        "  ║ 'o,                       .oc:.l.    .,:c:::;. ║",
        "  ║  ;::oo::::::;;:::::;;;::::l':; .c;;::'. x      ║",
        "  ║     ;l                      :,          x      ║",
        "  ║     ,l                      l'          x      ║",
        "  ║     'o                      o.    .',::c;      ║",
        "  ║     .l::::::::::::::::::;;;,d:::::;,.          ║",
        "  ║                        ......                  ║",
        "  ║                                                ║",
        "  ╚════════════════════════════════════════════════╝",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    enabled = false,
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  { "hrsh7th/vim-vsnip" },
  { "windwp/nvim-ts-autotag" },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk = { out_dir = "build" }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local telescope = require "telescope"
      telescope.setup {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
        },
      }
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      shell = "/bin/fish",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
  },

  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
  },
}
