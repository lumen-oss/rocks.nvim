
---@class (exact) LuxLuaPackageReq
---@field name fun(self): string
---@field version_req fun(self): string
---@field matches fun(self, packageSpec: LuxLuaPackageSpec): boolean

---@class (exact) LuxLuaScriptTestSpec
---@field script fun(self): string
---@field flags fun(self): string[]

---@class (exact) LuxLuaLockfileReadOnly
---@field version fun(self): string
---@field rocks fun(self): table<string, LuxLuaLocalPackage>
---@field get fun(self, str: string): LuxLuaLocalPackage?
---@field map_then_flush fun(self, value: any)

---@class (exact) LuxLuaTree
---@field root fun(self): string
---@field root_for fun(self, localPackage: LuxLuaLocalPackage): string
---@field bin fun(self): string
---@field match_rocks fun(self, packageReq: LuxLuaPackageReq): any
---@field rock_layout fun(self, localPackage: LuxLuaLocalPackage): LuxLuaRockLayout
---@field lockfile fun(self): LuxLuaLockfileReadOnly

---@class (exact) LuxLuaLockfileGuard
---@field version fun(self): string
---@field rocks fun(self): table<string, LuxLuaLocalPackage>
---@field get fun(self, str: string): LuxLuaLocalPackage?

---@class (exact) LuxLuaInstallSpec
---@field lua fun(self): table<string, string>
---@field lib fun(self): table<string, string>
---@field conf fun(self): table<string, string>
---@field bin fun(self): table<string, string>

---@class (exact) LuxLuaConfig
---@field server fun(self): string
---@field extra_servers fun(self): string[]
---@field only_sources fun(self): string?
---@field namespace fun(self): string?
---@field lua_dir fun(self): string?
---@field user_tree fun(self, str: string): LuxLuaTree
---@field verbose fun(self): boolean
---@field no_progress fun(self): boolean
---@field timeout fun(self): integer
---@field cache_dir fun(self): string
---@field data_dir fun(self): string
---@field entrypoint_layout fun(self): LuxLuaRockLayoutConfig
---@field variables fun(self): table<string, string>
---@field make_cmd fun(self): string
---@field cmake_cmd fun(self): string
---@field enabled_dev_servers fun(self): string[]
---@field builder fun(): LuxLuaConfigBuilder

---@class (exact) LuxLuaRemoteRockSource
---@field source_spec fun(self): any
---@field archive_name fun(self): string?
---@field unpack_dir fun(self): string?

---@class (exact) LuxLuaRockLayout
---@field rock_path string
---@field etc string
---@field lib string
---@field src string
---@field bin string
---@field conf string
---@field doc string

---@class (exact) LuxLuaModulePaths
---@field sources fun(self): string[]
---@field libraries fun(self): string[]
---@field defines fun(self): table<string, string?>
---@field incdirs fun(self): string[]
---@field libdirs fun(self): string[]

---@class (exact) LuxLuaCommandBuildSpec
---@field build_command fun(self): string?
---@field install_command fun(self): string?

---@class (exact) LuxLuaLocalRockspec
---@field package fun(self): string
---@field version fun(self): string
---@field description fun(self): LuxLuaRockDescription
---@field supported_platforms fun(self): LuxLuaPlatformSupport
---@field lua fun(self): string
---@field dependencies fun(self): LuxLuaDependencySpec[]
---@field build_dependencies fun(self): LuxLuaDependencySpec[]
---@field test_dependencies fun(self): LuxLuaDependencySpec[]
---@field external_dependencies fun(self): table<string, any>
---@field build fun(self): LuxLuaBuildSpec
---@field source fun(self): LuxLuaRemoteRockSource
---@field test fun(self): any
---@field format fun(self): string?
---@field to_lua_rockspec_string fun(self): string

---@class (exact) LuxLuaLocalProjectToml
---@field package fun(self): string
---@field version fun(self): string
---@field description fun(self): LuxLuaRockDescription
---@field dependencies fun(self): LuxLuaDependencySpec[]
---@field build_dependencies fun(self): LuxLuaDependencySpec[]
---@field test_dependencies fun(self): LuxLuaDependencySpec[]
---@field build fun(self): LuxLuaBuildSpec
---@field test fun(self): any
---@field to_lua_rockspec fun(self): LuxLuaLocalRockspec
---@field to_lua_rockspec_string fun(self): string

