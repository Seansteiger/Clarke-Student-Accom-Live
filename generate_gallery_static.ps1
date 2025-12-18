$galleryRoot = "Clarke Student Accommodation\wwwroot\images\accommodation\Gallery"
$outputFile = "Clarke Student Accommodation.Static\wwwroot\images\gallery.json"

$images = Get-ChildItem -Path $galleryRoot -Recurse -Include *.jpg, *.jpeg, *.png, *.gif, *.webp, *.jfif

$imagePaths = @()
foreach ($img in $images) {
    # Get relative path segments: Gallery / Folder / File
    # We want web path: /images/accommodation/Gallery/Folder/File
    $folderName = $img.Directory.Name
    $fileName = $img.Name
    $webPath = "images/accommodation/Gallery/$folderName/$fileName"
    $imagePaths += $webPath
}

$json = $imagePaths | ConvertTo-Json -Depth 5
$json | Set-Content $outputFile -Encoding UTF8

Write-Host "Generated gallery.json with $($imagePaths.Count) images."
