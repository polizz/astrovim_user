local M = {}

function M.lookup()
  local current_word = vim.call('expand','<cword>')
  local lookup_data = vim.fn.system("bun /Users/polizz/projects/qrz_lookup/index.ts " .. current_word)

  -- insert lookup data
  vim.cmd("normal! o" ..  lookup_data)

  -- put cursor on FREQ
  vim.cmd("normal! ^ f,;;w")
end

return M
