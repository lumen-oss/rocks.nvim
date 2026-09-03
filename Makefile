# TODO(vhyrro): Change to use `lx` commands
format:
	stylua -v --verify lua/rocks/ plugin/ installer.lua

check:
	luacheck lua/rocks plugin/ installer.lua

test-offline:
	busted --run=offline spec

docgen:
	nvim --headless --clean -u NONE -l scripts/generate_api_docs.lua

PANVIMDOC_DIR ?= .panvimdoc

documentation:
	@[ -d "$(PANVIMDOC_DIR)" ] || git clone --depth 1 https://github.com/kdheepak/panvimdoc.git "$(PANVIMDOC_DIR)"
	@mkdir -p doc
	@for file in docs/*.md; do \
		[ -f "$$file" ] || continue; \
		name=$$(basename "$$file" .md); \
		echo "=> doc/$$name.txt"; \
		pandoc --citeproc \
			--lua-filter="$(PANVIMDOC_DIR)/scripts/include-files.lua" \
			--lua-filter="$(PANVIMDOC_DIR)/scripts/skip-blocks.lua" \
			-t "$(PANVIMDOC_DIR)/scripts/panvimdoc.lua" \
			--metadata toc:true \
			--metadata treesitter:true \
			--metadata "project:$$name" \
			--metadata "incrementheadinglevelby:0" \
			--metadata "titledatepattern:%Y %B %d" \
			--metadata "dedupsubheadings:true" \
			--metadata "ignorerawblocks:true" \
			--metadata "docmapping:false" \
			--metadata "docmappingproject:true" \
			"$$file" -o "doc/$$name.txt"; \
	done

