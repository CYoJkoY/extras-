<#
.SYNOPSIS
    Update the ```tree block in README.md with current repository structure.
#>

$repoRoot = Get-Location
$readmePath = Join-Path $repoRoot "README.md"
if (-not (Test-Path $readmePath)) { Write-Error "README.md missing"; exit 1 }

function Get-Icon($item) {
    if ($item.PSIsContainer) { return "📁" }
    $name = $item.Name.ToLower()
    if ($name -match "^license") { return "⚖️" }
    if ($name -match "\.(svg|png|jpg|gif|ico)$") { return "🖼️" }
    if ($name -match "\.(ps1|py|sh|cmd|bat)$") { return "📄" }
    if ($name -match "\.(json|yml|yaml|xml|toml)$") { return "📄" }
    if ($name -match "\.(txt|md|rst|adoc)$") { return "📄" }
    if ($name -match "\.(exe|msi|dll|zip|7z|tar|gz)$") { return "📦" }
    if ($name -eq "readme.md") { return "📖" }
    return "📄"
}

function Build-Tree($path, $prefix = "") {
    $items = Get-ChildItem $path -Force | Where-Object { $_.Name -notin @(".git", ".github") } | Sort-Object @{Expression={$_.PSIsContainer}; Descending=$true}, Name
    $lines = @()
    $count = $items.Count
    for ($i = 0; $i -lt $count; $i++) {
        $item = $items[$i]
        $isLast = ($i -eq $count - 1)
        $connector = if ($isLast) { "└── " } else { "├── " }
        $icon = Get-Icon $item
        $lines += "$prefix$connector$icon $($item.Name)"
        if ($item.PSIsContainer) {
            $subPrefix = if ($isLast) { "$prefix    " } else { "$prefix│   " }
            $lines += Build-Tree $item.FullName $subPrefix
        }
    }
    return $lines
}

$tree = Build-Tree $repoRoot
$rootName = (Split-Path $repoRoot -Leaf)
$treeLines = @($rootName) + $tree

$content = Get-Content $readmePath -Raw
$pattern = '(?s)(```tree\n)(.*?)(\n```)'
$newBlock = "```tree`n$($treeLines -join "`n")`n```"

if ($content -match $pattern) {
    $newContent = $content -replace $pattern, $newBlock
    # Write without BOM, CRLF line endings (default on Windows)
    [System.IO.File]::WriteAllText($readmePath, $newContent, [System.Text.UTF8Encoding]::new($false))
    Write-Host "README updated."
} else {
    Write-Warning "No ```tree block found in README. Nothing updated."
}
