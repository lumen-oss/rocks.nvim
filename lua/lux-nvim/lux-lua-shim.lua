--- @meta

--- Module for connecting Lux progress reports to a running LSP server
--- @class ProgressModule
local _CLASS_ProgressModule_ = {
	--- Connect progress reports to a running LSP server for a given workspace
	--- @param workspace Workspace The workspace to connect progress reporting to
	set_connection = function(workspace) end,
}

--- Module for interacting with a Lux workspace
--- @class WorkspaceModule
local _CLASS_WorkspaceModule_ = {
	--- Load the current workspace, if in a workspace
	--- @return Workspace | nil
	current = function() end,
	--- Load the workspace in the given directory, if present
	--- @param path string The workspace root
	--- @return Workspace | nil
	new = function(path) end,
	--- Search for a workspace upwards from the given directory and load it, if present
	--- @param path string The directory to search upwards from
	--- @return Workspace | nil
	new_fuzzy = function(path) end,
}

--- Specification for a Lua dependency in a Lux project
--- @class LuaDependencySpec
local _CLASS_LuaDependencySpec_ = {
	--- Evaluate whether the given package satisfies this dependency's requirement.
	--- @param self LuaDependencySpec
	--- @param package PackageSpec package spec to check
	--- @return boolean
	matches = function(self, package) end,
	--- @param self LuaDependencySpec
	--- @return string
	name = function(self) end,
	--- @param self LuaDependencySpec
	--- @return PackageReq
	package_req = function(self) end,
	--- @param self LuaDependencySpec
	--- @return string
	version_req = function(self) end,
}

--- Remote Lua RockSpec that has been downloaded from a remote server, along with its source metadata
--- @class DownloadedRockspec
local _CLASS_DownloadedRockspec_ = {
	--- @param self DownloadedRockspec
	--- @return RemoteLuaRockspec
	rockspec = function(self) end,
}

--- Specification for running a test suite with a Lua script
--- @class LuaScriptTestSpec
local _CLASS_LuaScriptTestSpec_ = {
	--- Additional CLI flags to pass to the script when running
	--- @param self LuaScriptTestSpec
	--- @return string[]
	flags = function(self) end,
	--- The script to run
	--- @param self LuaScriptTestSpec
	--- @return string
	script = function(self) end,
}

--- Specifies a source to be fetched from a git forge
--- @class GitSource
local _CLASS_GitSource_ = {
	--- @param self GitSource
	--- @return string | nil
	checkout_ref = function(self) end,
	--- @param self GitSource
	--- @return string
	url = function(self) end,
}

