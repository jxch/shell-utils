[CmdletBinding()]
Param(
    [bool] $init
)

$link_target = 'C:\Users\xiche\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets'
$link_dir = 'D:\xiche\Pictures\wallper'
$link_files = 'D:\xiche\Pictures\wallper\*'
$export_dir = 'D:\xiche\Pictures\wallper_export'
$export_files = 'D:\xiche\Pictures\wallper_export\*'

if ($init) {
    if (Test-Path $link_dir) {
        Remove-Item $link_dir -Recurse
    }

    New-Item -ItemType Junction -Target $link_target -Path $link_dir
    
    if (Test-Path $export_dir) {
        Remove-Item $export_dir -Recurse
    }

    New-Item $export_dir -Type Directory
}


Copy-Item $link_files -Destination $export_dir
Get-ChildItem $export_files | Rename-Item -NewName { $_.name + '.jpg'}

