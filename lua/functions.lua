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
function M.check_work_env()
  if vim.uv.fs_stat(workvimpath) then return true else return false end
end

function M.neovide()
  if vim.g.neovide then return true else return false end
end

function M.bigfile()
  if vim.fn.getfsize(vim.fn.expand("%:p:f")) < 1.5 * 1024 * 1024
  then
    return true
  else
    return false
  end
end

--------------------------- live preview of [Scratch] buffers ---------------------
-- live-preview.nvim works entirely off the buffer *name*: `:LivePreview start`
-- previews the file named by the buffer and pushes edits on TextChanged.
-- [Scratch] buffers (goose, Snacks) are `nofile` with no `.md` name, so the
-- command silently previews some *other* buffer - or errors. Mirror the buffer
-- to a temp file and push its own edits to the browser instead.
local scratch_root = vim.fn.stdpath("data") .. "/scratch-preview"
local scratch = {} ---@type table<integer, { mirror: string, timer: uv.uv_timer_t }>

-- buffer handle 0 means "current", but it is not a usable state key
local function bufnr(buf)
  return (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
end

-- same test as the goose wrap autocmd (plugins/ai.lua)
function M.scratch_buffer(buf)
  buf = bufnr(buf)
  if not vim.api.nvim_buf_is_valid(buf) then return false end
  local name = vim.api.nvim_buf_get_name(buf)
  return vim.bo[buf].buftype == "nofile"
    or name:match("%[Scratch%]") ~= nil
    or name == ""
end

local function scratch_file(buf, name)
  name = name:gsub("[^%w%-_%.]", "-"):gsub("^[-%.]+", ""):gsub("[-%.]+$", "")
  if #name > 40 then name = name:sub(1, 40) end
  if #name == 0 then name = "scratch" end
  return vim.fs.joinpath(scratch_root, ("%s-%d.md"):format(name, buf))
end

--- write the buffer to its mirror file, return the content
local function write_mirror(buf, state)
  if not vim.api.nvim_buf_is_valid(buf) then return nil end
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  vim.fn.writefile(lines, state.mirror)
  return table.concat(lines, "\n")
end

--- keep the mirror file and any open preview tab in sync
local function push_mirror(buf, state)
  local content = write_mirror(buf, state)
  if not content then return end
  local ok, server = pcall(require, "livepreview.server")
  if not ok then return end
  local websocket = require("livepreview.server.websocket")
  local message = { filepath = state.mirror, type = "update", content = content }
  for _, client in ipairs(server.connecting_clients) do
    websocket.send_json(client, message)
  end
end

local function watch_scratch(buf, state)
  local flush = vim.schedule_wrap(function() push_mirror(buf, state) end)
  vim.api.nvim_buf_attach(buf, false, {
    -- TextChanged misses edits made through the API (goose writes with
    -- nvim_buf_set_lines), on_lines catches both those and typing
    on_lines = function() state.timer:start(150, 0, flush) end,
    on_detach = function()
      state.timer:stop()
      if not state.timer:is_closing() then state.timer:close() end
      vim.uv.fs_unlink(state.mirror)
      scratch[buf] = nil
    end,
  })
end

--- preview a [Scratch] buffer in the browser, live-updating as it changes
function M.preview_scratch(buf)
  buf = bufnr(buf)
  vim.fn.mkdir(scratch_root, "p")

  local state = scratch[buf]
  if not state then
    state = { mirror = scratch_file(buf, vim.api.nvim_buf_get_name(buf)), timer = vim.uv.new_timer() }
    scratch[buf] = state
    watch_scratch(buf, state)
  end

  local ok, lp = pcall(require, "livepreview")
  if not ok then
    vim.notify("live-preview.nvim is not installed", vim.log.levels.ERROR)
    return
  end
  local config = require("livepreview.config").config
  -- the mirror lives outside the project, so the server has to serve from its dir
  local dynamic_root = config.dynamic_root
  config.dynamic_root = true
  local started = lp.start(state.mirror, config.port)
  config.dynamic_root = dynamic_root
  if not started then return end

  local url = ("http://%s:%d/%s"):format(config.address, config.port, vim.uri_encode(vim.fs.basename(state.mirror)))
  write_mirror(buf, state)
  print("live-preview.nvim: Opening browser at " .. url)
  require("livepreview.utils").open_browser(url, config.browser)
  return url
end

return M
