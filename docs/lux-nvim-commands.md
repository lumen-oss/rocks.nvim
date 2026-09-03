## Installing Plugins

```
:Lux add plugin-one@1.2.0 plugin-two
```

Installs and adds a set of packages to your `lux.toml`.
If you omit the version, the latest one will be installed.

## Removing Plugins

```
:Lux remove plugin-one plugin-two
```

Removes packages from your `lux.toml`.

## Updating Plugins

```
:Lux update
:Lux update plugin-one plugin-two
```

Updates all packages to their latest available versions if executed without
arguments. You may also pass specific packages to update.

## Syncing Plugins

```
:Lux sync
```

Reads your `lux.toml` and makes sure that all installed plugins exactly reflect the TOML state.
This means that it can downgrade, add or remove plugins depending on what the `lux.toml` contains.

Try this whenever you have dependency errors, as it may resolve multiple issues.

## Pinning Plugins

```
:Lux pin plugin-one plugin-two
```

Prevents a set of packages from receiving updates. Use this if you are concerned with the security of a plugin
or if you do not want to use a more recent version.

## Unpinning Plugins

```
:Lux unpin plugin-one plugin-two
```

Allows a pinned plugin to start receiving updates again.

## Editing the `lux.toml`

```
:Lux edit
```

Opens the `lux.toml` in a new buffer for editing.

## Viewing the Logfile

```
:Lux log
```

Opens the `lux.nvim` log file in a new buffer. Use this whenever you need to debug `lux.nvim` for any reason.