--- Incrementally builds a `Config` by layering configuration sources.
--- @class ConfigBuilder
local _CLASS_ConfigBuilder_ = {
	--- @param self ConfigBuilder
	--- @return Config
	build = function(self) end,
	--- The cache directory, e.g. for luarocks manifests.
	--- @param self ConfigBuilder
	--- @param cache_dir string | nil
	--- @return ConfigBuilder
	cache_dir = function(self, cache_dir) end,
	--- The data directory, in which the default user install tree resides.
	--- @param self ConfigBuilder
	--- @param data_dir string | nil
	--- @return ConfigBuilder
	data_dir = function(self, data_dir) end,
	--- Whether to development packages
	--- @param self ConfigBuilder
	--- @param dev boolean | nil Default: false
	--- @return ConfigBuilder
	dev = function(self, dev) end,
	--- The rock layout for entrypoints of new install trees.
	--- Does not affect existing install trees or dependency rock layouts.
	--- @param self ConfigBuilder
	--- @param layout RockLayoutConfig | nil
	--- @return ConfigBuilder
	entrypoint_layout = function(self, layout) end,
	--- Fetch rocks/rockspecs from these servers in addition to the main server
	--- @param self ConfigBuilder
	--- @param servers string[] | nil List of server URLs
	--- @return ConfigBuilder
	extra_servers = function(self, servers) end,
	--- Whether to generate a `.luarc.json` on build.
	--- @param self ConfigBuilder
	--- @param generate boolean | nil Default: true
	--- @return ConfigBuilder
	generate_luarc = function(self, generate) end,
	--- Specify the directory in which to install Lua if not found
	--- @param self ConfigBuilder
	--- @param lua_dir string | nil <path>
	--- @return ConfigBuilder
	lua_dir = function(self, lua_dir) end,
	--- Which Lua version to use
	--- @param self ConfigBuilder
	--- @param lua_version '5.1' | '5.2' | '5.3' | '5.4' | '5.5' | 'jit' | 'jit52' | nil Default: The installed Lua version, if detected
	--- @return ConfigBuilder
	lua_version = function(self, lua_version) end,
	--- Specify the luarocks server namespace to use
	--- @param self ConfigBuilder
	--- @param namespace string | nil
	--- @return ConfigBuilder
	namespace = function(self, namespace) end,
	--- Whether to disable printing progress bars and spinners
	--- @param self ConfigBuilder
	--- @param no_progress boolean | nil Default: false
	--- @return ConfigBuilder
	no_progress = function(self, no_progress) end,
	--- Whether to disable user prompts
	--- @param self ConfigBuilder
	--- @param no_progress boolean | nil Default: false
	--- @return ConfigBuilder
	no_prompt = function(self, no_progress) end,
	--- Fetch rocks/rockspecs from this luarocks server
	--- @param self ConfigBuilder
	--- @param server string | nil Default: 'https://luarocks.org/'
	--- @return ConfigBuilder
	server = function(self, server) end,
	--- Timeout on network operations, in seconds.
	--- 0 means no timeout (wait forever).
	--- @param self ConfigBuilder
	--- @param timeout integer | nil Default: 30 s
	--- @return ConfigBuilder
	timeout = function(self, timeout) end,
	--- The user agent to set when making web requests.
	--- @param self ConfigBuilder
	--- @param user_agent string | nil Default: 'lux-lua/<version>'
	--- @return ConfigBuilder
	user_agent = function(self, user_agent) end,
	--- Which tree to operate on
	--- @param self ConfigBuilder
	--- @param tree string | nil Tree root directory
	--- @return ConfigBuilder
	user_tree = function(self, tree) end,
	--- Whether to display verbose output of commands executed
	--- @param self ConfigBuilder
	--- @param verbose boolean | nil Default: false
	--- @return ConfigBuilder
	verbose = function(self, verbose) end,
	--- Which tree to operate on when in a workspace.
	--- Default: A `.lux` directory in the workspace root.
	---
	--- @param self ConfigBuilder
	--- @param tree string | nil Tree root directory
	--- @return ConfigBuilder
	workspace_tree = function(self, tree) end,
	--- Whether to wrap installed Lua bin scripts to be executed with
	--- the detected or configured Lua installation.
	--- Setting this to `false` disables wrapping globally.
	--- If set to `true`, individual rocks can still disable wrapping of their own bin scripts.
	---
	--- @param self ConfigBuilder
	--- @param wrap boolean | nil Default: true
	--- @return ConfigBuilder
	wrap_bin_scripts = function(self, wrap) end,
}

--- Rockspec and source integrities of an installed rock
--- @class LocalPackageHashes
local _CLASS_LocalPackageHashes_ = {
	--- @param self LocalPackageHashes
	--- @return string
	rockspec = function(self) end,
	--- @param self LocalPackageHashes
	--- @return string
	source = function(self) end,
}

--- Deserialized from a Lua `.rockspec`, not yet validated
--- @class PartialLuaRockspec

--- RockSpec for a remote rock, deserialized from a `.rockspec` file
--- @class RemoteLuaRockspec
local _CLASS_RemoteLuaRockspec_ = {
	--- @param self RemoteLuaRockspec
	--- @return BuildSpec
	build = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return LuaDependencySpec[]
	build_dependencies = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return LuaDependencySpec[]
	dependencies = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return RockDescription
	description = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return { [string]: table }
	external_dependencies = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return string | nil
	format = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return string
	lua = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return string
	package = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return RemoteRockSource
	source = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return PlatformSupport
	supported_platforms = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return table
	test = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return LuaDependencySpec[]
	test_dependencies = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return string
	to_lua_rockspec_string = function(self) end,
	--- @param self RemoteLuaRockspec
	--- @return string
	version = function(self) end,
}

--- Read-only lockfile for an install tree
--- @class LockfileReadOnly
local _CLASS_LockfileReadOnly_ = {
	--- @param self LockfileReadOnly
	--- @param id string
	--- @return LocalPackage | nil
	get = function(self, id) end,
	--- Converts the current lockfile into a writeable one, executes `f` and flushes
	--- @param self LockfileReadOnly
	--- @param f fun() Takes the writable lockfile
	map_then_flush = function(self, f) end,
	--- @param self LockfileReadOnly
	--- @return { [string]: LocalPackage }
	rocks = function(self) end,
	--- @param self LockfileReadOnly
	--- @return string
	version = function(self) end,
}

