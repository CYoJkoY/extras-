<div align="center">
  <img src="./assets/logo-placeholder.svg" width="80" height="80" alt="extra- bucket logo">
  <h1 style="font-weight: 350; color: #E6DED6;">extra- — Scoop Bucket</h1>
  <p style="font-size: 1.2em; color: #BEB8AE;">The Tool Supply Station Outside Scoop's Official Repositories</p>
  <p style="color: #8A9E8B;">A supplementary software package repository for the Windows package manager Scoop, covering useful tools not included in official buckets</p>
</div>

<p align="center">
  <a href="https://scoop.sh"><img src="https://img.shields.io/badge/Scoop-extra--blue?style=flat-square&logo=scoop" alt="Scoop"></a>
  <a href="https://github.com/CYoJkoY/extras-"><img src="https://img.shields.io/github/repo-size/CYoJkoY/extras-?style=flat-square" alt="GitHub repo size"></a>
  <a href="https://github.com/CYoJkoY/extras-/blob/master/LICENSE"><img src="https://img.shields.io/github/license/CYoJkoY/extras-?style=flat-square" alt="GitHub license"></a>
  <a href="#"><img src="https://img.shields.io/badge/Platform-Windows-8A9E8B?style=flat-square" alt="Platform"></a>
  <a href="#"><img src="https://img.shields.io/badge/💰-Support-9E8F7E?style=flat-square&logo=buy-me-a-coffee&logoColor=BEB8AE" alt="Support"></a>
</p>

<p align="center" style="margin-top: -10px;">
  <a href="#overview">Overview</a> ·
  <a href="#core-features">Core Features</a> ·
  <a href="#quick-reference">Quick Reference</a> ·
  <a href="#installation--setup">Installation &amp; Setup</a> ·
  <a href="#bucket-management">Bucket Management</a> ·
  <a href="#project-structure">Project Structure</a> ·
  <a href="#implementation-highlights">Implementation Highlights</a> ·
  <a href="#security-notes">Security Notes</a> ·
  <a href="#contributing--feedback">Contributing &amp; Feedback</a>
</p>

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Overview

