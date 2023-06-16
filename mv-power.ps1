[CmdletBinding()]
Param(
    [string] $pickPath
)

if ($pickPath -ne $null){
	Write-Host ">>> ${pickPath}"
	
	# 获取目录下所有子目录的路径
	$subdirs = Get-ChildItem -Directory ${pickPath}

	# 对于每个子目录，将其内部的所有文件和文件夹移动到当前目录下
	foreach ($subdir in $subdirs) {
		Write-Host "--- ${subdir}"
		Get-ChildItem -Path $subdir.FullName | Move-Item -Destination $pickPath
	}
}
