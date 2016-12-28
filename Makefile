####################
# Useful Variables #
####################
OS = $(shell uname -s)

###########
# Targets #
###########
install: .deps-$(OS)
	bash ./install.sh

.deps-Darwin:
	$(call green, "Installing deps for Mac...")
	@which zsh || brew install zsh
	@which pt || brew install pt
	@which tree || brew install tree
	@which n || curl -L https://git.io/n-install | bash
	which ctags || brew install ctags

.deps-Linux:
	@echo Installing dependencies for Linux...
	which zsh || sudo apt install zsh -y
	# which pt || go get github.com/monochromegane/the_platinum_searcher && GOBIN=$(GOPATH)/bin go install github.com/monochromegane/the_platinum_searcher/cmd/pt
	which tree || sudo apt install tree
	which n || curl -L https://git.io/n-install | bash
	which ctags || sudo apt install exuberant-ctags


#####################
# Utility Functions #
#####################
ESC_SEQ=\033[
COL_RESET=$(ESC_SEQ)0m
COL_RED=$(ESC_SEQ)31;01m
COL_GREEN=$(ESC_SEQ)32;01m

define green
	@echo "$(COL_GREEN)$(1)$(COL_RESET)"
endef

define red
	@echo "$(COL_RED)$(1)$(COL_RESET)"
endef

PHONY: install
