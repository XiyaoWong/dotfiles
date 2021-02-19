local luv = vim.loop

local sep = "/"
local default_target = ".localrc.lua"

local M = {
  found_rc = nil
}

local echo = function(msg, hl)
  hl = hl or "Title"
  vim.api.nvim_echo({{msg, hl}}, true, {})
end

function M.open()
  if M.found_rc then
    vim.cmd("vsplit " .. M.found_rc)
  else
    echo("No LocalRC found")
  end
end

local function get_parent(str)
  local parts = vim.split(str, "[/\\]")
  parts[#parts] = nil
  return table.concat(parts, sep)
end

local function setup_localrc(path)
  require("as.autocommands").augroup(
    "LocalRC",
    {
      {
        events = {"BufWritePost"},
        target = {path},
        command = string.format([[lua require('as.localrc').reload('%s')]], path)
      }
    }
  )
end

local function load_rc(target, path)
  local success, msg = pcall(dofile, path)
  echo("Found " .. target .. " at " .. path)
  if success then
    setup_localrc(path)
  end
  local message = success and "Successfully loaded." or "Failed to load because: " .. msg
  echo(message)
end

function M.reload(path)
  vim.cmd("luafile " .. path)
  echo("Reloaded " .. path)
end

---@param path string|nil
---@param target string|nil
function M.load(path, target)
  path = path and #path > 0 and path or vim.fn.getcwd()
  target = target or default_target

  local found
  local is_home = path == os.getenv("HOME")
  if is_home then
    return
  end

  luv.fs_opendir(
    path,
    function(err, dir)
      if err then
        return vim.defer_fn(
          function()
            echo("[Local init @ " .. path .. " failed]: " .. err, "ErrorMsg")
          end,
          100
        )
      end
      repeat
        local entry = luv.fs_readdir(dir)
        if entry then
          for _, item in ipairs(entry) do
            if item and item.name == target then
              found = item
            end
          end
        end
      until not entry or found
      if found then
        vim.defer_fn(
          function()
            local rc_path = path .. sep .. found.name
            M.found_rc = rc_path
            load_rc(target, rc_path)
          end,
          100
        )
        return
      elseif not is_home then
        M.load(get_parent(path), target)
      end
    end
  )
end

--- trigger loading of localrc
---@param event string
---@param immediate boolean
function M.setup(event, immediate)
  immediate = immediate ~= nil and immediate or true
  if immediate then
    M.load()
  else
    event = event or "VimEnter"
    require("as.autocommands").augroup(
      "LoadLocalInit",
      {
        {
          events = {event},
          targets = {"*"},
          command = [[lua require("as.localrc").load()]]
        }
      }
    )
  end
  as_utils.command {
    "LocalrcEdit",
    function()
      require("as.localrc").open()
    end
  }
end

return M
