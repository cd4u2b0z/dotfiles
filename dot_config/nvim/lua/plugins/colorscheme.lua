-- Nord Colorscheme Plugin
return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Nord theme settings
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true

    -- Load the colorscheme
    require('nord').set()
    
    -- Custom highlights for better Nord integration
    vim.cmd([[
      hi! link FloatBorder Normal
      hi! link NormalFloat Normal
      hi! link @punctuation.bracket.tsx @punctuation.bracket
      hi! link @tag.tsx @tag
      hi! link @tag.attribute.tsx @tag.attribute
    ]])
  end,
}