#!/usr/bin/env bash
# ==============================================================================
# Claude UI Theme Installer for Hermes Agent
# Repository: https://github.com/mrburgercheese/HB-Hermes-Theme-Claude-UI
# ==============================================================================

set -e

REPO_BASE="https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main"
THEME_CHOICE="claude-dark"

# Parse optional arguments
for arg in "$@"; do
  case "$arg" in
    --light|-l)
      THEME_CHOICE="claude-light"
      ;;
    --dark|-d)
      THEME_CHOICE="claude-dark"
      ;;
  esac
done

echo ""
echo "  ╔════════════════════════════════════════════════════════════╗"
echo "  ║         Hermes Agent — Claude UI Theme Installer           ║"
echo "  ║         Anthropic Warm Terracotta & Clean Aesthetic        ║"
echo "  ╚════════════════════════════════════════════════════════════╝"
echo ""

# 1. Resolve Hermes Home Directory
if [ -n "$HERMES_HOME" ]; then
  TARGET_HERMES_HOME="$HERMES_HOME"
elif [ -n "$LOCALAPPDATA" ] && [ -d "$LOCALAPPDATA/hermes" ]; then
  TARGET_HERMES_HOME="$LOCALAPPDATA/hermes"
elif [ -d "$HOME/.hermes" ]; then
  TARGET_HERMES_HOME="$HOME/.hermes"
elif [ -n "$LOCALAPPDATA" ]; then
  TARGET_HERMES_HOME="$LOCALAPPDATA/hermes"
else
  TARGET_HERMES_HOME="$HOME/.hermes"
fi

SKINS_DIR="$TARGET_HERMES_HOME/skins"
mkdir -p "$SKINS_DIR"

echo "  📁 Target Skins Directory: $SKINS_DIR"

# 2. Download or copy skin files
SKIN_FILES=("claude-dark.yaml" "claude-light.yaml" "claude.yaml")
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

for skin in "${SKIN_FILES[@]}"; do
  if [ -f "$SCRIPT_DIR/skins/$skin" ]; then
    echo "  📦 Copying $skin (local)..."
    cp "$SCRIPT_DIR/skins/$skin" "$SKINS_DIR/$skin"
  else
    echo "  🌐 Downloading $skin from GitHub..."
    curl -fsSL "$REPO_BASE/skins/$skin" -o "$SKINS_DIR/$skin"
  fi
done

echo "  ✓ Skin files installed successfully."
echo ""

# 3. Apply Hermes Configuration
if command -v hermes >/dev/null 2>&1; then
  echo "  ⚙️ Applying optimal Claude UI configurations..."
  
  # Set active skin
  hermes config set display.skin "$THEME_CHOICE"
  
  # Set collapsible reasoning (cleaner chat feed like Claude 3.7)
  hermes config set display.show_reasoning false
  
  # Set friendly product-oriented tool labels
  hermes config set display.friendly_tool_labels true
  hermes config set display.turn_summary true
  
  # Set clean distraction-free display
  hermes config set display.show_cost false
  hermes config set display.pet.enabled false
  
  # Set clean sans-serif typography
  hermes config set desktop.font_family "Inter, 'Segoe UI', system-ui, -apple-system, sans-serif"

  echo ""
  echo "  ✨ All settings applied successfully! Active skin: $THEME_CHOICE"
  echo "  💡 Tips:"
  echo "     - Switch to Light Mode: hermes config set display.skin claude-light (or Shift+X in Desktop)"
  echo "     - Switch to Dark Mode:  hermes config set display.skin claude-dark"
  echo "     - Interactive Picker:   /skin"
  echo ""
else
  echo "  ⚠️ 'hermes' command not found in PATH."
  echo "     Please run manually: hermes config set display.skin $THEME_CHOICE"
  echo ""
fi
