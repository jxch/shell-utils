Add-Type -Path "C:\Program Files\PackageManagement\NuGet\Packages\iTextSharp.5.5.13.3\lib\itextsharp.dll"
Add-Type -Path "C:\Program Files\PackageManagement\NuGet\Packages\BouncyCastle.1.8.9\lib\BouncyCastle.Crypto.dll"

$directory = "U:\tmp\pdfs"
$totalPages = 0

Get-ChildItem -Path $directory -Filter *.pdf | ForEach-Object {
    $reader = New-Object iTextSharp.text.pdf.PdfReader -ArgumentList $_.FullName
    $totalPages += $reader.NumberOfPages
    $reader.Close()
}

Write-Host $totalPages