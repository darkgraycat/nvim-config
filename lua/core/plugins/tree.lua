local settings = require('core.settings').get()

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = settings.window_border,
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = true,
  sources = {
    'filesystem',
    'buffers',
    'git_status',
  },
  source_selector = {
    winbar = true,
    statusline = false,
    content_layout = 'center',
    tabs_layout = 'equal',
  },
  window = {
    position = settings.neotree_position
  }
})
