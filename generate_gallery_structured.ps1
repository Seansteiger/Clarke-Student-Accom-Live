$imagesRootDir = "Clarke Student Accommodation.Static/wwwroot/images/accommodation/Gallery"
$webRoot = "/images/accommodation/Gallery"
$outputFile = "Clarke Student Accommodation.Static/wwwroot/images/gallery_structured.json"

$categories = @()

# Custom order map (optional, matching the C# code)
$orderMap = @{
    "Bedroom"                = 1
    "Living Room"            = 2
    "Kitchen Area"           = 3
    "Bathroom"               = 4
    "Washing Area"           = 5
    "Recreational & outside" = 6
    "Shuttle"                = 7
}

if (Test-Path $imagesRootDir) {
    $dirs = Get-ChildItem -Path $imagesRootDir -Directory
    
    foreach ($dir in $dirs) {
        $catName = $dir.Name
        $files = Get-ChildItem -Path $dir.FullName -Include *.jpg, *.jpeg, *.png, *.gif, *.webp, *.jfif -Recurse
        
        $imagePaths = @()
        foreach ($file in $files) {
            # Convert backslashes to slashes and encode spaces
            $relPath = "$webRoot/$catName/" + $file.Name
            $imagePaths += $relPath
        }

        if ($imagePaths.Count -gt 0) {
            $categories += [PSCustomObject]@{
                Name   = $catName
                Images = $imagePaths
                Order  = if ($orderMap.ContainsKey($catName)) { $orderMap[$catName] } else { 99 }
            }
        }
    }
}

# Sort by order then name
$categories = $categories | Sort-Object Order, Name

# Clean up the output object (remove Order property if strict matching needed, but extra props usually ignored)
$finalOutput = $categories | Select-Object Name, Images

$json = $finalOutput | ConvertTo-Json -Depth 3
$json | Set-Content -Path $outputFile -Encoding UTF8

Write-Host "Generated $($finalOutput.Count) categories to $outputFile"
