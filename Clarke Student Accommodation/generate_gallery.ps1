$imagesPath = "wwwroot/images/accommodation"
$jsonPath = "wwwroot/images/gallery.json"
$baseUrl = "/images/accommodation/"

# Get all image files
$files = Get-ChildItem -Path $imagesPath -Include *.jpg,*.jpeg,*.png,*.gif,*.webp -Recurse

# Create JSON array
$json = @()
foreach ($file in $files) {
    if ($file.Name -ne "gallery.json") {
        $json += $baseUrl + $file.Name
    }
}

# Convert to JSON and save
$json | ConvertTo-Json -Depth 1 | Set-Content -Path $jsonPath -Encoding UTF8

Write-Host "Generated gallery.json with $($json.Count) images."
