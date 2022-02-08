local dap = require('dap')
local dap_go = require('dap-go')

--- Show a prompt to select a process pid
-- Adapted from
local function pick_process(searchname)
  local output = vim.fn.system({'ps', 'a'})
  local lines = vim.split(output, '\n')
  local procs = {}
  for _, line in pairs(lines) do
    -- output format
    --    " 107021 pts/4    Ss     0:00 /bin/zsh <args>"
    local parts = vim.fn.split(vim.fn.trim(line), ' \\+')
    local pid = parts[1]
    local name = table.concat({unpack(parts, 5)}, ' ')
    if pid and pid ~= 'PID' then
      pid = tonumber(pid)
      if pid ~= vim.fn.getpid() and (not pid or string.find(name, searchname)) then
        table.insert(procs, { pid = pid, name = name })
      end
    end
  end
  local label_fn = function(proc)
    return string.format("id=%d name=%s", proc.pid, proc.name)
  end
  local result = require('dap.ui').pick_one_sync(procs, "Select process", label_fn)
  return result and result.pid or nil
end

local function setup()
	dap_go.setup()

	dap.configurations.go = {
		{
			name = "heylogin backend";
			type = 'go';
			request = 'attach';
			mode = 'local';
			processId = function() return pick_process('backend') end;
		},
	}
end

return {
	setup = setup,
}

