// 数理化自学丛书 · 平面解析几何
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 2383–2887 页，
// 用 scripts/split-volume.py analytic-geometry 切出 original/analytic-geometry.pdf（页序 0 起计：原书 p.n = 页序 n+3；原书页码 = 合集页码 − 2386）。
// 卷首（封面、书名、版权、重印说明、目录）不收录；目录由 Typst 按章节自动生成。
// 第 4 章内的分组标题（Ⅰ．圆　Ⅱ．椭圆 …）排成无编号小标题。
#import "/common/series.typ": *

#show: series-book.with(title: "平面解析几何", volume: "")

// 原书行内分式是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
#show math.equation.where(block: false): it => math.display(it) + sym.wj
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")

#show: front-matter

#tableofcontents

#show: main-matter

// 章文件按顺序 include（录入一章，加一行）：
#include "chapters/ch01.typ"
#include "chapters/ch01b.typ"
#include "chapters/ch01c.typ"
#include "chapters/ch01d.typ"
#include "chapters/ch02.typ"
#include "chapters/ch02b.typ"
#include "chapters/ch02c.typ"

#show: back-matter

// #include "appendix/appendix-empirical.typ"  // 附录 经验公式 p.457
// #include "appendix/review.typ"              // 总复习题 p.468
// #include "appendix/answers.typ"             // 习题答案 p.478
