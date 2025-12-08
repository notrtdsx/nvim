# dots

My personal dotfiles repository - a work in progress.

## Overview

This repository contains my personal configuration files (dotfiles) for various applications and tools. Dotfiles are configuration files that typically begin with a dot (`.`) and are usually hidden in Unix-like operating systems. They allow you to customize your development environment and keep your settings synchronized across multiple machines.

## Purpose

The main goals of this repository are to:

- **Backup**: Keep configuration files safely version controlled
- **Synchronize**: Share the same configurations across multiple machines
- **Track Changes**: Maintain a history of configuration changes over time
- **Share**: Document my setup for others who might find it useful

## Repository Structure

Once populated, this repository will be organized as follows:

```
dots/
├── .config/           # XDG config directory files
│   ├── nvim/         # Neovim configuration
│   ├── tmux/         # Tmux configuration
│   └── ...           # Other app configs
├── shell/            # Shell configuration files
│   ├── .bashrc       # Bash configuration
│   ├── .zshrc        # Zsh configuration
│   └── aliases       # Shell aliases
├── git/              # Git configuration
│   └── .gitconfig    # Git config file
├── scripts/          # Utility scripts
│   └── install.sh    # Installation script
└── README.md         # This file
```

## Installation

### Prerequisites

Before installing, ensure you have:

- Git installed
- Backup of your current dotfiles (just in case!)

### Quick Start

1. **Clone the repository**

   ```bash
   git clone https://github.com/notrtdsx/dots.git ~/dots
   cd ~/dots
   ```

2. **Create symlinks** (once dotfiles are added)

   You can manually create symbolic links to your home directory:

   ```bash
   # Example for when files exist:
   ln -s ~/dots/.config/nvim ~/.config/nvim
   ln -s ~/dots/shell/.bashrc ~/.bashrc
   ```

3. **Or use an installation script** (to be added)

   ```bash
   ./scripts/install.sh
   ```

### Manual Installation

For more control, you can selectively link individual configuration files:

```bash
# Example commands (adjust paths as needed):
ln -sf ~/dots/shell/.zshrc ~/.zshrc
ln -sf ~/dots/git/.gitconfig ~/.gitconfig
```

## Common Dotfiles to Include

Here are some configuration files commonly managed in dotfiles repositories:

### Shell Configuration
- `.bashrc`, `.bash_profile` - Bash shell configuration
- `.zshrc`, `.zprofile` - Zsh shell configuration
- `.profile` - Shell-agnostic profile

### Editor Configuration
- `.vimrc` - Vim configuration
- `.config/nvim/` - Neovim configuration
- `.emacs`, `.emacs.d/` - Emacs configuration

### Version Control
- `.gitconfig` - Git configuration
- `.gitignore_global` - Global Git ignore patterns

### Terminal Multiplexers
- `.tmux.conf` - Tmux configuration
- `.screenrc` - GNU Screen configuration

### Development Tools
- `.config/` - Modern application configs (XDG Base Directory)
- `.editorconfig` - Editor configuration for consistent coding styles

## Usage

After installation, your configurations will be active. Any changes made to the dotfiles in this repository will be reflected in your system (if using symlinks), and vice versa.

### Updating Configurations

1. Edit the dotfiles in this repository
2. Commit and push your changes:

   ```bash
   cd ~/dots
   git add .
   git commit -m "Update configuration"
   git push
   ```

### Syncing to Another Machine

1. Clone this repository
2. Run the installation script or create symlinks
3. Your configuration is ready!

## Troubleshooting

### Symlinks Not Working

If configurations aren't being applied:

- Verify symlinks are created correctly: `ls -la ~/`
- Check if the target file/directory already exists and isn't a symlink
- Ensure applications are restarted after linking configs

### Conflicts with Existing Files

Before creating symlinks, backup existing configurations:

```bash
mv ~/.bashrc ~/.bashrc.backup
mv ~/.gitconfig ~/.gitconfig.backup
```

### Permission Issues

Ensure scripts have execute permissions:

```bash
chmod +x scripts/install.sh
```

## Contributing

This is a personal repository, but feel free to:

- Open issues for suggestions or questions
- Fork the repo and adapt it for your own use
- Submit pull requests if you notice improvements

## Resources

### Learning About Dotfiles

- [GitHub Dotfiles Guide](https://dotfiles.github.io/)
- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles) - A curated list of dotfiles resources

### Inspiration

Check out other dotfiles repositories for ideas:

- Search GitHub for "dotfiles" to see how others organize their configs
- Look for dotfiles specific to your tools (e.g., "neovim dotfiles", "zsh dotfiles")

## License

This project is licensed under the Unlicense - see the [LICENSE](LICENSE) file for details.

## Status

🚧 **Work in Progress** - Dotfiles will be added gradually as I refine my configurations.
