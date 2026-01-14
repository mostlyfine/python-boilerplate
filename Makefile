.DEFAULT_GOAL := help
UV ?= uv

.PHONY: $(shell grep -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | sed 's/://')

help: ## Show available make targets
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "\033[36m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Initialize project (uv)
	$(UV) init

sync: ## Install/sync Python dependencies (uv)
	$(UV) sync

check: typecheck lintfix fmt ## type-check/lint/format (ruff + ty)

marimo: ## Launch marimo editor
	$(UV) run marimo edit

run: ## Run main.py via uv
	$(UV) run main.py

fmt: ## Format with ruff
	$(UV) run ruff format

lint: ## Lint with ruff (no auto-fix)
	$(UV) run ruff check

lintfix: ## Lint with ruff (auto-fix)
	$(UV) run ruff check --fix

typecheck: ## Type-check with ty
	$(UV) run ty check

clean: ## Remove common local caches
	rm -rf .venv .ruff_cache .pytest_cache __pycache__ .mypy_cache .ty_cache *.pyc
