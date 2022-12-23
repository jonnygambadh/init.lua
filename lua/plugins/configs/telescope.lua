require('telescope').load_extension('fzf')
require('telescope').load_extension("adjacent")
require('telescope').load_extension('tailiscope')
local actions = require('telescope.actions')

local git_icons = {
  added = "",
  changed = "",
  copied = ">",
  deleted = "",
  unmerged = "‡",
  untracked = "?",
}

require('telescope').setup {
  defaults = {
    layout_strategy   = 'flex',
    file_sorter       = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix     = ' 🔍 ',
    color_devicons    = true,
    git_icons         = git_icons,
    sorting_strategy  = "ascending",
    layout_config     = {
      horizontal = {
        preview_cutoff = 100,
        preview_width = 0.5,
      },
      vertical = {
        preview_cutoff = 0.4,
      },
      flex = {
        flip_columns = 110,
      },
      height = 0.94,
      width = 0.86,
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    mappings          = {
      i = {
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<ESC>"] = actions.close,
      },
      n = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      }
    }
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