--- RockSpec for a local rock installation, deserialized from a `.rockspec` file
--- @class LocalLuaRockspec
local _CLASS_LocalLuaRockspec_ = {
	--- @param self LocalLuaRockspec
	--- @return BuildSpec
	build = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return LuaDependencySpec[]
	build_dependencies = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return LuaDependencySpec[]
	dependencies = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return RockDescription
	description = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return { [string]: table }
	external_dependencies = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return string | nil
	format = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return string
	lua = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return string
	package = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return RemoteRockSource
	source = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return PlatformSupport
	supported_platforms = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return table
	test = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return LuaDependencySpec[]
	test_dependencies = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return string
	to_lua_rockspec_string = function(self) end,
	--- @param self LocalLuaRockspec
	--- @return string
	version = function(self) end,
}

--- The `lux.toml`, after being validated and prepared for upload
--- @class RemoteProjectToml
local _CLASS_RemoteProjectToml_ = {
	--- @param self RemoteProjectToml
	--- @return BuildSpec
	build = function(self) end,
	--- @param self RemoteProjectToml
	--- @return LuaDependencySpec[]
	dependencies = function(self) end,
	--- @param self RemoteProjectToml
	--- @return RockDescription
	description = function(self) end,
	--- @param self RemoteProjectToml
	--- @return string
	package = function(self) end,
	--- @param self RemoteProjectToml
	--- @return RemoteRockSource
	source = function(self) end,
	--- @param self RemoteProjectToml
	--- @return RemoteLuaRockspec
	to_lua_rockspec = function(self) end,
	--- @param self RemoteProjectToml
	--- @return string
	to_lua_rockspec_string = function(self) end,
	--- @param self RemoteProjectToml
	--- @return string
	version = function(self) end,
}

--- Package database, used to look up remote rocks
--- @class RemotePackageDB
local _CLASS_RemotePackageDB_ = {
	--- Find the latest package that matches the requirement.
	--- @param self RemotePackageDB
	--- @param package_req PackageReq Package to search for, e.g. 'foo' or 'foo >= 1.0.0'
	--- @return PackageSpec | nil
	latest_match = function(self, package_req) end,
	--- Search for all packages that match the requirement
	--- @param self RemotePackageDB
	--- @param package_req PackageReq Package to search for, e.g. 'foo' or 'foo >= 1.0.0'
	--- @return { [string]: string[] }
	search = function(self, package_req) end,
}

--- Specifies the source of a remote rock to be fetched
--- @class RemoteRockSource
local _CLASS_RemoteRockSource_ = {
	--- @param self RemoteRockSource
	--- @return string | nil
	archive_name = function(self) end,
	--- @param self RemoteRockSource
	--- @return table
	source_spec = function(self) end,
	--- @param self RemoteRockSource
	--- @return string | nil
	unpack_dir = function(self) end,
}

--- Specification for building a rock with the `cmake` build backend
--- @class CMakeBuildSpec
local _CLASS_CMakeBuildSpec_ = {
	--- Whether to perform a build pass
	--- @param self CMakeBuildSpec
	--- @return boolean
	build_pass = function(self) end,
	--- @param self CMakeBuildSpec
	--- @return string | nil
	cmake_lists_content = function(self) end,
	--- Whether to perform an install pass
	--- @param self CMakeBuildSpec
	--- @return boolean
	install_pass = function(self) end,
	--- @param self CMakeBuildSpec
	--- @return { [string]: string }
	variables = function(self) end,
}

--- Specification for building a Lua module from various sources
--- @class ModulePaths
local _CLASS_ModulePaths_ = {
	--- C defines, e.g. { 'FOO=bar', 'USE_BLA' }
	--- @param self ModulePaths
	--- @return { [string]: string | nil }
	defines = function(self) end,
	--- Directories to be added to the compiler's headers lookup directory list.
	--- @param self ModulePaths
	--- @return string[]
	incdirs = function(self) end,
	--- Directories to be added to the linker's library lookup directory list.
	--- @param self ModulePaths
	--- @return string[]
	libdirs = function(self) end,
	--- External libraries to be linked
	--- @param self ModulePaths
	--- @return string[]
	libraries = function(self) end,
	--- Path names of C sources, mandatory field
	--- @param self ModulePaths
	--- @return string[]
	sources = function(self) end,
}

