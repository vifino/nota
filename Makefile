# Tools
CARBON?=$(shell which carbon)

# Varables
APPLETS=$(patsubst applets/%.lua,%,$(wildcard applets/*.lua))
GIT_VERSION:=$(shell git describe --abbrev=7 --dirty --always --tags)

# Main
all: nota install-applets

nota: nota.lua $(wildcard frontend/*.lua)
	zip nota.zip -r nota.lua frontend
	( echo "#!$(CARBON) -app" && cat nota.zip ) > nota
	chmod +x nota

# Build hash and stuff.
nota.lua: nota.src.lua
	sed \
		-e "s/local nota_build_date = os.clock../local nota_build_date = $(shell date +%s)/" \
		-e "s/local nota_git_info = \"RUNFROMSOURCE\"/local nota_git_info = \"$(GIT_VERSION)\"/" \
		$< > $@

clean:
	rm nota nota.lua nota.zip

# Applets
install-applets: $(APPLETS)
%: applets/%.lua
	./nota install $@ $<

