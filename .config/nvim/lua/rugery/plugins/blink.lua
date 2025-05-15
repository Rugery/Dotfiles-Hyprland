return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  event = "InsertEnter",
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = {
        auto_show = true,  -- Asegúrate de usar un valor booleano válido
      },
      menu = {
        draw = {
          treesitter = { "lsp" },  -- Corregir "tressitter" a "treesitter"
        },
      },
      ghost_text = {
        enabled = true,  -- Asegúrate de que "vim.g.ai_cmp" esté definido o usa true
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = {
    "sources.default",
    "sources.completion.enabled_providers",
  },
}
