local actions = require('telescope.actions')


require('telescope').setup{
  defaults = {
    theme = "dropdown",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    results_title = false,
    preview_title = "Preview",
    preview_cutoff = 1, -- Preview should always show (unless previewer = false)
    width = 80,
    height = 70,
    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },
    mappings = {
      i = {
        ["<c-a>"] = actions.add_selected_to_qflist
      }
    }
  },
}

local M = {}
M.file_browser_cwd = function()
  require("telescope.builtin").file_browser({
    prompt_title = "Dotfiles",
    cwd = vim.fn.expand("%:p:h"),
  })
end
M.find_growers = function()
  require("telescope.builtin").find_files({
    prompt_title = "Growers-ui",
    cwd = "~/dev/growers-ui" 
  })
end

M.find_dotfiles= function()
  require("telescope.builtin").find_files({
    prompt_title = "dotfiles",
    cwd = "~/dev/dotfiles" 
  })
end


return M
