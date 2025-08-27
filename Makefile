.PHONY: all en fr clean clean-all

LATEXMK = latexmk -pdf -interaction=nonstopmode
BUILD_DIR = build
SRC_DIR = src

all: en fr

# Build letter in English
en:
	@echo "Building English letter..."
	@cd $(BUILD_DIR) && $(LATEXMK) letter_en.tex
	@echo "Cleaning build files..."
	@cd $(BUILD_DIR) && $(LATEXMK) -c letter_en.tex

# Build letter in French
fr:
	@echo "Building French letter..."
	@cd $(BUILD_DIR) && $(LATEXMK) letter_fr.tex
	@echo "Cleaning build files..."
	@cd $(BUILD_DIR) && $(LATEXMK) -c letter_fr.tex

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	@cd $(BUILD_DIR) && $(LATEXMK) -c letter_en.tex 2>/dev/null || true
	@cd $(BUILD_DIR) && $(LATEXMK) -c letter_fr.tex 2>/dev/null || true
	@echo "Removing synctex.gz files..."
	@rm -f $(BUILD_DIR)/*.synctex.gz
	@echo "Done."

# Clean all generated files including PDFs
clean-all: clean
	@echo "Cleaning all generated files..."
	@rm -f $(BUILD_DIR)/*.pdf
	@echo "Done."

