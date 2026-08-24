.DEFAULT_GOAL := help

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
		/^[a-zA-Z_-]+:.*##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: help-shell
help-shell: ## Show this help message using shell
	@echo 'Usage:'
	@cat $(MAKEFILE_LIST) | while IFS= read -r line; do \
		case $$line in \
			[a-zA-Z_-]*:*'##'*) \
				printf '  \033[36m%-20s\033[0m%s\n' "$${line%%:*}" "$${line#*'## '}";; \
		esac; \
	done

.PHONY: build
build: ## Compile the code
	@echo 'start building'

.PHONY: test
test: unittest ## Run test
	@echo 'start testing'

.PHONY: unittest
unittest: ## Run unittest
	@echo 'start unittesting'

BIN := myapp

.PHONY: $(BIN)
$(BIN): ## Variable target
	@echo 'building $(BIN)'

.PHONY: target2
target2:
	@echo "doing target2"
