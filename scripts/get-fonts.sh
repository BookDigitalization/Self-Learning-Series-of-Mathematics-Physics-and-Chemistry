#!/usr/bin/env bash
# 下载本项目使用的开源中文字体到 fonts/（字体文件不入库）——Linux / macOS 版，与 get-fonts.ps1 等价
# 宋体：Noto Serif SC   黑体：Noto Sans SC   楷体：霞鹜文楷 LXGW WenKai   均为 SIL OFL 1.1
# 需要：curl、unzip。需要代理时先 export HTTPS_PROXY=… 再运行（curl 会自动使用）。
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fonts="$root/fonts"
tmp="$(mktemp -d "${TMPDIR:-/tmp}/series-fonts.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$fonts"

fetch() { # fetch URL OUTFILE
    echo "下载 $1"
    curl -fSL --retry 3 --progress-bar -o "$2" "$1"
}

noto='https://github.com/notofonts/noto-cjk/releases/download'
# zip 包名 | 要保留的字重
sets=(
    "$noto/Serif2.003/14_NotoSerifSC.zip|NotoSerifSC-Regular.otf NotoSerifSC-Bold.otf"
    "$noto/Sans2.004/18_NotoSansSC.zip|NotoSansSC-Regular.otf NotoSansSC-Medium.otf NotoSansSC-Bold.otf"
)
for s in "${sets[@]}"; do
    url="${s%%|*}"; keep="${s#*|}"
    zip="$tmp/$(basename "$url")"
    fetch "$url" "$zip"
    pats=()
    for f in $keep; do pats+=("*/$f" "$f"); done
    # -j 去掉目录层级；模式匹配不到的会给出提示但不算错
    unzip -o -j -q "$zip" "${pats[@]}" -d "$fonts" 2>/dev/null || true
    lic="$(unzip -Z1 "$zip" | grep -E '(^|/)LICENSE$' | head -n1 || true)"
    [ -n "$lic" ] && unzip -p "$zip" "$lic" > "$fonts/LICENSE-NotoCJK.txt"
    for f in $keep; do
        [ -f "$fonts/$f" ] || { echo "错误：$zip 中没有找到 $f" >&2; exit 1; }
    done
done

wk='https://github.com/lxgw/LxgwWenKai/releases/download/v1.530'
for w in Regular Medium; do
    fetch "$wk/LXGWWenKai-$w.ttf" "$fonts/LXGWWenKai-$w.ttf"
done
fetch 'https://raw.githubusercontent.com/lxgw/LxgwWenKai/main/OFL.txt' "$fonts/LICENSE-LXGWWenKai.txt"

echo
ls -lh "$fonts"
