/**
 * Claude Enhanced Tabs Plugin for Hermes Desktop
 * Expands top header tab height and provides distinct, spaced tabs for Dark & Light modes.
 */

const STYLE_ID = 'claude-enhanced-tabs-custom-css';

const CSS_CONTENT = `
  /* Top Tab Strip Container */
  .group\\/pane-header,
  [data-zone-tabstrip] {
    height: 38px !important;
    min-height: 38px !important;
    padding: 3px 6px 0 6px !important;
    background: var(--ui-sidebar-surface-background) !important;
    border-bottom: 1px solid var(--ui-border, var(--ui-stroke-quaternary, rgba(128, 128, 128, 0.15))) !important;
    align-items: flex-end !important;
  }

  /* Tablist Container */
  .group\\/pane-header [role="tablist"],
  [data-zone-tabstrip] [role="tablist"] {
    display: flex !important;
    align-items: flex-end !important;
    gap: 6px !important;
    padding: 0 2px !important;
    height: 100% !important;
  }

  /* Individual Pane Tabs */
  .group\\/pane-header [data-tree-tab],
  [data-zone-tabstrip] [data-tree-tab],
  .group\\/tab {
    height: 32px !important;
    min-height: 32px !important;
    max-height: 32px !important;
    padding: 0 12px !important;
    margin: 0 !important;
    border-radius: 6px 6px 0 0 !important;
    transition: all 0.15s ease-in-out !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    border-top: 1px solid var(--ui-stroke-tertiary, rgba(128, 128, 128, 0.2)) !important;
    border-left: 1px solid var(--ui-stroke-tertiary, rgba(128, 128, 128, 0.2)) !important;
    border-right: 1px solid var(--ui-stroke-tertiary, rgba(128, 128, 128, 0.2)) !important;
    border-bottom: none !important;
  }

  /* Inactive Tab State */
  .group\\/pane-header [data-tree-tab]:not([data-active="true"]),
  [data-zone-tabstrip] [data-tree-tab]:not([data-active="true"]),
  .group\\/tab:not([data-active="true"]) {
    background: color-mix(in srgb, var(--ui-sidebar-surface-background) 70%, transparent) !important;
    opacity: 0.85 !important;
  }

  /* Inactive Tab - Dark Mode Text */
  .dark .group\\/pane-header [data-tree-tab]:not([data-active="true"]),
  .dark [data-zone-tabstrip] [data-tree-tab]:not([data-active="true"]),
  .dark .group\\/tab:not([data-active="true"]),
  .dark .group\\/tab:not([data-active="true"]) span {
    color: #a8a29e !important;
  }

  /* Inactive Tab - Light Mode Text */
  :not(.dark) .group\\/pane-header [data-tree-tab]:not([data-active="true"]),
  :not(.dark) [data-zone-tabstrip] [data-tree-tab]:not([data-active="true"]),
  :not(.dark) .group\\/tab:not([data-active="true"]),
  :not(.dark) .group\\/tab:not([data-active="true"]) span {
    color: #57534e !important;
  }

  /* Inactive Tab Hover */
  .group\\/pane-header [data-tree-tab]:not([data-active="true"]):hover,
  [data-zone-tabstrip] [data-tree-tab]:not([data-active="true"]):hover,
  .group\\/tab:not([data-active="true"]):hover {
    background: color-mix(in srgb, var(--ui-sidebar-surface-background) 95%, #fff 5%) !important;
    opacity: 1 !important;
    border-color: var(--ui-stroke-secondary, rgba(128, 128, 128, 0.35)) !important;
  }
  .dark .group\\/tab:not([data-active="true"]):hover span {
    color: #ffffff !important;
  }
  :not(.dark) .group\\/tab:not([data-active="true"]):hover span {
    color: #111111 !important;
  }

  /* Active Tab State */
  .group\\/pane-header [data-tree-tab][data-active="true"],
  [data-zone-tabstrip] [data-tree-tab][data-active="true"],
  .group\\/tab[data-active="true"] {
    background: var(--ui-editor-surface-background, var(--background)) !important;
    opacity: 1 !important;
    font-weight: 600 !important;
    border-top: 1px solid var(--ui-stroke-secondary, rgba(128, 128, 128, 0.35)) !important;
    border-left: 1px solid var(--ui-stroke-secondary, rgba(128, 128, 128, 0.35)) !important;
    border-right: 1px solid var(--ui-stroke-secondary, rgba(128, 128, 128, 0.35)) !important;
    box-shadow: inset 0 -3px 0 var(--pane-tab-active-accent, var(--ui-accent, #d97757)) !important;
    z-index: 2 !important;
  }

  /* Active Tab Text - Dark Mode (Bright Clear White) */
  .dark .group\\/pane-header [data-tree-tab][data-active="true"],
  .dark [data-zone-tabstrip] [data-tree-tab][data-active="true"],
  .dark .group\\/tab[data-active="true"],
  .dark .group\\/tab[data-active="true"] span,
  .dark [data-tree-tab][data-active="true"] span {
    color: #ffffff !important;
    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.35);
  }

  /* Active Tab Text - Light Mode (Crisp Black/Charcoal) */
  :not(.dark) .group\\/pane-header [data-tree-tab][data-active="true"],
  :not(.dark) [data-zone-tabstrip] [data-tree-tab][data-active="true"],
  :not(.dark) .group\\/tab[data-active="true"],
  :not(.dark) .group\\/tab[data-active="true"] span,
  :not(.dark) [data-tree-tab][data-active="true"] span {
    color: #111111 !important;
  }

  /* Tab Text / Label Typography */
  .group\\/pane-header [data-tree-tab] span,
  [data-zone-tabstrip] [data-tree-tab] span,
  .group\\/tab span {
    font-size: 11px !important;
    font-weight: 600 !important;
    letter-spacing: 0.035em !important;
    line-height: normal !important;
  }

  /* Add / New Tab Button Styling */
  .group\\/pane-header button[title*="new"],
  [data-zone-tabstrip] button[title*="new"],
  .group\\/pane-header [data-slot="new-session-button"],
  [data-zone-tabstrip] [data-slot="new-session-button"] {
    height: 28px !important;
    width: 28px !important;
    margin-left: 4px !important;
    border-radius: 6px !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
  }
`;

function injectStyles() {
  if (typeof document === 'undefined') return;
  let styleEl = document.getElementById(STYLE_ID);
  if (!styleEl) {
    styleEl = document.createElement('style');
    styleEl.id = STYLE_ID;
    document.head.appendChild(styleEl);
  }
  styleEl.textContent = CSS_CONTENT;
}

export default {
  id: 'claude-enhanced-tabs',
  name: 'Claude UI Enhanced Tabs',
  register(ctx) {
    injectStyles();
    if (typeof window !== 'undefined') {
      window.addEventListener('focus', injectStyles);
    }
  }
};
