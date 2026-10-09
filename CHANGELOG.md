# Changelog

Semua perubahan dan rilis pada **Hermes Agent — Claude UI Theme & Config Package** dicatat dalam dokumen ini.

Format penamaan versi mengikuti [Semantic Versioning](https://semver.org/).

---

## [1.2.0] - 2026-10-09 11:30
### Added
- **Template Konfigurasi Rekomendasi (`config.example.yaml`)**:
  - Menyertakan konfigurasi display optimal Claude UI (font `Inter, 'Segoe UI', system-ui, -apple-system, sans-serif`, *collapsible reasoning*, *friendly tool badges*, *turn summary*, *distraction-free mode*).
  - Menyertakan konfigurasi sistem Hermes lengkap (terminal, guardrails, compression, prompt caching, memory, delegation, skills, platform toolsets).
  - Dibuat aman untuk publik dengan mengecualikan konfigurasi privat model dan API provider (`model:`, `providers:`).
- **Pembaruan Dokumentasi (`README.md`)**:
  - Menambahkan referensi berkas `config.example.yaml` pada bagan struktur repositori.
  - Memperbarui badge versi rilis ke `v1.2.0`.

---

## [1.1.0] - 2026-10-07 20:16
### Changed & Enhanced
- **Peningkatan Kontras Warna (WCAG AA Compliant)**:
  - **Claude Dark (`claude-dark.yaml` & `claude.yaml`)**: Mengubah warna judul dan teks aktif menjadi solid white (`#FFFFFF`) dan `ui_primary: "#FFFFFF"` untuk visibilitas teks dan tab header yang tajam di atas latar charcoal `#1F1E1D`.
  - **Claude Light (`claude-light.yaml`)**: Mengubah latar canvas menjadi warm parchment lembut (`#E6DFD3`), warna judul `#111111`, teks utama `#141414`, dan secondary text `#4A4642` agar tidak silau dan nyaman dibaca.
- **Arsitektur Native Skin**:
  - Mengoptimalkan rendering palet warna murni berbasis skin native Hermes Agent untuk TUI, CLI, dan Desktop App.

---

## [1.0.0] - 2026-10-07 10:31
### Added
- **Rilis Awal Claude UI Theme & Config Package**:
  - Skin **Claude Dark** (`skins/claude-dark.yaml`): Palet warm espresso (`#1F1E1D`) dengan aksen terracotta coral (`#D97757`).
  - Skin **Claude Light** (`skins/claude-light.yaml`): Palet warm parchment dengan aksen terracotta brown (`#C96442`).
  - Default Skin Alias (`skins/claude.yaml`).
  - Skrip instalasi otomatis:
    - `install.sh` untuk Linux, macOS, WSL, dan Git Bash.
    - `install.ps1` untuk Windows PowerShell.
    - `install.py` untuk Universal Python (Cross-Platform).
  - Dokumentasi instalasi, panduan gonta-ganti tema, dan tabel referensi palet warna (`README.md`).
  - Lisensi MIT (`LICENSE`).