--- Specification for building a rock with the `command` build backend
--- @class CommandBuildSpec
local _CLASS_CommandBuildSpec_ = {
	--- @param self CommandBuildSpec
	--- @return string | nil
	build_command = function(self) end,
	--- @param self CommandBuildSpec
	--- @return string | nil
	install_command = function(self) end,
}

--- A collection of files where installed rocks are located
--- @class Tree
local _CLASS_Tree_ = {
	--- Where wrapped package binaries are installed
	--- @param self Tree
	--- @return string
	bin = function(self) end,
	--- Create a `LockfileReadOnly` for this tree.
	--- @param self Tree
	--- @return LockfileReadOnly
	lockfile = function(self) end,
	--- Find installed rocks that match the given `PackageReq`
	--- @param self Tree
	--- @param req PackageReq
	--- @return any
	match_rocks = function(self, req) end,
	--- Get the `RockLayout` for an installed package.
	--- @param self Tree
	--- @param package LocalPackage
	--- @return RockLayout
	rock_layout = function(self, package) end,
	--- The root directory of the tree
	--- @param self Tree
	--- @return string
	root = function(self) end,
	--- The root directory of a package in this tree
	--- @param self Tree
	--- @param package LocalPackage
	--- @return string
	root_for = function(self, package) end,
}

--- A locally installed rock
--- @class LocalPackage
local _CLASS_LocalPackage_ = {
	--- @param self LocalPackage
	--- @return string
	constraint = function(self) end,
	--- @param self LocalPackage
	--- @return string[]
	dependencies = function(self) end,
	--- @param self LocalPackage
	--- @return LocalPackageHashes
	hashes = function(self) end,
	--- @param self LocalPackage
	--- @return string
	id = function(self) end,
	--- @param self LocalPackage
	--- @return string
	name = function(self) end,
	--- @param self LocalPackage
	--- @return boolean
	pinned = function(self) end,
	--- @param self LocalPackage
	--- @return PackageSpec
	to_package = function(self) end,
	--- @param self LocalPackage
	--- @return PackageReq
	to_package_req = function(self) end,
	--- @param self LocalPackage
	--- @return string
	version = function(self) end,
}

--- Specification for building a rock with the `rust-mlua` build backend
--- @class RustMluaBuildSpec
local _CLASS_RustMluaBuildSpec_ = {
	--- Additional flags to be passed in the cargo invocation
	--- @param self RustMluaBuildSpec
	--- @return string[]
	cargo_extra_args = function(self) end,
	--- If set to `false` pass `--no-default-features` to cargo.
	--- @param self RustMluaBuildSpec
	--- @return boolean
	default_features = function(self) end,
	--- Pass additional features
	--- @param self RustMluaBuildSpec
	--- @return string[]
	features = function(self) end,
	--- Copy additional files to the `lua` directory.
	--- Keys are the sources, values the destinations (relative to the `lua` directory).
	---
	--- @param self RustMluaBuildSpec
	--- @return { [string]: string }
	include = function(self) end,
	--- Keys are module names in the format normally used by the `require()` function.
	--- values are the library names in the target directory (without the `lib` prefix).
	---
	--- @param self RustMluaBuildSpec
	--- @return { [string]: string }
	modules = function(self) end,
	--- Set if the cargo `target` directory is not in the source root
	--- @param self RustMluaBuildSpec
	--- @return string
	target_path = function(self) end,
}

--- Specification for building a rock with the `make` build backend
--- @class MakeBuildSpec
local _CLASS_MakeBuildSpec_ = {
	--- Whether to perform a make pass on the target indicated by `build_target`
	--- @param self MakeBuildSpec
	--- @return boolean
	build_pass = function(self) end,
	--- @param self MakeBuildSpec
	--- @return string | nil
	build_target = function(self) end,
	--- Assignments to be passed to make during the build pass
	--- @param self MakeBuildSpec
	--- @return { [string]: string }
	build_variables = function(self) end,
	--- Whether to perform a make pass on the target indicated by `install_target`
	--- @param self MakeBuildSpec
	--- @return boolean
	install_pass = function(self) end,
	--- @param self MakeBuildSpec
	--- @return string
	install_target = function(self) end,
	--- Assignments to be passed to make during the install pass
	--- @param self MakeBuildSpec
	--- @return { [string]: string }
	install_variables = function(self) end,
	--- Makefile to be used
	--- @param self MakeBuildSpec
	--- @return string
	makefile = function(self) end,
	--- Assignments to be passed to make during both passes
	--- @param self MakeBuildSpec
	--- @return { [string]: string }
	variables = function(self) end,
}

