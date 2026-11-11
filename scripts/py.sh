#!/usr/bin/env bash
# Linux / macOS 上运行脚本用的 Python：等同 `uv run python "$@"`，justfile 的 python 变量指向这里。
# NixOS 没有 /usr/lib 下的 libstdc++，PyPI 上的 PyMuPDF 轮子 import 时报
# "libstdc++.so.6: cannot open shared object file"；这里从本机 gcc 找到库目录补进 LD_LIBRARY_PATH。
set -euo pipefail
if [ -e /etc/NIXOS ] && command -v gcc >/dev/null 2>&1; then
  lib=$(gcc -print-file-name=libstdc++.so.6)
  if [ "$lib" != "libstdc++.so.6" ]; then
    export LD_LIBRARY_PATH="$(dirname "$lib")${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  fi
fi
exec uv run --project "$(cd "$(dirname "$0")/.." && pwd)" python "$@"
