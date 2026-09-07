<div align="center">
  <img src="./assets/hero.svg" alt="extra- — supplementary Scoop bucket for Windows software" width="1200" style="max-width: 100%; height: auto;">

  <h1>extra-</h1>
  <p><strong>A focused Scoop bucket for practical Windows software outside the official collections.</strong></p>
  <p>Manifest-driven · Scoop-native · SHA-256 aware · PowerShell maintained</p>

  <p>
    <a href="https://scoop.sh"><img src="https://img.shields.io/badge/Scoop-Bucket-8A9E8B?style=flat-square&logo=scoop" alt="Scoop bucket"></a>
    <a href="https://github.com/CYoJkoY/extras-"><img src="https://img.shields.io/github/repo-size/CYoJkoY/extras-?style=flat-square" alt="Repository size"></a>
    <img src="https://img.shields.io/badge/platform-Windows-9E8F7E?style=flat-square" alt="Windows">
    <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-7A8E8E?style=flat-square" alt="MIT License"></a>
  </p>

  <p><a href="#quick-start">Quick start</a> · <a href="#manifest-model">Manifest model</a> · <a href="#maintaining-packages">Maintain</a> · <a href="#security-model">Security</a></p>
</div>

> **Boundary:** this repository stores Scoop manifests and maintenance tooling. It does not redistribute application binaries or claim to be an official Scoop bucket.

## What it is

**extra-** is a supplementary [Scoop](https://scoop.sh) bucket maintained by [@CYojkoY](https://github.com/CYoJkoY). It provides installable manifests for additional Windows utilities and specialized applications that fit this repository's use case.

A manifest defines the upstream source, version, installation behavior, and—when supported—the expected SHA-256 digest.

Package availability ultimately depends on the upstream publisher and the Scoop ecosystem.

## Quick start

Requirements: Windows and [Scoop](https://scoop.sh).

```powershell
scoop bucket add extras https://github.com/CYoJkoY/extras-
scoop search <package>
scoop install extras/<package>
```

Common commands:

| Task | Command |
| :--- | :--- |
| Refresh bucket metadata | `scoop update` |
| Update one package | `scoop update <package>` |
| Inspect a manifest | `scoop info extras/<package>` |
| List installed software | `scoop list` |
| Remove software | `scoop uninstall <package>` |

`extras` is the local Scoop bucket alias chosen during `bucket add`; it does not denote ownership by Scoop itself.

## Manifest model

The repository follows Scoop's normal package model rather than checking application payloads into Git.

```text
bucket/<package>.json
        │
        ├── version + download URL
        ├── expected SHA-256
        ├── extraction / shim rules
        └── version discovery metadata
                │
                ▼
              Scoop
                │
                ▼
        upstream software
```

This keeps the repository small while retaining the information required to reproduce and review an installation definition.

## Current packages

Manifest files live under `bucket/`. The catalog can change independently of this README, so use Scoop for the authoritative package list.

Representative manifests currently include:

- `Context-Menu-Manager-Plus.json`
- `defender-control-disable.json`
- `defender-control-enable.json`
- `project-graph.json`
- `RealWorld-Cursor-Editor.json`
- `Windhawk-dev.json`

Search the live bucket rather than relying on this list for availability.

## Maintaining packages

### Add a package

Start from the official software homepage and download source. Then create `bucket/<package>.json`, verify the version and source, calculate the hash when applicable, and test the manifest locally.

```powershell
scoop install ./bucket/example-tool.json
```

### Update a package

Refresh the version and upstream URL, recalculate the digest, then test the manifest again.

```powershell
scoop hash <downloaded-file>
scoop install ./bucket/<package>.json
```

### Important fields

| Field | Purpose |
| :--- | :--- |
| `version` | Current upstream version |
| `description` | Package description |
| `homepage` | Official software homepage |
| `license` | Upstream license identifier |
| `url` | Download URL or URL set |
| `hash` | Expected SHA-256 digest |
| `bin` | Executables exposed as Scoop shims |
| `depends` | Scoop dependencies |
| `extract_dir` | Post-extraction directory |
| `checkver` | Version-discovery rule |
| `autoupdate` | Future URL/version templates |

## Maintenance tooling

PowerShell helpers in `bin/` make recurring checks repeatable:

```text
bin/
├── auto-pr.ps1
├── checkhashes.ps1
├── checkurls.ps1
├── checkver.ps1
├── formatjson.ps1
├── missing-checkver.ps1
└── test.ps1
```

They cover URL validation, hash checks, version checks, JSON formatting, missing metadata detection, and local manifest testing.

## Security model

The repository contains manifests and scripts rather than application binaries.

A matching SHA-256 digest proves that a downloaded file matches the manifest's expected bytes. It does **not** establish that the upstream software itself is trustworthy or free of vulnerabilities.

Review the upstream publisher and requested privileges before installing software. Treat manifests and PowerShell maintenance scripts as code: inspect changes before executing them.

Do not publish credentials, private URLs, or sensitive machine information in issues or pull requests.

## Repository structure

```text
extras-/
├── .github/workflows/
├── assets/
│   ├── bar.svg
│   ├── dots.svg
│   ├── hero.svg
│   └── logo-placeholder.svg
├── bin/
│   ├── auto-pr.ps1
│   ├── checkhashes.ps1
│   ├── checkurls.ps1
│   ├── checkver.ps1
│   ├── formatjson.ps1
│   ├── missing-checkver.ps1
│   └── test.ps1
├── bucket/
│   ├── app-name.json.template
│   └── *.json
├── LICENSE
└── README.md
```

## Contributing

A useful contribution should add a package that belongs in this bucket, correct an existing manifest, improve reproducible maintenance, or fix tooling.

Package changes should include the official homepage, a working download source, the correct version, a verified SHA-256 hash where supported, and local installation evidence. Add `checkver` and `autoupdate` metadata when practical.

Avoid duplicating an official Scoop bucket without a concrete reason.

## Support

Development support is available through the deployed payment page:

**https://cyojkoy.github.io/Payment/**

## License

This project is licensed under the **MIT License**.

See [`LICENSE`](./LICENSE) for the complete license text.

<div align="center">
  <sub>extra- · practical Windows software through Scoop manifests.</sub>
</div>
