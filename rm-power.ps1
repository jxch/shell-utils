[CmdletBinding()]
Param(
    [string] $clearPath
)

if ($clearPath -ne $null){
	Write-Host ">>> ${clearPath}"

	# 获取目录下所有空文件夹的路径
	$emptyDirs = Get-ChildItem -Directory $clearPath | Where-Object { $_.GetFileSystemInfos().Count -eq 0 }

	# 对于每个空文件夹，将其删除
	foreach ($emptyDir in $emptyDirs) {
		Write-Host "--- ${emptyDir}"
		Remove-Item -Path $emptyDir.FullName
	}
}
