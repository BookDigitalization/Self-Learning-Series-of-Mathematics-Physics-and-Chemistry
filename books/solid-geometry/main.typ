// 数理化自学丛书 · 立体几何
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 2888–3201 页，
// 用 scripts/split-volume.py solid-geometry 切出 original/solid-geometry.pdf（页序 0 起计：原书 p.n = 页序 n+2；原书页码 = 合集页码 − 2890）。
// 卷首（版权、目录）不收录；目录由 Typst 按章节自动生成。
// 章内分组标题（如“平面”“直线和直线的位置关系”）排成无编号小标题。
#import "/common/series.typ": *

#show: series-book.with(title: "立体几何", volume: "")

// 原书行内分式、比例式是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
#show math.equation.where(block: false): it => math.display(it) + sym.wj
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")

#show: front-matter

#tableofcontents

#show: main-matter

// 章文件按顺序 include：
#include "chapters/ch01.typ"
#include "chapters/ch01b.typ"
#include "chapters/ch01c.typ"
#include "chapters/ch01d.typ"
#include "chapters/ch01e.typ"
#include "chapters/ch01f.typ"
#include "chapters/ch02.typ"
#include "chapters/ch02b.typ"
#include "chapters/ch02c.typ"
#include "chapters/ch02d.typ"
#include "chapters/ch02e.typ"
#include "chapters/ch03.typ"
#include "chapters/ch03b.typ"
#include "chapters/ch03c.typ"
#include "chapters/ch03d.typ"
#include "chapters/ch03e.typ"

#show: back-matter

// 习题答案（含各章复习题答案）
#include "appendix/answers.typ"    // 习题答案 p.302–306
#include "appendix/answers-b.typ"  // 习题答案（续）p.307–311