---@class (exact) LuxLuaBuildSpec
---@field build_backend fun(self): any?
---@field install fun(self): LuxLuaInstallSpec
---@field copy_directories fun(self): string[]
---@field patches fun(self): table<string, string>

---@class (exact) LuxLuaRockLayoutConfig
---@field new fun(): LuxLuaRockLayoutConfig
---@field new_nvim_layout fun(): LuxLuaRockLayoutConfig

---@class (exact) LuxLuaRockDescription
---@field summary fun(self): string?
---@field detailed fun(self): string?
---@field license fun(self): string?
---@field homepage fun(self): string?
---@field issues_url fun(self): string?
---@field maintainer fun(self): string?
---@field labels fun(self): string[]

---@class (exact) LuxLuaPackageSpec
---@field name string
---@field version string
---@field to_package_req fun(self): LuxLuaPackageReq

---@class (exact) LuxLuaPartialProjectToml
---@field package fun(self): string
---@field to_local fun(self): LuxLuaLocalProjectToml
---@field to_remote fun(self, n: integer?): LuxLuaRemoteProjectToml

---@class (exact) LuxLuaPlatformSupport
---@field is_supported fun(self, str: string): boolean

---@class (exact) LuxLuaBustedTestSpec
---@field flags fun(self): string[]

---@class (exact) LuxLuaRemotePackageDB
---@field search fun(self, packageReq: LuxLuaPackageReq): table<string, string[]>
---@field latest_match fun(self, packageReq: LuxLuaPackageReq): LuxLuaPackageSpec?

---@class (exact) LuxLuaCommandTestSpec
---@field command fun(self): string
---@field flags fun(self): string[]

---@class (exact) LuxLuaRemoteRockspec
---@field package fun(self): string
---@field version fun(self): string
---@field description fun(self): LuxLuaRockDescription
---@field supported_platforms fun(self): LuxLuaPlatformSupport
---@field lua fun(self): string
---@field dependencies fun(self): LuxLuaDependencySpec[]
---@field build_dependencies fun(self): LuxLuaDependencySpec[]
---@field test_dependencies fun(self): LuxLuaDependencySpec[]
---@field external_dependencies fun(self): table<string, any>
---@field build fun(self): LuxLuaBuildSpec
---@field source fun(self): LuxLuaRemoteRockSource
---@field test fun(self): any
---@field format fun(self): string?
---@field to_lua_rockspec_string fun(self): string

---@class (exact) LuxLuaProject
---@field toml_path fun(self): string
---@field luarc_path fun(self): string
---@field extra_rockspec_path fun(self): string
---@field lockfile_path fun(self): string
---@field root fun(self): string
---@field toml fun(self): LuxLuaPartialProjectToml
---@field local_rockspec fun(self): LuxLuaLocalRockspec
---@field remote_rockspec fun(self, n: integer?): LuxLuaRemoteRockspec
---@field tree fun(self, config: LuxLuaConfig): LuxLuaTree
---@field test_tree fun(self, config: LuxLuaConfig): LuxLuaTree
---@field lua_version fun(self, config: LuxLuaConfig): string
---@field extra_rockspec fun(self): LuxLuaPartialRockspec?
---@field add async fun(self, value: any, config: LuxLuaConfig)
---@field remove async fun(self, value: any)
---@field project_files fun(self): string[]

---@class (exact) LuxLuaRemoteProjectToml
---@field package fun(self): string
---@field version fun(self): string
---@field description fun(self): LuxLuaRockDescription
---@field dependencies fun(self): LuxLuaDependencySpec[]
---@field build fun(self): LuxLuaBuildSpec
---@field source fun(self): LuxLuaRemoteRockSource
---@field to_lua_rockspec fun(self): LuxLuaRemoteRockspec
---@field to_lua_rockspec_string fun(self): string

---@class (exact) LuxLuaRustMluaBuildSpec
---@field modules fun(self): table<string, string>
---@field target_path fun(self): string
---@field default_features fun(self): boolean
---@field features fun(self): string[]
---@field cargo_extra_args fun(self): string[]
---@field include fun(self): table<string, string>

