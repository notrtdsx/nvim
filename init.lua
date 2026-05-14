-- ========================
-- OPTIONS
-- ========================
local opt = vim.opt
opt.number         = true
opt.relativenumber = true
opt.tabstop        = 4
opt.shiftwidth     = 4
opt.expandtab      = true
opt.smartindent    = true
opt.wrap           = false
opt.scrolloff      = 8
opt.hlsearch       = false
opt.incsearch      = true
opt.termguicolors  = true
opt.signcolumn     = "yes"
opt.updatetime     = 100
opt.splitright     = true
opt.splitbelow     = true

-- ========================
-- LAZY.NVIM BOOTSTRAP
-- ========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================
-- PLUGINS
-- ========================
require("lazy").setup({
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "windwp/nvim-autopairs" },
  { "numToStr/Comment.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
})

-- ========================
-- COLORSCHEME
-- ========================
require("gruvbox").setup({
  contrast = "hard",  -- "hard", "medium", or "soft"
})
vim.cmd.colorscheme("gruvbox")

-- ========================
-- LSP
-- ========================
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "clangd" } })

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { 'compile_commands.json', 'CMakeLists.txt', '.git' },
})
vim.lsp.enable('clangd')

-- ========================
-- AUTOCOMPLETION
-- ========================
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>']     = cmp.mapping.select_next_item(),
    ['<S-Tab>']   = cmp.mapping.select_prev_item(),
    ['<CR>']      = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = { { name = 'nvim_lsp' } },
})

-- ========================
-- PLUGIN SETUP
-- ========================
require("telescope").setup({
  defaults = {
    prompt_prefix   = "> ",
    selection_caret = "> ",
    entry_prefix    = "  ",
    multi_icon      = "+ ",
  },
})

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file         = false,
        folder       = false,
        folder_arrow = true,
        git          = false,
      },
    },
  },
})

require("lualine").setup({
  options = {
    theme                = "gruvbox",
    section_separators   = { left = "", right = "" },
    component_separators = { left = "|", right = "|" },
    icons_enabled        = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})

require("gitsigns").setup({
  signs = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "-" },
    topdelete    = { text = "-" },
    changedelete = { text = "~" },
    untracked    = { text = "?" },
  },
})

require("nvim-autopairs").setup()
require("Comment").setup()

-- ========================
-- TREESITTER
-- Deferred so it only runs after lazy has fully installed it.
-- Safe on first launch and all subsequent ones.
-- ========================
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if ok then
      ts.setup({
        ensure_installed = { "c", "cpp", "cmake", "lua" },
        highlight        = { enable = true },
        indent           = { enable = true },
      })
    end
  end,
})

-- ========================
-- KEYBINDS
-- ========================
vim.g.mapleader = " "
local map = vim.keymap.set

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- File tree
map("n", "<leader>e",  "<cmd>NvimTreeToggle<cr>")

-- LSP
map("n", "gd",         vim.lsp.buf.definition)
map("n", "K",          vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "[d",         vim.diagnostic.goto_prev)
map("n", "]d",         vim.diagnostic.goto_next)

-- Build
map("n", "<leader>b",  "<cmd>!cd %:p:h/build && make -j$(nproc)<cr>")

-- Split navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
