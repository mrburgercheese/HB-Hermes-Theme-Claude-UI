# 🏛️ Hermes Agent — Claude UI Theme & Config Package

[![Hermes Agent](https://img.shields.io/badge/Hermes_Agent-Theme-D97757?style=flat-square&logo=anthropic)](https://hermes-agent.nousresearch.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-383532?style=flat-square)](LICENSE)
[![Release](https://img.shields.io/badge/Version-v1.1.0-D97757?style=flat-square)](https://github.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/releases/tag/v1.1.0)
[![Styles](https://img.shields.io/badge/Styles-Dark%20%26%20Light-1F1E1D?style=flat-square)](#-color-palette)

Paket tema dan konfigurasi **Claude UI (Anthropic)** untuk [Hermes Agent](https://github.com/NousResearch/hermes-agent) (Desktop App, TUI, dan CLI). Menghadirkan palet warna khas *warm terracotta & espresso/parchment*, tipografi bersih, serta konfigurasi *distraction-free* yang dirancang khusus untuk kenyamanan membaca percakapan panjang.

---

## ✨ Fitur & Keunggulan

- 🎨 **Palet Otentik Anthropic Claude**:
  - **Claude Dark**: Latar *warm espresso / charcoal* (`#1F1E1D`) dengan aksen *terracotta coral* (`#D97757`) dan teks *warm cream* (`#ECE6DE`).
  - **Claude Light**: Latar *warm parchment / cream* (`#E6DFD3`) dengan aksen *terracotta brown* (`#C96442`) dan teks *charcoal* (`#141414`).
- 👁️ **WCAG AA Compliant**: Kontras warna tinggi dan nyaman di mata untuk sesi coding & riset maraton.
- 📐 **Collapsible Thinking / Reasoning**: Blok pemikiran model terlipat otomatis rapi seperti fitur *Thinking* di Claude 3.7.
- 🧰 **Product-Oriented Tool Summaries**: Ringkasan aksi tool yang ringkas dan ramah pembaca, bukan raw dump JSON.
- 🔤 **Modern Sans Typography**: Konfigurasi font otomatis `Inter / Segoe UI / SF Pro` untuk tampilan modern.
- 🧹 **Distraction-Free**: Nonaktifkan badge cost token dan gamifikasi visual agar fokus pada teks.
- ⚡ **Multi-Surface Hot Reload**: Otomatis diterapkan serentak ke **Desktop GUI, TUI, dan CLI** secara *live*.

---

## 🚀 Instalasi Cepat (One-Line Install)

Pilih salah satu metode instalasi sekali jalan sesuai sistem Anda:

### 1. Linux / macOS / WSL / Git Bash (cURL)
```bash
curl -fsSL https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main/install.sh | bash
```
> *Ingin langsung aktif di Light Mode? Tambahkan flag `--light`:*
> `curl -fsSL https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main/install.sh | bash -s -- --light`

---

### 2. Windows PowerShell
```powershell
irm https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main/install.ps1 | iex
```

---

### 3. Universal Python (Cross-Platform)
```bash
python -c "import urllib.request; exec(urllib.request.urlopen('https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Theme-Claude-UI/main/install.py').read().decode())"
```

---

### 4. Langsung minta ke Hermes Agent (AI Prompt)
Cukup copy-paste prompt berikut ke sesi chat Hermes Anda:

```text
Tolong pasang dan terapkan tema Claude UI dari repositori https://github.com/mrburgercheese/HB-Hermes-Theme-Claude-UI ke sistem Hermes saya.
```

---

## 🛠️ Cara Ganti Tema & Pengaturan

### Gonta-ganti Tema (Dark / Light)
- **Beralih ke Claude Light**:
  ```bash
  hermes config set display.skin claude-light
  ```
- **Beralih ke Claude Dark**:
  ```bash
  hermes config set display.skin claude-dark
  ```
- **Pilih Interaktif**: Ketik `/skin` di kolom composer chat.
- **Toggle Cepat di Desktop**: Tekan **`Shift + X`** untuk toggle Dark/Light mode seketika.

---

## 🎨 Color Palette Reference

### Claude Dark (`claude-dark.yaml`)
| Elemen | Hex Color | Deskripsi |
|---|---|---|
| **Canvas Background** | `#1F1E1D` | Warm Espresso / Charcoal |
| **Primary Accent** | `#D97757` | Anthropic Terracotta Coral |
| **Title / Headings** | `#F4EDE4` | Warm Off-White |
| **Body Foreground** | `#ECE6DE` | Warm Cream Text |
| **Muted / Secondary** | `#9C9489` | Warm Grey Secondary |
| **Borders & Dividers** | `#383532` | Subtle Charcoal Border |
| **Status Bar BG** | `#181716` | Deep Base Background |

### Claude Light (`claude-light.yaml`)
| Elemen | Hex Color | Deskripsi |
|---|---|---|
| **Canvas Background** | `#E6DFD3` | Warm Parchment / Cream |
| **Primary Accent** | `#C96442` | Warm Terracotta Brown |
| **Title / Headings** | `#1F1E1D` | Deep Charcoal |
| **Body Foreground** | `#141414` | Warm Dark Grey |
| **Muted / Secondary** | `#4A4642` | Muted Secondary Grey |
| **Borders & Dividers** | `#CFC5B4` | Subtle Parchment Border |
| **Status Bar BG** | `#DAD2C4` | Warm Soft Base |

---

## 📂 Struktur Repositori

```
HB-Hermes-Theme-Claude-UI/
├── skins/
│   ├── claude-dark.yaml     # Skin Dark Mode (Espresso & Terracotta)
│   ├── claude-light.yaml    # Skin Light Mode (Parchment & Terracotta)
│   └── claude.yaml          # Default Alias
├── config.example.yaml      # Rekomendasi konfigurasi display & sistem Hermes (tanpa model/keys)
├── install.sh               # Bash installer (Linux/macOS/WSL)
├── install.ps1              # PowerShell installer (Windows)
├── install.py               # Universal Python installer
├── LICENSE                  # MIT License
└── README.md                # Dokumentasi
```

---

## 📄 Lisensi
Dirilis di bawah lisensi [MIT License](LICENSE). Dibuat untuk komunitas Hermes Agent oleh [mrburgercheese](https://github.com/mrburgercheese).
