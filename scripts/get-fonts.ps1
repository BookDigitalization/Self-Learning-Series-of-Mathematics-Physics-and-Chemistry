# 下载本项目使用的开源中文字体到 fonts/（字体文件不入库）
# 宋体：Noto Serif SC   黑体：Noto Sans SC   楷体：霞鹜文楷 LXGW WenKai   均为 SIL OFL 1.1
# 需要代理时先设置 $env:HTTPS_PROXY 再运行。
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$root  = Split-Path $PSScriptRoot -Parent
$fonts = Join-Path $root 'fonts'
$tmp   = Join-Path ([IO.Path]::GetTempPath()) "sxzx-fonts-$PID"
New-Item -ItemType Directory -Force $fonts, $tmp | Out-Null

$proxy = @{}
if ($env:HTTPS_PROXY) { $proxy.Proxy = $env:HTTPS_PROXY }

$noto = 'https://github.com/notofonts/noto-cjk/releases/download'
$sets = @(
    @{ Url = "$noto/Serif2.003/14_NotoSerifSC.zip"; Keep = 'NotoSerifSC-(Regular|Bold)\.otf$' },
    @{ Url = "$noto/Sans2.004/18_NotoSansSC.zip";   Keep = 'NotoSansSC-(Regular|Medium|Bold)\.otf$' }
)
foreach ($s in $sets) {
    $zip = Join-Path $tmp (Split-Path $s.Url -Leaf)
    Write-Host "下载 $($s.Url)"
    Invoke-WebRequest @proxy $s.Url -OutFile $zip
    $dir = "$zip.d"
    Expand-Archive $zip $dir -Force
    Get-ChildItem $dir -Recurse -File | Where-Object Name -match $s.Keep | Copy-Item -Destination $fonts
    Get-ChildItem $dir -Recurse -Filter LICENSE | Select-Object -First 1 |
        Copy-Item -Destination (Join-Path $fonts 'LICENSE-NotoCJK.txt')
}

$wk = 'https://github.com/lxgw/LxgwWenKai/releases/download/v1.530'
foreach ($w in 'Regular', 'Medium') {
    Write-Host "下载 LXGWWenKai-$w.ttf"
    Invoke-WebRequest @proxy "$wk/LXGWWenKai-$w.ttf" -OutFile (Join-Path $fonts "LXGWWenKai-$w.ttf")
}
Invoke-WebRequest @proxy 'https://raw.githubusercontent.com/lxgw/LxgwWenKai/main/OFL.txt' `
    -OutFile (Join-Path $fonts 'LICENSE-LXGWWenKai.txt')

Remove-Item $tmp -Recurse -Force
Get-ChildItem $fonts | Select-Object Name, @{ n = 'MB'; e = { [math]::Round($_.Length / 1MB, 1) } }
