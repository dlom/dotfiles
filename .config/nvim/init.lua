-- small global helper to inspect things
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end

local indent = 4
vim.opt.expandtab = false -- Use spaces instead of tabs
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.mouse = "a" -- Useful when browsing
vim.opt.clipboard = "unnamedplus" -- Put those yanks in my os clipboards
vim.opt.ignorecase = true -- Ignore case
vim.opt.incsearch = true -- Make search behave like modern browsers
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers

require("plugins")
