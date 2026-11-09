// 数理化自学丛书 · 代数 第一册
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 1–311 页，
// 用 scripts/split-volume.py algebra-1 切出 original/algebra-1.pdf（页序 0 起计：原书 p.n = 页序 n+6）。
// 卷首（封面、版权、内容提要、重印说明、目录）不收录；目录由 Typst 按章节自动生成。
#import "/common/series.typ": *

#show: series-book.with(title: "代数", volume: "第一册")

// 原书行内分式、带分数是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
#show math.equation.where(block: false): it => math.display(it)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")

#show: front-matter

#tableofcontents

#show: main-matter

#include "chapters/ch01.typ"
#include "chapters/ch01b.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"
#include "chapters/ch03b.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"

// 以下尚未录入：总复习题（p.279）、习题答案（p.285）、附英语字母表及常用希腊字母表（p.303）
