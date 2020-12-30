function _G.__fzf_files()
  -- Launch file search using FZF
  if vim.fn.isdirectory(".git") then
    -- if in a git project, use :GFiles
    vim.cmd [[GFiles --cached --others --exclude-standard --full-name]]
  else
    -- otherwise, use :FZF
    vim.cmd [[Files]]
  end
end

return function()
  -- since this mutates an environment variable we check that it has already
  -- been appended before attempting to append it again
  local opts = " --bind=ctrl-a:select-all --layout=reverse"
  if vim.fn.stridx(vim.fn.expand("$FZF_DEFAULT_OPTS"), opts) == -1 then
    vim.env.FZF_DEFAULT_OPTS = vim.env.FZF_DEFAULT_OPTS .. opts
  end

  local function build_quickfix_list(lines)
    vim.fn.setqflist(
      vim.tbl_map(
        function(line)
          return {filename = line}
        end,
        lines
      )
    )
    vim.cmd [[copen]]
  end

  vim.g.fzf_action = {
    -- ["ctrl-l"] = build_quickfix_list,
    ["ctrl-t"] = "tab split",
    ["ctrl-e"] = "tab edit",
    ["ctrl-s"] = "split",
    ["ctrl-v"] = "vsplit"
  }

  vim.g.fzf_nvim_statusline = 1
  vim.g.fzf_buffers_jump = 0

  -- Customize fzf colors to match your color scheme
  -- bg+ controls the highlight of the selected item
  vim.g.fzf_colors = {
    fg = {"fg", "Normal"},
    border = {"fg", "Comment"},
    hl = {"fg", "Comment"},
    ["fg+"] = {"fg", "CursorLine", "CursorColumn", "Normal"},
    ["bg+"] = {"bg", "Visual", "PmenuSel", "CursorColumn"},
    ["hl+"] = {"fg", "Statement"},
    info = {"fg", "PreProc"},
    prompt = {"fg", "Conditional"},
    pointer = {"fg", "Exception"},
    marker = {"fg", "Keyword"},
    spinner = {"fg", "Label"},
    header = {"fg", "Comment"}
  }

  vim.g.fzf_preview_window = "right:55%"

  require("as.autocommands").create(
    {
      FzfSettings = {
        {"Filetype", "fzf", "setlocal winblend=7"}
      }
    }
  )

  vim.g.fzf_layout = {
    window = {width = 0.8, height = 0.7, border = "rounded"}
  }

  vim.cmd [[command! -bang -nargs=* Rg
      call fzf#vim#grep(
          \ 'rg --hidden --column --line-number --no-heading  --glob "!.git"'.
          \ ' --color=always --smart-case -- '.shellescape(<q-args>), 1,
          \ fzf#vim#with_preview(), <bang>0
          \)
        ]]

  vim.cmd [[
  command! -bang -nargs=* Find call fzf#vim#grep(
    \ 'rg --column --line-number --no-heading'.
    \ '--fixed-strings --ignore-case --no-ignore --hidden'.
    \ '--glob "!.git"'.
    \ '--follow  --color "always" '.shellescape(<q-args>), 1, <bang>0
    \)]]

  -- FIXME: this includes git excluded files
  vim.cmd [[command! -bang Dots call fzf#vim#files(g:dotfiles, fzf#vim#with_preview(), <bang>0)]]
  vim.cmd [[command! -bang WikiSearch call fzf#vim#files(g:wiki_path, fzf#vim#with_preview(), <bang>0)]]

  local map = as_utils.map

  map("n", "<C-P>", [[<cmd> lua __fzf_files()<CR>]])
  map("n", "<leader>gS", "<cmd>GFiles?<cr>")
  map("n", "<leader>ff", "<cmd>Files<cr>")
  map("n", "<leader>fd", "<cmd>Dots<CR>")
  map("n", "<leader>fo", "<cmd>Buffers<CR>")
  map("n", "<leader>fh", "<cmd>History<CR>")
  map("n", "<leader>fc", "<cmd>Commits<CR>")
  map("n", "<leader>f?", "<cmd>Helptags<CR>")
  map("n", "<leader>fs", "<cmd>Rg<CR>")
  -- Find Word under cursor
  map("n", "<leader>fw", "<cmd>Find <C-R><C-W><CR>")
end
