# Frequently Asked Questions

This section is dedicated to frequently asked questions about `lux.nvim`.

### Why is a plugin not on `luarocks.org`?

If a plugin is not available, it means that the plugin owner hasn't published their own plugin to luarocks.
Consider creating a pull request or issue on their repository.

If the package is unmaintained or the owner does not want to set up a Lux project, you may instead contribute to
the [User Repository](https://github.com/lumen-oss/nurr).

### How do I configure plugins?

`lux.nvim` does not come with a configuration system out of the box. We recommend running `:Lux add lux-config.nvim`,
which gives you multiple convenience features like the ability to configure plugins directly in the `lux.toml` as well
as in Lua.

After installing `lux-config.nvim`, see `:h lux-config` for more.

### What is the difference between sync and update?

`:Lux sync` and `:Lux update` do similar things but serve different purposes.

When syncing, lux will read your `lux.toml` file (`:h lux-toml`)
and make sure that all installed plugins *exactly match the specification*. This means that it can downgrade, add or remove
plugins depending on what the `lux.toml` contains.

Updating, on the other hand, simply looks for the latest versions of each plugin that you have and installs fresher versions. It does
not perform destructive operations.