--- Flushes a lockfile automatically when it goes out of scope
--- @class LockfileGuard
local _CLASS_LockfileGuard_ = {
	--- @param self LockfileGuard
	--- @param id string
	--- @return LocalPackage | nil
	get = function(self, id) end,
	--- @param self LockfileGuard
	--- @return { [string]: LocalPackage }
	rocks = function(self) end,
	--- @param self LockfileGuard
	--- @return string
	version = function(self) end,
}

--- Change-agnostic way of referencing various paths for a rock
--- @class RockLayout
--- @field bin string
--- @field conf string
--- @field doc string
--- @field etc string
--- @field lib string
--- @field rock_path string
--- @field src string

--- The build specification for a given rock, serialized from `build = { ... }`.
--- @class BuildSpec
local _CLASS_BuildSpec_ = {
	--- Determines the build backend to use
	--- @param self BuildSpec
	--- @return table | nil
	build_backend = function(self) end,
	--- A list of directories that should be copied as-is into the resulting rock
	--- @param self BuildSpec
	--- @return string[]
	copy_directories = function(self) end,
	--- A set of instructions on how/where to copy files from the project
	--- @param self BuildSpec
	--- @return InstallSpec
	install = function(self) end,
	--- A list of patches to apply to the project before packaging it
	--- @param self BuildSpec
	--- @return { [string]: string }
	patches = function(self) end,
}

--- Specification for running a test suite with a command
--- @class CommandTestSpec
local _CLASS_CommandTestSpec_ = {
	--- The command to run
	--- @param self CommandTestSpec
	--- @return string
	command = function(self) end,
	--- Additional CLI flags to pass to the command when running
	--- @param self CommandTestSpec
	--- @return string[]
	flags = function(self) end,
}

--- A lua package requirement with a name and an optional version requirement
--- @class PackageReq
local _CLASS_PackageReq_ = {
	--- Evaluate whether the given package satisfies this package requirement.
	--- @param self PackageReq
	--- @param package PackageSpec package spec to check
	--- @return boolean
	matches = function(self, package) end,
	--- @param self PackageReq
	--- @return string
	name = function(self) end,
	--- @param self PackageReq
	--- @return string
	version_req = function(self) end,
}

--- Template configuration for a rock's tree layout
--- @class RockLayoutConfig
local _CLASS_RockLayoutConfig_ = {
	--- Instantiate the default rock layout
	--- @return RockLayoutConfig
	new = function() end,
	--- Instantiate the a rock layout for Neovim plugins
	--- @return RockLayoutConfig
	new_nvim_layout = function() end,
}

--- Lux project, with methods for managing dependencies, etc.
--- @class Project
local _CLASS_Project_ = {
	--- @param self Project
	--- @param deps table Dependencies to add
	--- @param config Config Lux config
	add = function(self, deps, config) end,
	--- @param self Project
	--- @return PartialLuaRockspec | nil
	extra_rockspec = function(self) end,
	--- @param self Project
	--- @return string
	extra_rockspec_path = function(self) end,
	--- @param self Project
	--- @return LocalLuaRockspec
	local_rockspec = function(self) end,
	--- @param self Project
	--- @param config Config Lux config
	--- @return string
	lua_version = function(self, config) end,
	--- @param self Project
	--- @return string[]
	project_files = function(self) end,
	--- @param self Project
	--- @param specrev integer | nil The revision of the RockSpec
	--- @return RemoteLuaRockspec
	remote_rockspec = function(self, specrev) end,
	--- @param self Project
	--- @param deps table Dependencies to remove
	remove = function(self, deps) end,
	--- @param self Project
	--- @return string
	root = function(self) end,
	--- @param self Project
	--- @return PartialProjectToml
	toml = function(self) end,
	--- @param self Project
	--- @return string
	toml_path = function(self) end,
}

--- A rock's metadata, to be displayed on the remote package server
--- @class RockDescription
local _CLASS_RockDescription_ = {
	--- A longer description of the package
	--- @param self RockDescription
	--- @return string | nil
	detailed = function(self) end,
	--- An URL for the project. This is not the URL for the tarball, but the address of a website
	--- @param self RockDescription
	--- @return string | nil
	homepage = function(self) end,
	--- An URL for the project's issue tracker
	--- @param self RockDescription
	--- @return string | nil
	issues_url = function(self) end,
	--- A list of short strings that specify labels for categorization of this rock
	--- @param self RockDescription
	--- @return string[]
	labels = function(self) end,
	--- The license used by the package
	--- @param self RockDescription
	--- @return string | nil
	license = function(self) end,
	--- Contact information for the rockspec maintainer
	--- @param self RockDescription
	--- @return string | nil
	maintainer = function(self) end,
	--- A one-line description of the package
	--- @param self RockDescription
	--- @return string | nil
	summary = function(self) end,
}

