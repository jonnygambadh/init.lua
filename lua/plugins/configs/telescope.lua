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
    command_palette = {
      { "CommentBox",
        { "Left aligned line", ':CBline3' },
        { "Centered line", ':CBcline3' },
        { "Left aligned box of fixed size with Left aligned text", ':CBlbox' },
        { "Centered box of fixed size with Left aligned text", ':CBclbox' },
        { "Left aligned box of fixed size with centered text", ':CBcbox' },
        { "Centered box of fixed size with centered text", ':CBccbox' },
        { "Left aligned adapted box with Left aligned text", ':CBalbox' },
        { "Centered adapted box with Left aligned text", ':CBaclbox' },
        { "Left aligned adapted box with centered text", ':CBacbox' },
        { "Centered adapted box with centered text", ':CBaccbox' },
      },
      { "Vim",
        { "reload vimrc", ":source $MYVIMRC" },
      },
      {
        "GitSigns",
        { "Change base to master", ":Gitsigns change_base master global" },
      }
    },
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

local previewers = require("telescope.previewers")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local changed_on_branch = function()
  pickers
      .new({
        results_title = "Modified on current branch",
        finder = finders.new_oneshot_job({
          "git",
          "diff",
          "--name-only",
          "--relative",
          "master",
        }),
        sorter = sorters.get_fuzzy_file(),
        previewer = previewers.new_termopen_previewer({
          get_command = function(entry)
            return { "git", "diff", "--relative", "master", entry.value }
          end,
        }),
      })
      :find()
end

vim.api.nvim_create_user_command("MB", changed_on_branch, {})

require('telescope').load_extension('fzf')
require('telescope').load_extension("adjacent")
require('telescope').load_extension('tailiscope')
require('telescope').load_extension('command_palette')
