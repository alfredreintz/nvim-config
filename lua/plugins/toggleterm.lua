return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal  = require("toggleterm.terminal").Terminal

    toggleterm.setup{
      size = 20,
      open_mapping = [[<c-t>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal",  -- bottom split instead of float
      close_on_exit = false,
      shell = vim.o.shell,
    }

    local function run_current_file()
      local ft = vim.bo.filetype
      local file = vim.fn.expand('%')
      local file_dir = vim.fn.expand('%:p:h')

      local cmd = ""
      if ft == "python" then
        cmd = "cd " .. file_dir .. " && python3 " .. file
      elseif ft == "javascript" then
        cmd = "cd " .. file_dir .. " && node " .. file
      elseif ft == "php" then
        cmd = "cd " .. file_dir .. " && php " .. file
      else
        print("No run command configured for filetype: " .. ft)
        return
      end

      local term = Terminal:new({ cmd = cmd, hidden = true, close_on_exit = false })
      term:toggle()
    end

    -- Keybindings
    local opts = {noremap = true, silent = true}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

    vim.keymap.set('n', '<leader>r', run_current_file, {noremap = true, silent = true})
  end
}

