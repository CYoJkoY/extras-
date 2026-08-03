<#
.SYNOPSIS
    Update the project tree section in README.md based on current repository structure.
.DESCRIPTION
    Scans all files and folders (except .git) and builds a tree, then replaces the
    code block between ```tree and ``` in README.md.
#>

$repoRoot = (Get-Location).Path
$readmePath = Join-Path $repoRoot "README.md"

if (-not (Test-Path $readmePath)) {
    Write-Error "README.md not found at $readmePath"
    exit 1
}

# Function to get icon based on item
function Get-Icon {
    param($item)
    if ($item -is [System.IO.DirectoryInfo]) { return "📁" }
    # File icons
    $name = $item.Name.ToLower()
    if ($name -eq "license" -or $name -match "^license(\..*)?$") { return "⚖️" }
    if ($name -eq "readme.md" -or $name -eq "readme") { return "📖" }
    if ($name -match "\.(png|jpg|jpeg|gif|svg|ico)$") { return "🖼️" }
    if ($name -match "\.(ps1|py|sh|cmd|bat)$") { return "📄" }
    if ($name -match "\.(json|yml|yaml|xml|toml)$") { return "📄" }
    if ($name -match "\.(txt|md|rst|adoc)$") { return "📄" }
    if ($name -match "\.(exe|msi|dll|zip|7z|tar|gz)$") { return "📦" }
    return "📄"
}

function Build-Tree {
    param(
        [string]$path,
        [string]$prefix = "",
        [string]$rootName = (Split-Path (Get-Location) -Leaf)
    )

    # Get all items under $path, excluding .git and hidden folders
    $items = Get-ChildItem -Path $path -Force | Where-Object { $_.Name -ne ".git" -and $_.Name -ne ".github" } | Sort-Object -Property @{Expression={$_.PSIsContainer}; Descending=$true}, Name

    $lines = @()
    $count = $items.Count
    for ($i = 0; $i -lt $count; $i++) {
        $item = $items[$i]
        $isLast = ($i -eq $count -1)
        $connector = if ($isLast) { "└── " } else { "├── " }
        $icon = Get-Icon $item
        $line = "$prefix$connector$icon $($item.Name)"
        $lines += $line

        if ($item.PSIsContainer) {
            $subPrefix = if ($isLast) { "$prefix    " } else { "$prefix│   " }
            $subLines = Build-Tree -path $item.FullName -prefix $subPrefix
            $lines += $subLines
        }
    }
    return $lines
}

# Generate tree starting from repo root
$treeLines = Build-Tree -path $repoRoot

# Read README
$content = Get-Content -Path $readmePath -Raw

# Define pattern for tree block (```tree ... ```)
$pattern = '(?s)(```tree\n)(.*?)(\n```)'
$replacement = "```tree`n$($treeLines -join "`n")`n```"

if ($content -match $pattern) {
    $newContent = $content -replace $pattern, $replacement
    Set-Content -Path $readmePath -Value $newContent -NoNewline
    Write-Host "README updated."
} else {
    Write-Warning "No ```tree block found in README. Nothing updated."
}
