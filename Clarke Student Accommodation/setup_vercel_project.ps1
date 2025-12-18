$sourceDir = "."
$destDir = "..\Clarke Student Accommodation.Static"

# 1. Copy wwwroot (overwrite)
Copy-Item -Path "$sourceDir\wwwroot\*" -Destination "$destDir\wwwroot" -Recurse -Force

# 2. Copy Components
if (Test-Path "$destDir\Components") { Remove-Item "$destDir\Components" -Recurse -Force }
Copy-Item -Path "$sourceDir\Components" -Destination "$destDir" -Recurse

# 3. Clean up default WASM pages if they exist (Pages/Shared usually found in template)
if (Test-Path "$destDir\Pages") { Remove-Item "$destDir\Pages" -Recurse -Force }
if (Test-Path "$destDir\Shared") { Remove-Item "$destDir\Shared" -Recurse -Force }

# 4. Remove Account folder from Components (Auth depends on Server)
if (Test-Path "$destDir\Components\Account") { Remove-Item "$destDir\Components\Account" -Recurse -Force }

# 5. Generate index.html from App.razor logic
$indexHtml = @"
<!DOCTYPE html>
<html lang=""en"">

<head>
    <meta charset=""utf-8"" />
    <meta name=""viewport"" content=""width=device-width, initial-scale=1.0"" />
    <title>Clarke Student Accommodation</title>
    <base href=""/"" />
    <link rel=""stylesheet"" href=""lib/bootstrap/dist/css/bootstrap.min.css"" />
    <link rel=""stylesheet"" href=""app.css"" />
    <link rel=""stylesheet"" href=""Clarke_Student_Accommodation.styles.css"" />
    <link rel=""stylesheet"" href=""Clarke Student Accommodation.Static.styles.css"" />
    <link rel=""icon"" type=""image/png"" href=""favicon.png"" />
</head>

<body>
    <div id=""app"">
        <svg class=""loading-progress"">
            <circle r=""40%"" cx=""50%"" cy=""50%"" />
            <circle r=""40%"" cx=""50%"" cy=""50%"" />
        </svg>
        <div class=""loading-progress-text""></div>
    </div>

    <div id=""blazor-error-ui"">
        An unhandled error has occurred.
        <a href="""" class=""reload"">Reload</a>
        <a class=""dismiss"">X</a>
    </div>
    <script src=""_framework/blazor.webassembly.js""></script>
    <script>
        // Helper for mobile menu (copied from MainLayout)
        function toggleMobileMenu() {
            const mobileNav = document.getElementById('mobileNav');
            if(mobileNav) mobileNav.classList.toggle('active');
        }
    </script>
</body>

</html>
"@
Set-Content -Path "$destDir\wwwroot\index.html" -Value $indexHtml -Encoding UTF8

Write-Host "Vercel Project Setup Complete."
