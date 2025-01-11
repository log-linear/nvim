local M = {}

-- callback for disabling modules
function M.disabled(lang, buf, max_filesize, max_line_count)
  local max_filesize = max_filesize or (50000 * 1024) -- 50000 KB
  local max_line_count = max_line_count or 50000  -- 50000 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  elseif vim.api.nvim_buf_line_count(buf) > max_line_count then
    return true
  else
    return false
  end
end

-- inverse of `disabled()` for disabling modules
function M.enabled()
  if M.disabled then
    return false
  else
    return true
  end
end

local workvimpath = vim.fn.stdpath("config") .. "/work.lua"
local check_work_env = function()
  if vim.loop.fs_stat(workvimpath) then return true else return false end
end

return M
