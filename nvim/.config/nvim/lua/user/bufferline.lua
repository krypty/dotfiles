require("bufferline").setup {
  options = {
    show_buffer_close_icons = false,
    show_buffer_icons = true,
    get_element_icon = function(e)
      return require('nvim-web-devicons').get_icon(e.name, {default=false})
    end,
    color_icons = true,
    always_show_bufferline = false,
    indicator = {
        style = 'underline',
    },
  }
}
