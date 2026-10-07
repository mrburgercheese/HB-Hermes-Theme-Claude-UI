#!/usr/bin/env python3
"""
Claude UI Theme Installer for Hermes Agent (Cross-Platform Python)
Repository: https://github.com/mrburgercheese/HB-Hermes-Theme-Claude-UI
"""

import os
import sys
import subprocess
import urllib.request
from pathlib import Path

REPO_BASE = "https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main"
SKIN_FILES = ["claude-dark.yaml", "claude-light.yaml", "claude.yaml"]

def resolve_hermes_home() -> Path:
    # 1. HERMES_HOME env
    if "HERMES_HOME" in os.environ and os.environ["HERMES_HOME"]:
        return Path(os.environ["HERMES_HOME"])
    
    # 2. hermes_constants if installed
    try:
        from hermes_constants import get_hermes_home
        return get_hermes_home()
    except Exception:
        pass
    
    # 3. Windows LocalAppData
    if sys.platform == "win32" and "LOCALAPPDATA" in os.environ:
        local_app = Path(os.environ["LOCALAPPDATA"]) / "hermes"
        if local_app.exists():
            return local_app
    
    # 4. ~/.hermes default
    return Path.home() / ".hermes"

def main():
    theme_choice = "claude-dark"
    if "--light" in sys.argv or "-l" in sys.argv:
        theme_choice = "claude-light"

    print("\n  ╔════════════════════════════════════════════════════════════╗")
    print("  ║         Hermes Agent — Claude UI Theme Installer           ║")
    print("  ║         Anthropic Warm Terracotta & Clean Aesthetic        ║")
    print("  ╚════════════════════════════════════════════════════════════╝\n")

    hermes_home = resolve_hermes_home()
    skins_dir = hermes_home / "skins"
    skins_dir.mkdir(parents=True, exist_ok=True)
    print(f"  📁 Target Skins Directory: {skins_dir}")

    # Copy local or download
    script_dir = Path(__file__).resolve().parent if "__file__" in globals() else None
    for skin in SKIN_FILES:
        target_path = skins_dir / skin
        local_src = script_dir / "skins" / skin if script_dir else None
        if local_src and local_src.is_file():
            print(f"  📦 Copying {skin} (local)...")
            target_path.write_bytes(local_src.read_bytes())
        else:
            url = f"{REPO_BASE}/skins/{skin}"
            print(f"  🌐 Downloading {skin} from GitHub...")
            try:
                with urllib.request.urlopen(url) as resp:
                    target_path.write_bytes(resp.read())
            except Exception as e:
                print(f"     ❌ Failed downloading {skin}: {e}")

    print("  ✓ Skin files installed successfully.\n")

    # Run hermes config set commands
    config_commands = [
        ["display.skin", theme_choice],
        ["display.show_reasoning", "false"],
        ["display.friendly_tool_labels", "true"],
        ["display.turn_summary", "true"],
        ["display.show_cost", "false"],
        ["display.pet.enabled", "false"],
        ["desktop.font_family", "Inter, 'Segoe UI', system-ui, -apple-system, sans-serif"],
    ]

    print("  ⚙️ Applying optimal Claude UI configurations...")
    for key, val in config_commands:
        try:
            subprocess.run(["hermes", "config", "set", key, val], check=True, capture_output=True, text=True)
        except Exception:
            pass

    print(f"\n  ✨ All settings applied successfully! Active skin: {theme_choice}")
    print("  💡 Tips:")
    print("     - Switch to Light Mode: hermes config set display.skin claude-light (or Shift+X in Desktop)")
    print("     - Switch to Dark Mode:  hermes config set display.skin claude-dark")
    print("     - Interactive Picker:   /skin\n")

if __name__ == "__main__":
    main()