--- Specification for building a rock with the `treesitter-parser` build backend
--- @class TreesitterParserBuildSpec
local _CLASS_TreesitterParserBuildSpec_ = {
	--- Must the sources be generated?
	--- @param self TreesitterParserBuildSpec
	--- @return boolean
	generate = function(self) end,
	--- Name of the parser language, e.g. 'haskell'
	--- @param self TreesitterParserBuildSpec
	--- @return string
	lang = function(self) end,
	--- tree-sitter grammar's location (relative to the source root)
	--- @param self TreesitterParserBuildSpec
	--- @return string | nil
	location = function(self) end,
	--- Won't build the parser if `false`
	--- @param self TreesitterParserBuildSpec
	--- @return boolean
	parser = function(self) end,
	--- Embedded queries to be installed in the `etc/queries` directory
	--- @param self TreesitterParserBuildSpec
	--- @return { [string]: string }
	queries = function(self) end,
}

--- Writable lockfile for an install tree
--- @class LockfileReadWrite
local _CLASS_LockfileReadWrite_ = {
	--- @param self LockfileReadWrite
	--- @param id string
	--- @return LocalPackage | nil
	get = function(self, id) end,
	--- @param self LockfileReadWrite
	--- @return { [string]: LocalPackage }
	rocks = function(self) end,
	--- @param self LockfileReadWrite
	--- @return string
	version = function(self) end,
}

--- Used to specify which platforms a rock can be built for
--- @class PlatformSupport
local _CLASS_PlatformSupport_ = {
	--- Is the given platform supported?
	--- @param self PlatformSupport
	--- @param platform unix | windows | win32 | cygwin | macosx | linux | freebsd |
	--- @return boolean
	is_supported = function(self, platform) end,
}

--- Specification for running a test suite with busted
--- @class BustedTestSpec
local _CLASS_BustedTestSpec_ = {
	--- Additional CLI flags to pass to busted when running
	--- @param self BustedTestSpec
	--- @return string[]
	flags = function(self) end,
}

--- The `lux.toml` file for a project.
--- The only required fields are `package` and `build`, which are required to build a project using `lux build`.
--- The rest of the fields are optional, but are required to build a rockspec.
---
--- @class PartialProjectToml
local _CLASS_PartialProjectToml_ = {
	--- @param self PartialProjectToml
	--- @return string
	package = function(self) end,
	--- @param self PartialProjectToml
	--- @return LocalProjectToml
	to_local = function(self) end,
	--- @param self PartialProjectToml
	--- @param specrev integer | nil The revision of the RockSpec
	--- @return RemoteProjectToml
	to_remote = function(self, specrev) end,
}

--- For packages which don't provide means to install modules
--- and expect the user to copy the .lua or library files by hand to the proper locations.
--- This struct contains categories of files. Each category is itself a table,
--- where the array part is a list of filenames to be copied.
--- For module directories only, in the hash part, other keys are identifiers in Lua module format,
--- to indicate which subdirectory the file should be copied to.
--- For example, lua = {["foo.bar"] = "src/bar.lua"} will copy src/bar.lua
--- to the foo directory under the rock's Lua files directory.
---
--- @class InstallSpec
local _CLASS_InstallSpec_ = {
	--- Lua command-line scripts
	--- @param self InstallSpec
	--- @return { [string]: string }
	bin = function(self) end,
	--- Configuration files
	--- @param self InstallSpec
	--- @return { [string]: string }
	conf = function(self) end,
	--- Dynamic libraries implemented compiled Lua modules
	--- @param self InstallSpec
	--- @return { [string]: string }
	lib = function(self) end,
	--- Lua modules written in Lua
	--- @param self InstallSpec
	--- @return { [string]: string }
	lua = function(self) end,
}

