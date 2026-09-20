# Migration Guide for `rocks.nvim` Users

### Quick Introduction

The release of `rocks.nvim` 3.0.0 contains multiple large breaking changes, moving the backend from [`luarocks`](github.com/luarocks/luarocks)
to [lux](https://github.com/lumen-oss/lux), an embeddable and much more stable package management backend.
For this reason, we renamed the project to `lux.nvim`.
This guide discusses how to migrate your old `rocks.toml` file to the new `lux.toml` format with ease.

### Migrating `rocks.toml`

Lux works by treating your Neovim configuration as a *project* with dependencies, build steps and more.

- ##### Rename the File

  Rename your `~/.config/nvim/rocks.toml` to `~/.config/nvim/lux.toml`. Lux will
  now read this as a project file. Lux expects some simple metadata about your project, so paste the following
  snippet in the beginning of your `lux.toml` and tweak any of the values that you feel need changing:

  ```toml
  package = "neovim-config"
  version = "1.0.0"
  lua = "5.1" # NOTE: do not change this value

  [description]
  labels = [ "neovim" ]
  ```

- ##### Change `[plugins]` -> `[dependencies]`

  In `rocks.nvim`, plugins were described under the `[plugins]` section. Since we
  are using Lux, a general Lua package manager, we need to change this to
  `[dependencies]`. Everything else will continue to work just the same!

- ##### Change `[config]` -> `[neovim.config]`

  If you were a user of [`rocks-config.nvim`](https://github.com/lumen-oss/rocks-config.nvim), please rename all references
  of `[config]` -> `[neovim.config]` and `[config.options]` -> `[neovim.config.options]`.

### Remove `rocks-git.nvim`, `rocks-edit.nvim` and `rocks-dev.nvim`

The features these extensions provided are now natively supported in `lux.nvim` itself. That's three
less plugins in your configuration! :)

### `:Rocks` -> `:Lux`

We've renamed the `:Rocks` command to the shorter `:Lux`, with the following subcommands:
- `:Lux add` - installs a plugin
- `:Lux remove` - removes a plugin
- `:Lux update` - updates all plugins
- `:Lux sync` - updates or downgrades plugins to exactly match your `lux.toml`

The rest of the commands and their features can be found by running `:Lux --help`!

### Read the docs!

You can read all the available options for `lux.toml` via `:h lux-toml`, a general tutorial under `:h lux-guide`
and documentation for publishing Neovim plugins on luarocks.org at `:h lux-neovim-plugin-guide`.

We hope you enjoy the `lux.nvim`!