---@class (exact) LuxLuaLockfileReadWrite
---@field version fun(self): string
---@field rocks fun(self): table<string, LuxLuaLocalPackage>
---@field get fun(self, str: string): LuxLuaLocalPackage?

---@class (exact) LuxLuaGitSource
---@field url fun(self): string
---@field checkout_ref fun(self): string?

---@class (exact) LuxLuaDependencySpec
---@field name fun(self): string
---@field version_req fun(self): string
---@field matches fun(self, packageSpec: LuxLuaPackageSpec): boolean
---@field package_req fun(self): LuxLuaPackageReq

---@class (exact) LuxLuaLocalPackageHashes
---@field rockspec fun(self): string
---@field source fun(self): string

---@class (exact) LuxLuaMakeBuildSpec
---@field makefile fun(self): string
---@field build_target fun(self): string?
---@field build_pass fun(self): boolean
---@field install_target fun(self): string
---@field install_pass fun(self): boolean
---@field build_variables fun(self): table<string, string>
---@field install_variables fun(self): table<string, string>
---@field variables fun(self): table<string, string>

---@class (exact) LuxLuaLocalPackage
---@field id fun(self): string
---@field name fun(self): string
---@field version fun(self): string
---@field pinned fun(self): boolean
---@field dependencies fun(self): string[]
---@field constraint fun(self): string
---@field hashes fun(self): LuxLuaLocalPackageHashes
---@field to_package fun(self): LuxLuaPackageSpec
---@field to_package_req fun(self): LuxLuaPackageReq

---@class (exact) LuxLuaConfigBuilder
---@field dev fun(self, flag: boolean?): LuxLuaConfigBuilder
---@field server fun(self, str: string?): LuxLuaConfigBuilder
---@field extra_servers fun(self, strs: string[]?): LuxLuaConfigBuilder
---@field only_sources fun(self, str: string?): LuxLuaConfigBuilder
---@field namespace fun(self, str: string?): LuxLuaConfigBuilder
---@field lua_dir fun(self, str: string?): LuxLuaConfigBuilder
---@field lua_version fun(self, str: string?): LuxLuaConfigBuilder
---@field user_tree fun(self, str: string?): LuxLuaConfigBuilder
---@field verbose fun(self, flag: boolean?): LuxLuaConfigBuilder
---@field no_progress fun(self, flag: boolean?): LuxLuaConfigBuilder
---@field timeout fun(self, n: integer?): LuxLuaConfigBuilder
---@field cache_dir fun(self, str: string?): LuxLuaConfigBuilder
---@field data_dir fun(self, str: string?): LuxLuaConfigBuilder
---@field entrypoint_layout fun(self, rockLayoutConfig: LuxLuaRockLayoutConfig?): LuxLuaConfigBuilder
---@field generate_luarc fun(self, flag: boolean?): LuxLuaConfigBuilder
---@field build fun(self): LuxLuaConfig

---@class (exact) LuxLuaCMakeBuildSpec
---@field cmake_lists_content fun(self): string?
---@field build_pass fun(self): boolean
---@field install_pass fun(self): boolean
---@field variables fun(self): table<string, string>

---@class (exact) LuxLuaTreesitterParserBuildSpec
---@field lang fun(self): string
---@field parser fun(self): boolean
---@field generate fun(self): boolean
---@field location fun(self): string?
---@field queries fun(self): table<string, string>

---@class lux
lux = {}

---@type lux.config
lux.config = lux_config

---@type lux.project
lux.project = lux_project

---@type lux.operations
lux.operations = lux_operations

---@class lux.config
lux_config = {}

---@return LuxLuaConfig
function lux_config.default() end

---@return LuxLuaConfigBuilder
function lux_config.builder() end

---@class lux.project
lux_project = {}

---@return LuxLuaProject?
function lux_project.current() end

---@param str string
---@return LuxLuaProject?
function lux_project.new(str) end

---@param str string
---@return LuxLuaProject?
function lux_project.new_fuzzy(str) end

---@class lux.operations
lux_operations = {}

---@param str string
---@param config LuxLuaConfig
---@return table<string, string[]>
function lux_operations.search(str, config) end

return require("lux") --[[@as lux]]
