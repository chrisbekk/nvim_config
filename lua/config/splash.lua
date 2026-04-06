local function center_horizontal(lines)
  local width = vim.o.columns
  local out = {}

  for _, line in ipairs(lines) do
    local pad = math.floor((width - vim.fn.strdisplaywidth(line)) / 2)
    table.insert(out, string.rep(" ", math.max(0, pad)) .. line)
  end

  return out
end

local function center_vertical(lines)
  local height = vim.o.lines - vim.o.cmdheight
  local pad = math.floor((height - #lines) / 2)

  local out = {}
  for _ = 1, pad do
    table.insert(out, "")
  end

  vim.list_extend(out, lines)
  return out
end

local function git_branch()
  local handle = io.popen("git branch --show-current 2>/dev/null")
  if not handle then return "" end
  local branch = handle:read("*a"):gsub("%s+", "")
  handle:close()
  return branch ~= "" and (" " .. branch) or ""
end

local function recent_files()
  local files = {}
  for i = 1, math.min(5, #vim.v.oldfiles) do
    local f = vim.v.oldfiles[i]
    if vim.fn.filereadable(f) == 1 then
      table.insert(files, vim.fn.fnamemodify(f, ":~"))
    end
  end
  return files
end

local function project_name()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function startup_time()
  local ok, stats = pcall(function()
    return require("lazy").stats()
  end)

  if ok and stats then
    return string.format("%.2f ms", stats.startuptime)
  end

  return ""
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() > 0 then return end

    vim.cmd("enew")

    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "wipe"
    vim.bo.swapfile = false
    vim.bo.buflisted = false

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.cursorline = false

    local lines = {
      "DSOLVE > NVIM",
      "--------------",
      "",
      "project  " .. project_name(),
    }

    local branch = git_branch()
    if branch ~= "" then
      table.insert(lines, "branch   " .. branch)
    end

    table.insert(lines, "startup  " .. startup_time())
    table.insert(lines, "")

    local recent = recent_files()
    local recent_start = nil

    if #recent > 0 then
      table.insert(lines, "recent")
      recent_start = #lines + 1
      vim.list_extend(lines, recent)
    end

    lines = center_horizontal(lines)
    lines = center_vertical(lines)

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

    local ns = vim.api.nvim_create_namespace("splash")

    for i, line in ipairs(lines) do
      if line:find("DSOLVE > NVIM", 1, true) then
        local col = line:find("DSOLVE > NVIM", 1, true) - 1
        vim.api.nvim_buf_add_highlight(0, ns, "Title", i - 1, col, col + 14)
      end

      if line:match("^%s*recent") then
        local col = line:find("recent") - 1
        vim.api.nvim_buf_add_highlight(0, ns, "Keyword", i - 1, col, col + 6)
      end
    end

    -- dim recent files
    if recent_start then
      for i = recent_start, recent_start + #recent - 1 do
        local line = lines[i]
        if line then
          vim.api.nvim_buf_add_highlight(
            0,
            ns,
            "Comment",
            i - 1,
            0,
            -1
          )
        end
      end
    end
  end,
})
