# Neovim Configuration

A **minimal, efficient, and modern** Neovim setup powered by `[lazy.nvim](https://github.com/folke/lazy.nvim)`.  
Includes LSP, autocompletion, file exploration, syntax highlighting, and more.

---

## ✨ Features

- **Plugin Management**: `[lazy.nvim](https://github.com/folke/lazy.nvim)` for fast, lazy-loaded plugins.
- **LSP Support**: `[mason.nvim](https://github.com/williamboman/mason.nvim)` + `[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)` for language servers (e.g., `clangd` for C/C++).
- **Autocompletion**: `[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)` with LSP source.
- **File Explorer**: `[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)`.
- **Fuzzy Finder**: `[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)`.
- **Syntax Highlighting**: `[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)`.
- **Git Integration**: `[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)`.
- **UI Enhancements**:
  - Status line: `[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)`.
  - Indentation guides: `[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)`.
  - Color scheme: `[gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)`.
  - Auto-pairs: `[nvim-autopairs](https://github.com/windwp/nvim-autopairs)`.
  - Commenting: `[Comment.nvim](https://github.com/numToStr/Comment.nvim)`.

---

## 📥 Installation

### 1. Prerequisites

- [Neovim (≥ 0.9.0)](https://neovim.io/)
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) (recommended for icons)
- For C/C++ support: `[clangd](https://clangd.llvm.org/)`

### 2. Install the Configuration

Clone this repository to your Neovim config directory:

```sh
git clone https://github.com/notrtdsx/nvim.git ~/.config/nvim
```

### 3. Launch Neovim

Open Neovim (`nvim`). On first launch:

- `lazy.nvim` will **automatically install** itself and all plugins.
- Wait for the installation to complete (may take a few minutes).

### 4. Verify Installation

Run `:Lazy` in Neovim to open the plugin manager UI and confirm all plugins are installed.

---

## 🎯 Usage

### Keybindings


| Key           | Action                            |
| ------------- | --------------------------------- |
| `<leader>ff`  | Telescope: Find files             |
| `<leader>fg`  | Telescope: Live grep              |
| `<leader>fb`  | Telescope: Buffers                |
| `<leader>e`   | Toggle file explorer (nvim-tree)  |
| `gd`          | Go to definition (LSP)            |
| `K`           | Hover documentation (LSP)         |
| `<leader>rn`  | Rename symbol (LSP)               |
| `<leader>ca`  | Code actions (LSP)                |
| `[d` / `]d`   | Jump to previous/next diagnostic  |
| `<leader>b`   | Build project (`make -j$(nproc)`) |
| `<C-h/j/k/l>` | Navigate splits                   |


> **Note**: `<leader>` is mapped to **Space** (`` ).

### Commands

- `:Mason` – Manage LSP servers and tools.
- `:NvimTreeToggle` – Toggle file explorer.
- `:Telescope` – Open fuzzy finder.
- `:Lazy` – Manage plugins.

---

## 🛠️ Customization

### Adding Plugins

Edit the `require("lazy").setup({ ... })` block in `init.lua`:

```lua
require("lazy").setup({
  -- Add new plugins here, e.g.:
  { "plugin-repo/plugin-name", config = true },
})
```

Run `:Lazy sync` to install/update plugins.

### Changing Colorscheme

Modify the colorscheme in `init.lua`:

```lua
require("gruvbox").setup({ contrast = "hard" })
vim.cmd.colorscheme("gruvbox")  -- Change to your preferred scheme
```

### LSP Configuration

Add new language servers via `mason-lspconfig`:

```lua
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright", "tsserver" },
})
```

---

## 🐛 Troubleshooting

### Plugins Not Loading?

- Run `:Lazy sync` to force sync plugins.
- Check `:Lazy log` for errors.

### LSP Not Working?

- Ensure the language server is installed (`:Mason`).
- Verify filetypes are supported (e.g., `clangd` for C/C++).

### Font Issues?

Install a [Nerd Font](https://www.nerdfonts.com/) (e.g., `FiraCode Nerd Font`) and set it as your terminal font.