--- The `lux.toml` file, after being properly deserialized.
--- This struct may be used to build a local version of a project.
--- To build a rockspec, use `RemoteProjectToml`.
---
--- @class LocalProjectToml
local _CLASS_LocalProjectToml_ = {
	--- @param self LocalProjectToml
	--- @return BuildSpec
	build = function(self) end,
	--- @param self LocalProjectToml
	--- @return LuaDependencySpec[]
	build_dependencies = function(self) end,
	--- @param self LocalProjectToml
	--- @return LuaDependencySpec[]
	dependencies = function(self) end,
	--- @param self LocalProjectToml
	--- @return RockDescription
	description = function(self) end,
	--- @param self LocalProjectToml
	--- @return string
	package = function(self) end,
	--- @param self LocalProjectToml
	--- @return table
	test = function(self) end,
	--- @param self LocalProjectToml
	--- @return LuaDependencySpec[]
	test_dependencies = function(self) end,
	--- @param self LocalProjectToml
	--- @return LocalLuaRockspec
	to_lua_rockspec = function(self) end,
	--- @param self LocalProjectToml
	--- @return string
	to_lua_rockspec_string = function(self) end,
	--- @param self LocalProjectToml
	--- @return string
	version = function(self) end,
}

--- Specification for a package with an exact name and version
--- @class PackageSpec
--- @field name string
--- @field version string
local _CLASS_PackageSpec_ = {
	--- Convert this spec to a package requirement (with an exact version requirement)
	--- @param self PackageSpec
	--- @return PackageReq
	to_package_req = function(self) end,
}

--- The resolved configuration for a Lux session.
--- Can be constructed via `ConfigBuilder`, which supports layering multiple
--- configuration sources (config file, CLI flags, environment variables)
---
--- @class Config
local _CLASS_Config_ = {
	--- @return ConfigBuilder
	builder = function() end,
	--- The Lux cache directory
	--- @param self Config
	--- @return string
	cache_dir = function(self) end,
	--- Command to use for running `cmake` builds
	--- @param self Config
	--- @return string
	cmake_cmd = function(self) end,
	--- The Lux data directory
	--- @param self Config
	--- @return string
	data_dir = function(self) end,
	--- Enabled luarocks repository servers that provide dev/scm rocks
	--- @param self Config
	--- @return string[]
	enabled_dev_servers = function(self) end,
	--- The rock layout for entrypoints of new install trees.
	--- Does not affect existing install trees or dependency rock layouts.
	--- @param self Config
	--- @return RockLayoutConfig
	entrypoint_layout = function(self) end,
	--- Additional luarocks repository servers
	--- @param self Config
	--- @return string[]
	extra_servers = function(self) end,
	--- The directory in which to install Lua{n} if not found
	--- @param self Config
	--- @return string | nil
	lua_dir = function(self) end,
	--- Command to use for running `make` builds
	--- @param self Config
	--- @return string
	make_cmd = function(self) end,
	--- The luarocks server namespace to use
	--- @param self Config
	--- @return string | nil
	namespace = function(self) end,
	--- Whether to disable printing progress bars and spinners
	--- @param self Config
	--- @return boolean
	no_progress = function(self) end,
	--- Whether to skip prompts, selecting the default option
	--- @param self Config
	--- @return boolean
	no_prompt = function(self) end,
	--- The luarocks repository server
	--- @param self Config
	--- @return string
	server = function(self) end,
	--- Timeout on network operations, in seconds.
	--- 0 means no timeout (wait forever).
	--- @param self Config
	--- @return integer
	timeout = function(self) end,
	--- The tree in which to install rocks.
	--- If installing packages for a project, use `project:tree(config)` instead
	--- @param self Config
	--- @param lua_version '5.1' | '5.2' | '5.3' | '5.4' | '5.5' | 'jit' | 'jit52'
	--- @return Tree
	user_tree = function(self, lua_version) end,
	--- Variable names, mapped to their values.
	--- Lux populates variables in the `lux.toml` and in RockSpecs
	--- with these before building.
	--- @param self Config
	--- @return { [string]: string }
	variables = function(self) end,
	--- Whether to display verbose output of commands executed
	--- @param self Config
	--- @return boolean
	verbose = function(self) end,
	--- The detached workspace tree root.
	--- @param self Config
	--- @return string | nil
	workspace_tree = function(self) end,
}

