<#
.SYNOPSIS
    Claude UI Theme Installer for Hermes Agent (Windows PowerShell)
.DESCRIPTION
    Installs Claude Dark, Claude Light, and Claude skins into Hermes Agent
    and applies optimal UI/UX settings.
.EXAMPLE
    irm https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main/install.ps1 | iex
#>

param (
    [string]$Theme = "claude-dark"
)

$ErrorActionPreference = "Stop"

$RepoBase = "https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main"

Write-Host ""
Write-Host "  ╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "  ║         Hermes Agent — Claude UI Theme Installer           ║" -ForegroundColor Cyan
Write-Host "  ║         Anthropic Warm Terracotta & Clean Aesthetic        ║" -ForegroundColor Cyan
Write-Host "  ╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 1. Resolve Hermes Home
$HermesHome = $env:HERMES_HOME
if (-not $HermesHome) {
    if ($env:LOCALAPPDATA -and (Test-Path "$env:LOCALAPPDATA\hermes")) {
        $HermesHome = "$env:LOCALAPPDATA\hermes"
    } elseif (Test-Path "$HOME\.hermes") {
        $HermesHome = "$HOME\.hermes"
    } elseif ($env:LOCALAPPDATA) {
        $HermesHome = "$env:LOCALAPPDATA\hermes"
    } else {
        $HermesHome = "$HOME\.hermes"
    }
}

$SkinsDir = Join-Path $HermesHome "skins"
if (-not (Test-Path $SkinsDir)) {
    New-Item -ItemType Directory -Path $SkinsDir -Force | Out-Null
}

Write-Host "  📁 Target Skins Directory: $SkinsDir" -ForegroundColor Gray

# 2. Download / Copy skins
$SkinFiles = @("claude-dark.yaml", "claude-light.yaml", "claude.yaml")
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path 2>$null

foreach ($skin in $SkinFiles) {
    $targetPath = Join-Path $SkinsDir $skin
    if ($ScriptDir -and (Test-Path (Join-Path $ScriptDir "skins\$skin"))) {
        Write-Host "  📦 Copying $skin (local)..." -ForegroundColor Gray
        Copy-Item -Path (Join-Path $ScriptDir "skins\$skin") -Destination $targetPath -Force
    } else {
        Write-Host "  🌐 Downloading $skin from GitHub..." -ForegroundColor Gray
        Invoke-WebRequest -Uri "$RepoBase/skins/$skin" -OutFile $targetPath -UseBasicParsing
    }
}

# 3. Desktop tab enhance plugin
$PluginsDir = Join-Path $HermesHome "desktop-plugins\claude-enhanced-tabs"
if (-not (Test-Path $PluginsDir)) {
    New-Item -ItemType Directory -Path $PluginsDir -Force | Out-Null
}
$PluginTarget = Join-Path $PluginsDir "plugin.js"
if ($ScriptDir -and (Test-Path (Join-Path $ScriptDir "desktop-plugins\claude-enhanced-tabs\plugin.js"))) {
    Write-Host "  📦 Copying claude-enhanced-tabs desktop plugin (local)..." -ForegroundColor Gray
    Copy-Item -Path (Join-Path $ScriptDir "desktop-plugins\claude-enhanced-tabs\plugin.js") -Destination $PluginTarget -Force
} else {
    Write-Host "  🌐 Downloading claude-enhanced-tabs desktop plugin from GitHub..." -ForegroundColor Gray
    Invoke-WebRequest -Uri "$RepoBase/desktop-plugins/claude-enhanced-tabs/plugin.js" -OutFile $PluginTarget -UseBasicParsing -ErrorAction SilentlyContinue
}

Write-Host "  ✓ Skin & Plugin files installed successfully." -ForegroundColor Green
Write-Host ""

# 4. Apply Config
$hermesCmd = Get-Command "hermes" -ErrorAction SilentlyContinue
if ($hermesCmd) {
    Write-Host "  ⚙️ Applying optimal Claude UI configurations..." -ForegroundColor Cyan
    
    & hermes config set display.skin $Theme
    & hermes config set display.show_reasoning false
    & hermes config set display.friendly_tool_labels true
    & hermes config set display.turn_summary true
    & hermes config set display.show_cost false
    & hermes config set display.pet.enabled false
    & hermes config set desktop.font_family "Inter, 'Segoe UI', system-ui, -apple-system, sans-serif"

    Write-Host ""
    Write-Host "  ✨ All settings applied successfully! Active skin: $Theme" -ForegroundColor Green
    Write-Host "  💡 Tips:" -ForegroundColor Yellow
    Write-Host "     - Switch to Light Mode: hermes config set display.skin claude-light (or Shift+X in Desktop)"
    Write-Host "     - Switch to Dark Mode:  hermes config set display.skin claude-dark"
    Write-Host "     - Interactive Picker:   /skin"
    Write-Host ""
} else {
    Write-Host "  ⚠️ 'hermes' command not found in PATH." -ForegroundColor Yellow
    Write-Host "     Please run manually: hermes config set display.skin $Theme"
    Write-Host ""
}
