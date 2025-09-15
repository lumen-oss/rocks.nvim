<!-- markdownlint-disable -->
<br />
<div align="center">
  <a href="https://github.com/lumen-oss/rocks.nvim">
    <img src="./rocks-header.svg" alt="rocks.nvim">
  </a>
  <p align="center">
    <br />
    <a href="./doc/rocks.txt"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/lumen-oss/rocks.nvim/issues/new?assignees=&labels=bug">Report Bug</a>
    ·
    <a href="https://github.com/lumen-oss/rocks.nvim/issues/new?assignees=&labels=enhancement">Request Feature</a>
    ·
    <a href="https://github.com/lumen-oss/rocks.nvim/discussions/new?category=q-a">Ask Question</a>
  </p>
  <p>
    <strong>
      A modern approach to <a href="https://neovim.io/">Neovim</a> plugin management!
    </strong>
  </p>
  <p>🌒</p>
</div>
<!-- markdownlint-restore -->

> [!WARNING]
>
> rocks.nvim will be [undergoing a major rewrite](https://github.com/lumen-oss/rocks.nvim/issues/539)
> soon. If you're considering switching from another plugin manager
> and you'd like to avoid churn,
> we recommend you wait for rocks.nvim v3.0.0.

## :star2: Features

- Automatic dependency and build script management.
- True [semantic versioning](https://semver.org/)!
- `Cargo`-like `rocks.toml` file for declaring all your plugins.
- Name-based installation
  (` "nvim-neorg/neorg" ` becomes `:Rocks install neorg` instead).
- Supports [multiple versions of the same dependency](https://github.com/luarocks/luarocks/wiki/Using-LuaRocks#multiple-versions-using-the-luarocks-package-loader).
- Minimal, non-intrusive UI.
- Async execution.
- Extensible, with a Lua API.
  - [`rocks-git.nvim`](https://github.com/lumen-oss/rocks-git.nvim)
    for installing from git repositories.
  - [`rocks-config.nvim`](https://github.com/lumen-oss/rocks-config.nvim)
    for plugin configuration.
  - [`rocks-lazy.nvim`](https://github.com/lumen-oss/rocks-lazy.nvim)
    for lazy-loading.
  - [`rocks-treesitter.nvim`](https://github.com/lumen-oss/rocks-treesitter.nvim)
    for automatic tree-sitter parser management.
  - And [more...](https://github.com/topics/rocks-nvim)
- Command completions for plugins and versions on luarocks.org.
- Binary rocks pulled from [rocks-binaries](https://lumen-oss/rocks-binaries/)
  so you don't have to compile them.

![demo](https://github.com/lumen-oss/rocks.nvim/assets/12857160/ce678546-76a7-4fdc-b822-e43d51652681)

## :moon: Introduction

rocks.nvim revolutionizes Neovim plugin management by streamlining the way users
and developers handle plugins and dependencies.
Integrating directly with [`luarocks`](https://luarocks.org),
this plugin offers an automated approach that shifts the responsibility
of specifying dependencies and build steps from users to plugin authors.

### :grey_question: Why rocks.nvim

The traditional approach to Neovim plugin management often places
an unjust burden on users, by requiring them to declare dependencies and
build instructions manually.

This comes with several pain points:

- **Breaking changes:**
  Updates to a plugin's dependencies or build instructions
  can lead to breaking changes for users.
- **Platform-specific complexity:**
  Both dependencies and build instructions may vary by platform,
  adding complexity for users.
- **Poor user experience:**
  Because of this horrible UX, plugin authors have been reluctant to add dependencies,
  preferring to copy/paste Lua code instead,
  often reinventing the wheel in a suboptimal manner.

Other more modern approaches rely on plugin authors
providing this information in their source repositories.
We have a detailed article explaining why we chose a different approach [here](https://github.com/lumen-oss/rocks.nvim/wiki/What-about-packspec-(pkg.json)%3F).

With rocks.nvim, installing a plugin is as simple as entering the command:

```
:Rocks install foo.nvim
```

Welcome to a new era of Neovim plugin management - where simplicity meets efficiency!

### :milky_way: Philosophy

rocks.nvim itself is designed based on the UNIX philosophy:
Do one thing well.

It doesn't dictate how you as a user should configure your plugins.
But there's an optional module for those seeking
additional configuration capabilities: [`rocks-config.nvim`](https://github.com/lumen-oss/rocks-config.nvim).

We have packaged [many Neovim plugins and tree-sitter parsers](https://luarocks.org/modules/neorocks)
for luarocks, and an increasing number of plugin authors
[have been publishing themselves](https://luarocks.org/labels/neovim?non_root=on).
Additionally, [`rocks-git.nvim`](https://github.com/lumen-oss/rocks-git.nvim)
ensures you're covered even when a plugin isn't directly available on LuaRocks.

### :deciduous_tree: Enhanced tree-sitter support

> [!WARNING]
>
> **We are not affiliated with the nvim-treesitter maintainers.
> If you are facing issues with tree-sitter support in rocks.nvim,
> please don't bug them.**

We're revolutionizing the way Neovim users and plugin developers
interact with tree-sitter parsers.
With the introduction of the [Neovim User Rocks Repository (NURR)](https://github.com/lumen-oss/nurr),
we have automated the packaging and publishing of many plugins and curated[^2] tree-sitter parsers
for luarocks, ensuring a seamless and efficient user experience.

[^2]: We only upload parsers which we can install in the NURR CI
      (tested on Linux).

When installing, rocks.nvim will also search our [rocks-binaries (dev)](https://lumen-oss/rocks-binaries-dev/)
server, which means you don't even need to compile any parsers
on your machine.

#### Effortless installation for users

If you need a tree-sitter parser for syntax highlighting or other features,
you can easily install them with rocks.nvim: `:Rocks install tree-sitter-<lang>`.

They come bundled with queries, so once installed,
all you need to do is run `vim.treesitter.start()` to enable syntax highlighting[^3].

[^3]: You can put this in a `ftplugin/<filetype>.lua`, for example.

Or, you can use our [`rocks-treesitter.nvim`](https://github.com/lumen-oss/rocks-treesitter.nvim)
module, which can automatically install parsers and enable syntax highlighting for you.

> [!TIP]
>
> Bonus: With rocks.nvim, you can [**pin and roll back each tree-sitter parser individually!**](https://mrcjkb.dev/posts/2024-07-28-tree-sitter.html)

<!-- Or, if you want something that comes with lots of tree-sitter parsers and -->
<!-- automatically configures nvim-treesitter for you, -->
<!-- check out our [`rocks-treesiter.nvim` module](https://github.com/lumen-oss/rocks-treesitter.nvim). -->

#### Simplifying dependencies

For plugin developers, specifying a tree-sitter parser as a dependency
is now as straightforward as including it in their project's rockspec[^4].
This eliminates the need for manual parser management and ensures that
dependencies are automatically resolved and installed.

[^4]: [example](https://luarocks.org/modules/MrcJkb/neotest-haskell).

Example rockspec dependency specification:

```lua
dependencies = {
  "neotest",
  "tree-sitter-haskell"
}
```

## :pencil: Requirements

- An up-to-date `Neovim >= 0.10` installation.
- The `git` command line utility.
- `wget` or `curl` (if running on a UNIX system) - required for the remote `:source` command to work.
- `make` and `unzip`
  (if you want the install/bootstrap script to install luarocks).
- `netrw` enabled in your Neovim configuration - enabled by default but some configurations manually disable the plugin.
- A `lua 5.1` or `luajit` installation,
  including headers (for installing native libraries).
  Note that luarocks expects to be able to run Lua(jit)
  using the `lua` command.

> [!IMPORTANT]
>
> If you are running on an esoteric architecture (i.e. something different to
> Linux, Windows or MacOS), `rocks.nvim` will attempt to compile its
> dependencies instead of pulling a pre-built binary. For the process to succeed
> you must have a **C++17 parser** and **Rust toolchain** installed on your
> system.

## :inbox_tray: Installation

### :zap: Installation script (recommended)

The days of bootstrapping and editing your configuration are over.
`rocks.nvim` can be installed directly through an interactive installer within Neovim.

We suggest starting nvim without loading RC files, such that already installed plugins do not interfere
with the installer:

```sh
nvim -u NORC -c "source https://raw.githubusercontent.com/lumen-oss/rocks.nvim/master/installer.lua"
```

> [!IMPORTANT]
>
> For security reasons, we recommend that you read `:help :source`
> and the installer code before running it so you know exactly what it does.

> [!TIP]
>
> To configure the luarocks installation to use a specific lua install,
> use environment variables `LUA_BINDIR=<Directory of lua binary>` and `LUA_BINDIR_SET=yes`.
>
> For example:
>
> `LUA_BINDIR="${XDG_BIN_DIR:-$HOME/.local/bin}" LUA_BINDIR_SET=yes nvim -u NORC -c "source ...`

### :rocket: Bootstrapping Script

For those who want `rocks.nvim` to automatically install itself whenever it isn't installed
one may use the bootstrapping script. Place the following script into your `init.lua`:

<details>
<summary>Lua Script</summary>

```lua
do
    -- Specifies where to install/use rocks.nvim
    local install_location = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rocks")

    -- Set up configuration options related to rocks.nvim (recommended to leave as default)
    local rocks_config = {
        rocks_path = vim.fs.normalize(install_location),
    }

    vim.g.rocks_nvim = rocks_config

    -- Configure the package path (so that plugin code can be found)
    local luarocks_path = {
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

    -- Configure the C path (so that e.g. tree-sitter parsers can be found)
    local luarocks_cpath = {
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    -- Add rocks.nvim to the runtimepath
    vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))
end

-- If rocks.nvim is not installed then install it!
if not pcall(require, "rocks") then
    local rocks_location = vim.fs.joinpath(vim.fn.stdpath("cache") --[[@as string]], "rocks.nvim")

    if not vim.uv.fs_stat(rocks_location) then
        -- Pull down rocks.nvim
        local url = "https://github.com/lumen-oss/rocks.nvim"
        vim.fn.system({ "git", "clone", "--filter=blob:none", url, rocks_location })
        -- Make sure the clone was successfull
        assert(vim.v.shell_error == 0, "rocks.nvim installation failed. Try exiting and re-entering Neovim!")
    end

    -- If the clone was successful then source the bootstrapping script
    vim.cmd.source(vim.fs.joinpath(rocks_location, "bootstrap.lua"))

    vim.fn.delete(rocks_location, "rf")
end
```

</details>

Upon running `nvim` the bootstrapping script should engage!

> [!NOTE]
> If you would like to break down this snippet into separate files, *make sure*
> that the runtimepath and configuration snippet (the `do .. end` block) executes
> *before* the actual bootstrapping logic. You will get errors if you do it the other
> way around!

### :hammer: Manual installation

For manual installation, see [this tutorial](https://github.com/lumen-oss/rocks.nvim/wiki/Installing-rocks.nvim-manually,-without-the-installation-script).

## :books: Usage

See also [`:h rocks-nvim`](./doc/rocks.txt).

### Installing rocks

You can install rocks with the `:Rocks install {rock} {version?} {args[]?}` command.

Arguments:

- `rock`: The luarocks package.
- `version`: Optional. Used to pin a rock to a specific version.
            If omitted, rocks.nvim will install (or update to) the latest version.
- `args[]`: Optional arguments, e.g. `opt=true`, to prevent rocks.nvim
            from automatically sourcing a rock at startup.

Examples:

```vim
:Rocks install neorg
:Rocks install neorg 8.0.0
:Rocks install tree-sitter-toml dev
:Rocks install kanagawa.nvim opt=true
```

> [!NOTE]
>
> - The command provides fuzzy completions for rocks and versions on luarocks.org.
> - Installs the latest version if `version` is omitted.
> - This plugin keeps track of installed plugins in a `rocks.toml` file,
>   which you can commit to version control.
> - If you specify `dev` or `scm` as the version, luarocks will search the `dev`
>   manifest. This has the side-effect that it will prioritise `dev` versions
>   of any dependencies that aren't declared with version constraints.

### Updating rocks

- Running the `:Rocks update` command will update every available rock
  that is not pinned.

- `:Rocks update {rock}` will update `{rock}` to the latest version.
  The command provides completions for outdated luarocks packages
  and `scm`/`dev` rocks.

### Syncing rocks

The `:Rocks sync` command synchronizes the installed rocks with the `rocks.toml`.

> [!NOTE]
>
> - Installs missing rocks.
> - Ensures that the correct versions are installed.
> - Uninstalls unneeded rocks.

### Uninstalling rocks

To uninstall a rock and any of its dependencies,
that are no longer needed, run the `:Rocks prune {rock}` command.

> [!NOTE]
>
> - The command provides fuzzy completions for rocks that can safely
>   be pruned without breaking dependencies.

### Editing `rocks.toml`

The `:Rocks edit` command opens the `rocks.toml` file for manual editing.
Make sure to run `:Rocks sync` when you are done.

### Lazy loading plugins

> [!TIP]
>
> If you want more advanced lazy-loading capabilities,
> try out the [`rocks-lazy.nvim`](https://github.com/lumen-oss/rocks-lazy.nvim) module.

By default, `rocks.nvim` will source all plugins at startup.
To prevent it from sourcing a plugin, you can specify `opt = true`
in the `rocks.toml` file.

For example:

```toml
[plugins]
neorg = { version = "1.0.0", opt = true }
```

or

```toml
[plugins.neorg]
version = "1.0.0"
opt = true
```

You can then load the plugin with Neovim's built-in `:packadd {rock}` command[^1].

[^1]: `rocks.nvim` maintains symlinks to installed rocks' plugin directories in
      a `site/pack/luarocks/opt/{rock}` directory, so colorschemes, etc., are available
      before `rocks.nvim` initializes.
      See also [`:h packadd`](https://neovim.io/doc/user/repeat.html#%3Apackadd).

> [!NOTE]
>
> #### A note on loading rocks
>
> Luarocks packages are installed differently than you are used to
> from Git repositories.
>
> Specifically, `luarocks` installs a rock's Lua API to the [`package.path`](https://neovim.io/doc/user/luaref.html#package.path)
> and the [`package.cpath`](https://neovim.io/doc/user/luaref.html#package.cpath)
> It does not have to be added to Neovim's runtime path
> (e.g. using `:packadd`), for it to become available.
> This does not impact Neovim's startup time.
>
> Runtime directories ([`:h runtimepath`](https://neovim.io/doc/user/options.html#'runtimepath')),
> on the other hand, are installed to a separate location.
> Plugins that utilise these directories may impact startup time
> (if it has `ftdetect` or `plugin` scripts), so you may or may
> not benefit from loading them lazily.

> [!TIP]
>
> #### Should I lazy load plugins?
>
> Making sure a plugin doesn't unnecessarily impact startup time
> [should be the responsibility of plugin authors, not users](https://github.com/lumen-oss/nvim-best-practices?tab=readme-ov-file#sleeping_bed-lazy-loading).
> As is the case with dependencies, a plugin's functionality may evolve over
> time, potentially leading to breakage if it's the user who has
> to worry about lazy loading.
>
> A plugin that implements its own lazy initialization properly
> will likely have less overhead than the mechanisms used by a
> plugin manager or user to load that plugin lazily.
>
> If you find a plugin that takes too long to load,
> or worse, forces you to load it manually at startup with a
> call to a heavy `setup` function,
> consider opening an issue on the plugin's issue tracker.

### Pinning installed plugins

You can pin plugins with the `pin` field, so that they are skipped
by `:Rocks update`.

For example:

```toml
[plugins.neorg]
version = "7.0.0"
pin = true
```

Or

```vim
:Rocks install neorg 7.0.0 pin=true
```

You can also pin/unpin installed plugins with:

```vim
:Rocks [pin|unpin] {rock}
```

### Importing rocks toml files

You can break up your rocks configuration into different modules that
can then be imported into your main configuration. This can be useful
for modularity or simply for the purpose of supporting local
configuration files that you can keep outside of version control.

For example:

```toml
import = [
  "rocks-local.toml", # Paths are relative to the rocks.toml file directory by default
  "~/my-rocks.toml", # Path expansion is supported through vim.fn.expand
  "/home/user/my-rocks.toml", # Absolute paths are supported
]

```

> [!NOTE]
>
> - Imported config will have higher priority

## :calendar: User events

For `:h User` events that rocks.nvim will trigger, see `:h rocks.user-event`.

## :package: Extending `rocks.nvim`

This plugin provides a Lua API for extensibility.
See [`:h rocks-api`](./doc/rocks.txt) for details.

Following are some examples:

- [`rocks-git.nvim`](https://github.com/lumen-oss/rocks-git.nvim):
  Adds the ability to install plugins from git.
- [`rocks-config.nvim`](https://github.com/lumen-oss/rocks-config.nvim):
  Adds an API for safely loading plugin configurations.
- [`rocks-lazy.nvim`](https://github.com/lumen-oss/rocks-lazy.nvim):
  Adds lazy-loading abstractions and integrates with rocks-config.nvim.
- [`rocks-dev.nvim`](https://github.com/lumen-oss/rocks-dev.nvim):
  Adds an API for developing and testing luarocks plugins locally.
- [`rocks-treesitter.nvim`](https://github.com/lumen-oss/rocks-treesitter.nvim)
  Automatic highlighting and installation of tree-sitter parsers.
- And [more...](https://github.com/topics/rocks-nvim)


To extend `rocks.nvim`, simply install a module with `:Rocks install`,
and you're good to go!

## :stethoscope: Troubleshooting

The `:Rocks log` command opens a log file for the current session,
which contains the `luarocks` stderr output, among other logs.

## :link: projects related to neovim and luarocks

- [luarocks-tag-release](https://github.com/lumen-oss/luarocks-tag-release):
  A GitHub action that automates publishing to luarocks.org
- [NURR](https://github.com/lumen-oss/nurr):
  A repository that publishes Neovim plugins and tree-sitter parsers
  to luarocks.org
- [luarocks.nvim](https://github.com/vhyrro/luarocks.nvim):
  Adds basic support for installing lua rocks to [lazy.nvim](https://github.com/folke/lazy.nvim)


## :link: Other neovim plugin managers

- [lazy.nvim](https://github.com/folke/lazy.nvim): started luarocks support in
  version [11.X](https://lazy.folke.io/news#11x)
- [mini.deps](https://github.com/echasnovski/mini.deps)
- [paq-nvim](https://github.com/savq/paq-nvim)
- [pckr](https://github.com/lewis6991/pckr.nvim)
- [vim-plug](https://github.com/junegunn/vim-plug)

## :book: License

`rocks.nvim` is licensed under [GPLv3](./LICENSE).

## :green_heart: Contributing

Contributions are more than welcome!
See [CONTRIBUTING.md](./CONTRIBUTING.md) for a guide.
