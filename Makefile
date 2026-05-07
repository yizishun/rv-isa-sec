# SpecHunter — batch analysis over RISC-V codebases.
#
# Run from the repository root:
#   make run              read all settings from spechunter.yaml
#   make PR_DIR=spec/riscv-isa-manual/pr-1581
#   make TARGETS="linux:~/riscv/linux"

.PHONY: run help

# ---- configuration ----------------------------------------------------------

PYTHON       ?= .venv/bin/python
PR_DIR       ?= spec/riscv-isa-manual/pr-2400

# 覆盖 spechunter.yaml 中的 target 定义（可选）
TARGETS ?=
TARGET_FLAGS = $(foreach t,$(TARGETS),--target $(t))

# ---- rules ------------------------------------------------------------------

run:
	$(PYTHON) -m spechunter.cli \
		--pr-dir $(PR_DIR) \
		$(TARGET_FLAGS)

help:
	@echo "SpecHunter Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make                          run with spechunter.yaml defaults"
	@echo "  make PR_DIR=spec/.../pr-1581  run against a different PR"
	@echo "  make TARGETS=\"linux:~/riscv/linux\"   override targets in config"
	@echo ""
	@echo "Variables:"
	@echo "  PR_DIR     path to spec/<repo>/pr-NNNN  (default: $(PR_DIR))"
	@echo "  TARGETS    space-separated LABEL:PATH   (default: from spechunter.yaml)"
