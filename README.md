# Neovim Dotfiles

My personal, minimal, and efficient Neovim configuration.

---

## ✨ Features

- **Fast & Lightweight**: Lazy-loaded plugins for optimal performance
- **Modern UI**: Gruvbox theme, Lualine, Nvim-Tree, and custom icons
- **LSP & Autocompletion**: Mason, nvim-lspconfig, and nvim-cmp for C/C++ (clangd)
- **Productivity**: Telescope for fuzzy finding, Gitsigns, Autopairs, Comment, and Treesitter
- **Keybindings**: Leader-based mappings for LSP, file tree, and splits

---

## 📦 Plugins
   Plugin | Purpose |
 |--------|---------|
 | [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
 | [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme |
 | [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/Formatter/Linter installer |
 | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
 | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
 | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
 | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File tree |
 | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
 | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
 | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
 | [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-pairs |
 | [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Commenting |
 | [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |

---

## 🛠️ Installation

1. **Clone the repo**:
   ```sh
   git clone https://github.com/notrtdsx/nvimdots.git ~/.config/nvim
   ```
2. **Open Neovim**:
   ```sh
   nvim
   ```
   Plugins will install automatically via `lazy.nvim`.

---

## ⚙️ Requirements

- Neovim >= 0.9.0
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live grep)
- [fd](https://github.com/sharkdp/fd) (for Telescope file finding)
- [clangd](https://clangd.llvm.org/) (for C/C++ LSP)

---

## 🎹 Keybindings
 | Key | Action |
 |-----|--------|
 | `<leader>ff` | Telescope: Find files |
 | `<leader>fg` | Telescope: Live grep |
 | `<leader>fb` | Telescope: Buffers |
 | `<leader>e`  | Toggle NvimTree |
 | `gd` | LSP: Go to definition |
 | `K` | LSP: Hover |
 | `<leader>rn` | LSP: Rename |
 | `<leader>ca` | LSP: Code action |
 | `[d` / `]d` | Diagnostic: Previous/Next |
 | `<leader>b` | Build project (`make -j$(nproc)`) |
 | `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navigate splits |
