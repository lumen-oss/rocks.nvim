# Introduction

Welcome to the `lux.nvim` documentation! `lux.nvim` is a Neovim plugin manager that works differently than the rest -
instead of using `git` to pull down code repositories, it instead uses `luarocks.org`, a site for hosting Lua code.

By reusing proper programming infrastructure, lux gains access to multiple first-class features like versioning, build scripts,
dependencies, build dependencies, testing infrastructure, a centralized place for discovering plugins and more! This means that developers
can freely write more sophisticated, modern plugins and all users need to do is `:Lux add the-plugin` to install it.

## Usage

Using lux is incredibly intuitive and is broken down into a few categories: finding a plugin, installing it and configuring it.

### Finding Plugins

After typing `:Lux add ` into the command bar you may press <Tab> to trigger tab completion. This will supply you with a list of all
possible installable packages.

If a plugin doesn't exist on `luarocks.org`, you may install plugins through git instead:
1. `:Lux add folke/which-key.nvim` - installs from `github.com/folke/which-key.nvim`
2. `:Lux add https://codeberg.org/amartin/fallo` - installs from an alternative git forge

### Installing Plugins

A plugin can be installed with `:Lux add <plugin-name>` .

If the plugin doesn't exist, you can install it directly from a git forge with
`:Lux add https://github.com/user/repository`.

For the full list of user commands, see `:h lux-nvim-commands`.

### Configuring Plugins

We recommend installing [`lux-config.nvim`](https://github.com/lumen-oss/rocks-config.nvim) to configure your plugins with ease.
After installing, see `:h lux-config`.
