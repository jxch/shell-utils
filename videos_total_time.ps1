[CmdletBinding()]
Param(
    [string] $dirPath
)

Write-Host ">>> ${dirPath}"

# 获取目下所有可能的视频文件
$videos = Get-ChildItem -Path $dirPath -Recurse -Include *.mp4,*.avi,*.mkv,*.mov,*.wmv,*.flv,*.webm,*.mpg,*.mpeg,*.m4v,*.3gp,*.ts,*.vob,*.ogv,*.m2ts,*.mts,*.divx,*.xvid,*.rmvb,*.asf,*.qt,*.fv,*.mxf,*.mpv,*.mp2,*.mpe,*.mpa,*.m2v,*.m1v,*.mod,*.tod,*.dvr-ms,*.wtv,*.ogm,*.rm,*.ram,*.mk3d,*.mks,*.nsv,*.dts,*.ac3,*.eac3,*.aac,*.wma,*.wav,*.flac,*.ape,*.alac,*.opus,*.mka

# 初始化总时长为 0
$totalDuration = 0
$totalVideos = $videos.Count

# 记录当前位置
$cursorLeft = [Console]::CursorLeft
$cursorTop = [Console]::CursorTop

$i = 1
# 遍历所有视频文件
foreach ($video in $videos) {
	# 不断刷新着显示正在扫描的视频
	Write-Host "[${i}/${totalVideos}] -> " $video.FullName  -NoNewline
	Write-Host -NoNewline (" " * [Console]::CursorLeft)
	[Console]::SetCursorPosition($cursorLeft, $cursorTop)
	$i = $i + 1

    # 使用 ffprobe 获取视频时长
    $duration = & ffprobe.exe -i $video.FullName -show_entries format=duration -v quiet -of csv="p=0"

    # 将时长转换为秒
    $durationSeconds = [math]::Round($duration)

    # 累加总长
	$totalDuration += $durationSeconds
}

# 换行
Write-Host ""

# 将总时长转换为时分秒格式
$ts = [TimeSpan]::FromSeconds($totalDuration)

# 输出结果
Write-Host "Total duration of all videos in ${dirPath}: $($ts.Days) days, $($ts.Hours) hours, $($ts.Minutes) minutes, $($ts.Seconds) seconds"
