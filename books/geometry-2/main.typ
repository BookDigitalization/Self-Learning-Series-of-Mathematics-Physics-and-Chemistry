// 数理化自学丛书 · 平面几何 第二册
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 2061–2381 页，
// 用 scripts/split-volume.py geometry-2 切出 original/geometry-2.pdf（页序 0 起计：原书 p.n = 页序 n+4；原书页码 = 合集页码 − 2065）。
// 卷首（封面、书名、版权、内容提要、重印说明、目录）不收录；目录由 Typst 按章节自动生成。
// 章内分组标题（如“成比例的线段”）排成无编号小标题。
#import "/common/series.typ": *

#show: series-book.with(title: "平面几何", volume: "第二册")

// 原书行内分式、比例式是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
#show math.equation.where(block: false): it => math.display(it)
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
#include "chapters/ch03.typ"
#include "chapters/ch03b.typ"
#include "chapters/ch03c.typ"
#include "chapters/ch03d.typ"
#include "chapters/ch04.typ"
#include "chapters/ch04b.typ"
#include "chapters/ch04c.typ"
#include "chapters/ch05.typ"
#include "chapters/ch05b.typ"
#include "chapters/ch05c.typ"

#show: back-matter

#include "appendix/review.typ"
#include "appendix/answers.typ"
