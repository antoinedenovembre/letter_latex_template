# Development Guide

This document contains detailed information for developers who want to work on or understand the technical aspects of this LaTeX letter template.

## Local Development

### Prerequisites

- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- `latexmk` command-line tool

### Building Locally

```bash
# Build both languages (recommended)
make all

# Build the English version
make en

# Build the French version
make fr

# Clean auxiliary files (keeps PDFs)
make clean

# Clean all generated files including PDFs
make clean-all
```

### Development Notes
- All source files are organized in the `src/` directory
- Built PDFs are generated in the `build/` directory  
- The build process automatically cleans auxiliary LaTeX files
- Modular architecture allows easy customization of individual components
- **Multi-language support**: English and French versions with shared configuration and styling

## Project Structure

```
resume/
├── build/
│   ├── letter_en.tex       # Main LaTeX file (EN)
│   └── letter_fr.tex       # Main LaTeX file (FR)
├── src/
│   ├── config/
│   │   ├── packages.tex        # LaTeX package imports and configuration
│   │   ├── style.tex           # Styling definitions and formatting
│   │   └── commands.tex        # Custom LaTeX commands
│   ├── content/
│   │   ├── letter_content_en.tex    # Main letter content (English)
│   │   └── letter_content_fr.tex    # Main letter content (French)
│   └── layout/
│       ├── header_en.tex      # Header layout (EN)
│       └── header_fr.tex      # Header layout (FR)
├── Makefile                   # Build automation
└── .gitignore                 # Git ignore rules
```

## Modular Architecture

The project uses a modular LaTeX architecture for better maintainability:

- **Configuration Layer** (`src/config/`): Package imports, styling, and custom commands (shared across languages)
- **Content Layer** (`src/content/`): Actual resume content with separate files per language
- **Layout Layer** (`src/layout/`): Different header layouts for photo variants and languages
- **Build Layer** (`build/`): Main document files that combine all modules for each version

### Multi-language Support

- **Shared Configuration**: All languages use the same packages, styles, and commands
- **Language-specific Content**: Separate content files for each language (`letter_content_en.tex` and `letter_content_fr.tex`)
- **Language-specific Headers**: Header files adapted for each language while maintaining the same styling
- **Consistent Build System**: Simple `make en` and `make fr` commands to build all versions for each language

## LaTeX Packages Used

### Core Packages
- `geometry` - Page layout and margins configuration
- `titlesec` - Section title customization
- `tabularx` & `array` - Advanced table formatting
- `xcolor` - Color definitions and primary color scheme
- `enumitem` - List customization and styling
- `fontawesome5` - Professional icons integration
- `hyperref` & `bookmark` - PDF metadata, links, and navigation

### Layout & Formatting
- `amsmath` - Mathematical expressions support
- `eso-pic` - Floating text positioning
- `calc` - Length calculations
- `lastpage` - Total page count reference
- `changepage` - Adjustable width environments
- `paracol` - Multi-column layout support
- `needspace` - Intelligent page break management

### Conditional Packages (Photo Version Only)
- `graphicx` - Image inclusion for profile photo
- `tikz` - Graphics and diagrams creation

### Engine Compatibility
- `iftex` - LaTeX engine detection
- `ifthen` - Conditional statements
- PDF/A compatibility packages for ATS parsing
