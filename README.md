<div align="center" style="background-color: #1E1E1E; padding: 40px 20px; border-radius: 28px;">
  <div style="background: #2A2A2A; border-radius: 36px; padding: 42px 18px; margin-bottom: 28px;">
    <img src="./assets/logo-placeholder.svg" alt="extra- bucket" width="80" height="80" style="border-radius: 16px;">
    <h1 style="color: #E6DED6; font-weight: 350; letter-spacing: 2px; margin: 18px 0 8px;">extra- — Scoop Bucket</h1>
    <p style="color: #BEB8AE; font-size: 1.2em; max-width: 700px; margin: 0 auto;">A curated supplementary Scoop bucket for useful Windows software that is not available in the official buckets.</p>
    <p style="color: #8A9E8B; font-size: 0.95em; margin-top: 12px;">Scoop manifests · Windows software · Verified hashes · Community contributions</p>
  </div>

  <p>
    <a href="https://scoop.sh"><img src="https://img.shields.io/badge/Scoop-Bucket-8A9E8B?style=flat-square&logo=scoop" alt="Scoop"></a>
    <a href="https://github.com/CYoJkoY/extras-"><img src="https://img.shields.io/github/repo-size/CYoJkoY/extras-?style=flat-square" alt="Repository size"></a>
    <a href="./LICENSE"><img src="https://img.shields.io/badge/License-MIT-7A8E8E?style=flat-square" alt="MIT License"></a>
    <img src="https://img.shields.io/badge/Platform-Windows-9E8F7E?style=flat-square" alt="Windows">
    <a href="https://cyojkoy.github.io/Payment/"><img src="https://img.shields.io/badge/Support_Me-9E8F7E?style=flat-square&logo=buy-me-a-coffee&logoColor=BEB8AE" alt="Support Me"></a>
  </p>

  <p style="word-spacing: 6px; margin-top: 20px;">
    <a href="#-overview" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Overview</a> &nbsp;•&nbsp;
    <a href="#-core-features" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Core Features</a> &nbsp;•&nbsp;
    <a href="#-quick-reference" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Quick Reference</a> &nbsp;•&nbsp;
    <a href="#-installation--setup" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Installation</a> &nbsp;•&nbsp;
    <a href="#-bucket-management" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Bucket Management</a> &nbsp;•&nbsp;
    <a href="#-project-structure" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Structure</a> &nbsp;•&nbsp;
    <a href="#-security-notes" style="color: #8A9E8B; text-decoration: none; border-bottom: 1px dotted #5A6B6B;">Security</a>
  </p>
</div>

<div align="center">
  <img src="./assets/dots.svg" alt="separator" width="160" height="12">
</div>

## 📖 Overview