**extra-** is a supplementary software package repository (bucket) for [Scoop](https://scoop.sh), maintained by [@CYojkoY](https://github.com/CYoJkoY).

Scoop's official buckets (`main`, `extras`, etc.) include a large number of commonly used applications, but many useful tools remain absent. **extra-** aims to fill these gaps, allowing Windows users to install these tools with a unified `scoop install` command, eliminating the need for manual downloads, extraction, and PATH configuration.

This repository follows the Scoop manifest specification, and all packages are tested and verified to ensure a stable and reliable installation process.

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Core Features

<div style="background: #2A2A2A; border-radius: 12px; padding: 20px; margin: 16px 0;">
  <h3>📦 One-Click Installation</h3>
  <ul>
    <li>Install with <code>scoop install extras/&lt;package&gt;</code> — automatically handles dependencies and PATH configuration</li>
    <li>Supports <code>scoop update</code> for unified updates of all installed packages</li>
    <li>All manifests are verified with <code>scoop hash</code> to ensure download integrity</li>
  </ul>
</div>

<div style="background: #2A2A2A; border-radius: 12px; padding: 20px; margin: 16px 0;">
  <h3>🔧 Easy Maintenance</h3>
  <ul>
    <li>Manifest files are centralized in the <code>bucket/</code> directory with a clean structure</li>
    <li>Adding new packages or updating versions requires only modifying a single JSON file</li>
    <li>Supports <code>scoop info</code> for quick package details lookup</li>
  </ul>
</div>

<div style="background: #2A2A2A; border-radius: 12px; padding: 20px; margin: 16px 0;">
  <h3>🤝 Community-Driven</h3>
  <ul>
    <li>Issues and Pull Requests are welcome to recommend new tools</li>
    <li>Maintainers will review and assist in refining manifests</li>
    <li>The goal is to complement, not replace, the official buckets</li>
  </ul>
</div>

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Quick Reference

| Category | Command / Action | Description |
|----------|------------------|-------------|
| **Add bucket** | `scoop bucket add extras https://github.com/CYoJkoY/extras-` | Add this repository as a Scoop bucket |
| **Install package** | `scoop install extras/<package>` | Install a specific package from this bucket |
| **View package info** | `scoop info <package>` | Display package details (version, URL, dependencies, etc.) |
| **Update all packages** | `scoop update *` | Update all packages installed via Scoop |
| **List installed packages** | `scoop list` | Show all currently installed packages |
| **Remove package** | `scoop uninstall <package>` | Uninstall a specific package |
| **Test manifest locally** | `scoop install ./bucket/<package>.json` | Validate manifest locally before submitting |
| **Compute file hash** | `scoop hash <file-path>` | Generate SHA-256 hash for the manifest |

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Installation & Setup

### Prerequisites

- **Operating System**: Windows 7 / 8 / 10 / 11
- **Scoop**: Already installed and configured (if not, run the following commands first)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

### Quick Start

1. **Add this bucket**

```powershell
scoop bucket add extras https://github.com/CYoJkoY/extras-
```

2. **View available packages**

```powershell
scoop search extras/
```

3. **Install a package**

```powershell
scoop install extras/<package>
```

### Optional Configuration

- **Configure bucket priority**: If a package exists in both this bucket and an official bucket, adjust bucket order to control the installation source
- **Use a proxy**: If your network is restricted, configure Scoop to use a proxy:

```powershell
scoop config proxy <proxy-address>
```

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Bucket Management

### Adding a New Package

1. Create `<package>.json` in the `bucket/` directory, following the [Scoop Manifest Specification](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests).
2. Test the installation locally:

```powershell
scoop install ./bucket/<package>.json
```

3. Submit a Pull Request after confirming it works correctly.

### Updating an Existing Package

- Modify the `version` and `url` fields in the manifest
- Update the `hash` field using `scoop hash <downloaded-file>`
- Test the installation and submit a PR

### Manifest Key Fields Reference

| Field | Type | Description |
|-------|------|-------------|
| `version` | string | Software version, e.g. `1.2.3` |
| `description` | string | Brief description |
| `homepage` | string | Project homepage URL |
| `license` | string | License identifier (e.g. `MIT`, `GPL-3.0`) |
| `url` | string | Download URL (supports `.zip`, `.7z`, `.exe`, etc.) |
| `hash` | string | SHA-256 hash of the file |
| `bin` | string/array | Path to executable(s) to add to PATH after installation |
| `depends` | array | Dependencies on other packages |
| `extract_dir` | string | Subdirectory to enter after extraction |
| `checkver` | object/string | Rules for version update detection |
| `autoupdate` | object | Auto-update URL template |

### Automated Checks (Recommended)

Consider setting up GitHub Actions or AppVeyor to automatically validate manifests, following the [Scoop official CI template](https://github.com/ScoopInstaller/Scoop/wiki/AppVeyor).

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Project Structure

```
extras-
├─ assets
│  ├─ bar.svg
│  ├─ dots.svg
│  └─ logo-placeholder.svg
├─ bin
│  ├─ auto-pr.ps1
│  ├─ checkhashes.ps1
│  ├─ checkurls.ps1
│  ├─ checkver.ps1
│  ├─ formatjson.ps1
│  ├─ missing-checkver.ps1
│  └─ test.ps1
├─ bucket
│  ├─ app-name.json.template
│  ├─ Context-Menu-Manager-Plus.json
│  ├─ defender-control-disable.json
│  ├─ defender-control-enable.json
│  ├─ project-graph.json
│  ├─ RealWorld-Cursor-Editor.json
│  └─ Windhawk-dev.json
├─ LICENSE
└─ README.md
```

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Implementation Highlights

- **Manifest Validation**: All manifests are locally tested with `scoop install` before submission to ensure proper installation flow.
- **Hash Verification**: Every package uses `scoop hash` to compute the SHA-256, preventing tampering of downloaded files.
- **Version Detection**: The `checkver` field enables automatic version detection for quick updates.
- **Auto-Update Templates**: The `autoupdate` field dynamically generates new download URLs, reducing maintenance overhead.
- **Minimal Dependencies**: Relies only on Scoop core functionality, with no additional tools required.
- **Clean Directory Structure**: All manifests are centrally stored for easy batch management and browsing.
- **Community Friendly**: Issue and PR templates are in place to lower contribution barriers.

---

<div align="center">
  <img src="./assets/dots.svg" alt="dots separator">
</div>

## Security Notes

- **Source Trust**: All software in this bucket is sourced from official distribution channels (GitHub Releases, project websites, etc.). We do not host binary files — only download links and hash checksums are provided.
- **Hash Verification**: Every manifest includes a `hash` field. During installation, the SHA-256 of the downloaded file is automatically verified; installation aborts if they do not match.
- **User Responsibility**: Please verify the source and license of any software before use. If you have security concerns about a package, review its `homepage` and source repository.
- **Report Issues**: If you encounter any suspicious manifest or download link, please file an Issue immediately. Maintainers will respond as soon as possible.

---

<div align="center">
  <img src="./assets/bar.svg" alt="bar separator">
</div>

## Contributing & Feedback

Issues and Pull Requests are welcome!
Please ensure your contributions meet the following requirements:

- Package name matches the official software name
- Version number is accurate
- Correct download URL and SHA-256 hash are provided
- Local installation test passes (`scoop install ./bucket/<package>.json`)

If a tool you'd like to recommend is not yet available in any official bucket, this repository is the perfect place for it.

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).
You are free to use, modify, and distribute it, as long as the copyright notice is retained.

---

## 💰 Support the Author

If this bucket has saved you time hunting for installers, consider buying me a coffee! ☕

<div align="center">
  <a href="https://cyojkoy.github.io/Payment/">
    <img src="https://img.shields.io/badge/👉_Click_Here_to_Support-9E8F7E?style=for-the-badge&logo=buy-me-a-coffee&logoColor=BEB8AE" alt="Support Me Button">
  </a>
</div>

<div align="center">
  <br>
  <i style="color: #8A9E8B;">Made with ❤️ and Scoop</i>
</div>

---

<p align="center" style="color: #8A9E8B;">⭐ If this bucket helps you, give it a Star!</p>
