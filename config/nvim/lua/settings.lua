local options = {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  number = true,
  wrap = false,
  hidden = true,
  showmode = false,
  ignorecase = true,
  smartcase = true,
  lazyredraw = true,
  title = true,
  mouse = "a",
  cursorline = true,
  wildignorecase = true,
  wildmode = "longest:full",
  pumheight = 12,
  linebreak = true,
  signcolumn = "no",
  splitright = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