**extra-** is a supplementary [Scoop](https://scoop.sh) bucket maintained by [@CYojkoY](https://github.com/CYoJkoY).

Scoop already provides extensive official buckets such as `main` and `extras`. This bucket focuses on additional utilities and specialized Windows applications that may not fit those official collections or may be useful to users of this repository.

The repository contains Scoop manifest files rather than packaged binaries. Scoop downloads software from the URLs defined by each manifest, verifies the supplied hash when one is present, extracts or installs the package, and applies the manifest's configuration.

> **Note**  
> This is an independent community bucket. Package availability, upstream release schedules, and manifest compatibility depend on the software publishers and the Scoop ecosystem.

## ✨ Core Features

<div style="background: #2A2A2A; border-radius: 20px; padding: 16px; margin: 16px 0;">
  <h3 style="margin-top: 0; color: #D6D2CC;">📦 Scoop-native Installation</h3>
  <ul style="color: #BEB8AE;">
    <li>Install supported applications through the standard <code>scoop install</code> workflow.</li>
    <li>Use Scoop's normal update, uninstall, and package-management commands.</li>
    <li>Let Scoop manage extraction, shims, PATH integration, and application directories according to each manifest.</li>
  </ul>
</div>

<div style="background: #2A2A2A; border-radius: 20px; padding: 16px; margin: 16px 0;">
  <h3 style="margin-top: 0; color: #D6D2CC;">🔧 Maintainable Manifests</h3>
  <ul style="color: #BEB8AE;">
    <li>Keep package definitions in the centralized <code>bucket/</code> directory.</li>
    <li>Use standard Scoop manifest fields such as <code>version</code>, <code>url</code>, <code>hash</code>, <code>bin</code>, <code>depends</code>, <code>checkver</code>, and <code>autoupdate</code>.</li>
    <li>Use repository scripts to support manifest checks, formatting, hash validation, URL validation, and version maintenance.</li>
  </ul>
</div>

<div style="background: #2A2A2A; border-radius: 20px; padding: 16px; margin: 16px 0;">
  <h3 style="margin-top: 0; color: #D6D2CC;">🔍 Reproducible Package Metadata</h3>
  <ul style="color: #BEB8AE;">
    <li>Record upstream download locations instead of storing application binaries in the repository.</li>
    <li>Use SHA-256 hashes where supported to detect changed or unexpected downloads.</li>
    <li>Keep version and update metadata close to each package definition.</li>
  </ul>
</div>

<div style="background: #2A2A2A; border-radius: 20px; padding: 16px; margin: 16px 0;">
  <h3 style="margin-top: 0; color: #D6D2CC;">🤝 Community-friendly Contributions</h3>
  <ul style="color: #BEB8AE;">
    <li>Accept package suggestions, manifest improvements, and update fixes through GitHub.</li>
    <li>Encourage local installation testing before submitting manifest changes.</li>
    <li>Keep the bucket focused on software that complements rather than duplicates the official Scoop ecosystem.</li>
  </ul>
</div>

## 🎹 Quick Reference

| Task | Command |
|---|---|
| Add the bucket | <code>scoop bucket add extras https://github.com/CYoJkoY/extras-</code> |
| Search this bucket | <code>scoop search &lt;package&gt;</code> |
| Install a package | <code>scoop install extras/&lt;package&gt;</code> |
| Inspect package metadata | <code>scoop info extras/&lt;package&gt;</code> |
| Update Scoop applications | <code>scoop update *</code> |
| List installed packages | <code>scoop list</code> |
| Remove a package | <code>scoop uninstall &lt;package&gt;</code> |
| Test a manifest locally | <code>scoop install ./bucket/&lt;package&gt;.json</code> |
| Calculate a file hash | <code>scoop hash &lt;file&gt;</code> |

## 🚀 Installation &amp; Setup

### Prerequisites

- Windows
- [Scoop](https://scoop.sh) installed and available in PowerShell

If Scoop is not installed yet:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

### Add the bucket

```powershell
scoop bucket add extras https://github.com/CYoJkoY/extras-
```

### Search for a package

```powershell
scoop search <package>
```

### Install a package

```powershell
scoop install extras/<package>
```

### Update later

```powershell
scoop update
scoop update <package>
```

> **Tip**  
> Scoop bucket names are local aliases. The command above registers this repository under the `extras` alias; use the same alias when referring to manifests from this bucket.

## ⚙️ Bucket Management

### Add a package

1. Create a new JSON manifest in `bucket/`.
2. Follow the [Scoop manifest specification](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests).
3. Test the manifest locally.
4. Verify the download URL and hash.
5. Submit the change through a pull request.

Example filename:

```text
bucket/example-tool.json
```

### Update a package

Update the manifest's version and download information, then refresh the hash and verify the installation path.

```powershell
scoop hash <downloaded-file>
scoop install ./bucket/<package>.json
```

### Common manifest fields

| Field | Purpose |
|---|---|
| `version` | Current upstream version. |
| `description` | Human-readable package description. |
| `homepage` | Official project homepage. |
| `license` | Upstream software license identifier. |
| `url` | Download URL or URL collection. |
| `hash` | Expected SHA-256 hash. |
| `bin` | Executables exposed through Scoop shims. |
| `depends` | Required package dependencies. |
| `extract_dir` | Directory to enter after extraction. |
| `checkver` | Rules for discovering newer versions. |
| `autoupdate` | Templates used to construct update URLs. |

### Repository helper scripts

The repository includes PowerShell helpers under `bin/` for common maintenance tasks such as hash checks, URL checks, version checks, formatting, and local testing.

## 🧠 Implementation Highlights

### Standard Scoop manifests

The repository uses JSON manifest files compatible with Scoop's package model. Each manifest describes where software should be downloaded from and how Scoop should install and expose it.

### Hash-based verification

When a manifest contains a hash, Scoop verifies the downloaded file against that expected digest before completing installation. This gives package definitions a reproducible integrity check without requiring this repository to host binary payloads.

### Version and auto-update metadata

`checkver` and `autoupdate` can reduce the amount of manual maintenance required for packages whose upstream releases follow predictable patterns.

### Repository-side maintenance tooling

The `bin/` directory contains small PowerShell utilities that support repeatable checks across the bucket. This keeps common validation tasks close to the manifests they maintain.

## 📁 Project Structure

```tree
extras-/
├── 📁 .github
│   └── 📁 workflows
│       └── ⚙️ ...
├── 📁 assets
│   ├── 🖼️ bar.svg
│   ├── 🖼️ dots.svg
│   └── 🖼️ logo-placeholder.svg
├── 📁 bin
│   ├── 📄 auto-pr.ps1
│   ├── 📄 checkhashes.ps1
│   ├── 📄 checkurls.ps1
│   ├── 📄 checkver.ps1
│   ├── 📄 formatjson.ps1
│   ├── 📄 missing-checkver.ps1
│   └── 📄 test.ps1
├── 📁 bucket
│   ├── 📄 app-name.json.template
│   ├── 📄 Context-Menu-Manager-Plus.json
│   ├── 📄 defender-control-disable.json
│   ├── 📄 defender-control-enable.json
│   ├── 📄 project-graph.json
│   ├── 📄 RealWorld-Cursor-Editor.json
│   ├── 📄 Windhawk-dev.json
│   └── ...
├── ⚖️ LICENSE
└── 📖 README.md
```

## 🔐 Security Notes

- **Repository contents:** This repository stores manifests and maintenance scripts rather than application binaries.
- **Download sources:** Review the upstream homepage and download URL for each package before installation, especially for software with elevated privileges.
- **Hashes:** Keep manifest hashes current. A changed or missing hash should be investigated rather than ignored.
- **Software trust:** A valid hash confirms that the downloaded file matches the manifest expectation; it does not prove that the upstream software itself is trustworthy.
- **Issue reports:** Do not publish private credentials, access tokens, or sensitive local system information when reporting a manifest problem.

## 🤝 Contributing &amp; Feedback

Issues and pull requests are welcome.

When adding or updating a manifest, include:

1. The official software name and homepage.
2. A working download URL.
3. The correct version and SHA-256 hash.
4. A successful local installation test.
5. `checkver` and `autoupdate` metadata when practical.

For package suggestions, explain why the software is useful and why a dedicated manifest in this bucket is appropriate.

## 📄 License

This project is licensed under the **MIT License**.

See [`LICENSE`](./LICENSE) for the complete license text.

## 💰 Support the Author

If this bucket saves you time searching for Windows software, consider supporting the project.

<div align="center">
  <a href="https://cyojkoy.github.io/Payment/">
    <img src="https://img.shields.io/badge/Support_the_Author-9E8F7E?style=for-the-badge&logo=buy-me-a-coffee&logoColor=BEB8AE" alt="Support the Author">
  </a>
</div>

<div align="center">
  <sub>Built to extend the Scoop ecosystem with practical Windows software and maintainable manifests.</sub>
</div>