--- Module for Lux operations
--- @class OperationsModule
local _CLASS_OperationsModule_ = {
	--- Add dependencies to a workspace project and install them immediately
	--- @param workspace Workspace Workspace containing the project to modify
	--- @param deps table Dependencies to add, e.g. { regular = {'foo', 'bar >= 1.0'} }
	--- @param config Config Lux config
	add = function(workspace, deps, config) end,
	--- Build a workspace
	--- @param workspace Workspace Workspace to build
	--- @param package string | nil Build only this package
	--- @param config Config Lux config
	--- @return LocalPackage[]
	build = function(workspace, package, config) end,
	--- Distribute a project as a single static binary
	--- @param project Project Project to compile
	--- @param tree Tree Install tree
	--- @param output string Destination path for the compiled binary
	--- @param config Config Lux config
	--- @return string #1: the path to the compiled binary
	dist_bin = function(project, tree, output, config) end,
	--- Download the RockSpec for a package
	--- @param package_req string Package to search for, e.g. 'foo' or 'foo >= 1.0.0'
	--- @param config Config Lux config
	--- @return DownloadedRockspec
	download_rockspec = function(package_req, config) end,
	--- Install one or multiple package(s)
	--- @param packages table[] List of packages to install
	--- @param tree Tree Install tree
	--- @param config Config Lux config
	--- @return LocalPackage[]
	install = function(packages, tree, config) end,
	--- Set the pinned state of a package
	--- @param package_id string ID of the package to pin
	--- @param tree Tree Install tree
	--- @param pin_state boolean The pinned state to set
	pin = function(package_id, tree, pin_state) end,
	--- Remove dependencies from a workspace project and uninstall them immediately
	--- @param workspace Workspace Workspace containing the project to modify
	--- @param deps table Dependencies to remove, e.g. { regular = {'foo', 'bar'} }
	--- @param config Config Lux config
	remove = function(workspace, deps, config) end,
	--- Search for a remote package
	--- @param query string Package to search for, e.g. 'foo' or 'foo >= 1.0.0'
	--- @param config Config Lux config
	--- @return { [string]: string[] }
	search = function(query, config) end,
	--- Sync all workspace dependencies
	--- @param workspace Workspace Workspace to sync
	--- @param config Config Lux config
	--- @return table
	--- @return table
	--- @return table
	sync = function(workspace, config) end,
	--- Sync workspace build dependencies
	--- @param workspace Workspace Workspace to sync
	--- @param config Config Lux config
	--- @return table
	sync_build_dependencies = function(workspace, config) end,
	--- Sync workspace dependencies
	--- @param workspace Workspace Workspace to sync
	--- @param config Config Lux config
	--- @return table
	sync_dependencies = function(workspace, config) end,
	--- Sync workspace test dependencies
	--- @param workspace Workspace Workspace to sync
	--- @param config Config Lux config
	--- @return table
	sync_test_dependencies = function(workspace, config) end,
	--- Uninstall one or multiple package(s)
	--- @param packages string[] IDs of packages to uninstall
	--- @param tree Tree | nil Install tree
	--- @param config Config Lux config
	uninstall = function(packages, tree, config) end,
	--- Update installed packages in a workspace
	--- @param workspace Workspace Workspace to update packages in
	--- @param packages string[] | nil Optional list of packages to update (e.g. {'foo', 'bar >= 1.0'})
	--- @param config Config Lux config
	--- @return LocalPackage[]
	update = function(workspace, packages, config) end,
}

--- Module for interacting with a Lux project
--- @class ProjectModule
local _CLASS_ProjectModule_ = {
	--- Load a project at the specified path, if it exists
	--- @param path string project root
	--- @return Project | nil
	new = function(path) end,
}

--- Module for building a Lux `Config`
--- @class ConfigModule
local _CLASS_ConfigModule_ = {
	--- Create a new config builder, starting with a blank slate
	--- @return ConfigBuilder
	builder = function() end,
	--- Create a config builder that builds the default `Config`
	--- @return Config
	default = function() end,
	--- Create a new config builder by deserializing from a config file
	--- if present, or otherwise by instantiating the default config
	--- @return ConfigBuilder
	new = function() end,
}

--- @class LuxModule
--- Module for building a Lux `Config`
--- @field config ConfigModule
--- Module for Lux operations
--- @field operations OperationsModule
--- Module for connecting Lux progress reports to the LSP server
--- @field progress ProgressModule
--- Module for interacting with a Lux project
--- @field project ProjectModule
--- Module for interacting with a Lux workspace
--- @field workspace WorkspaceModule
local _CLASS_LuxModule_ = {
	--- Load the lux loader into the current Lua session
	--- @param self LuxModule
	loader = function(self) end,
}

--- @type LuxModule
local lux = require("lux")

return lux
