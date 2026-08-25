.DEFAULT_GOAL := help

##@ Help

.PHONY: help-grep
help-grep: ## Show this help message using grep + sed
	@echo 'Usage:'
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) \
		| sed -E 's/:[^#]*## */|/' \
		| column -t -s '|' \
		| sed 's/^/  /'

.PHONY: help
help: ## Show this help message using awk
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n"} \
		/^##@/ { sub(/^##@ */, ""); printf "\n\033[0;33m%s\033[0m\n", $$0; next } \
		/^[a-zA-Z_-]+:.*##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: help-shell
help-shell: ## Show this help message using shell
	@echo 'Usage:'
	@cat $(MAKEFILE_LIST) | while IFS= read -r line; do \
		case $$line in \
			'##@ '*) \
				printf '\n\033[0;33m%s\033[0m\n' "$${line#'##@ '}";; \
			[a-zA-Z_-]*:*'##'*) \
				printf '  \033[36m%-20s\033[0m%s\n' "$${line%%:*}" "$${line#*'## '}";; \
		esac; \
	done

##@ Build

.PHONY: build
build: ## Compile the code
	@echo 'Start building'

BIN := myapp

.PHONY: $(BIN)
$(BIN): ## Variable target
	@echo 'Building $(BIN)'

##@ Test

.PHONY: test
test: unittest ## Run test
	@echo 'Start testing'

.PHONY: unittest
unittest: ## Run unittest
	@echo 'Start unittesting'

##@ target N

.PHONY: targetA
targetA: ## Run targetA
	@echo "Doing targetA"

.PHONY: targetB
targetB: ## Run targetB
	@echo "Doing targetB"

targetC:
	@echo "Doing targetC"
