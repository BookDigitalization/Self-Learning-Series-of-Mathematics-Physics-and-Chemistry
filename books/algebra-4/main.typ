// 数理化自学丛书 · 代数 第四册
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 1149–1396 页，
// 用 scripts/split-volume.py algebra-4 切出 original/algebra-4.pdf（页序 0 起计：原书 p.n = 页序 n+6；原书页码 = 合集页码 − 1155）。
// 卷首（封面、书名、版权、内容提要、重印说明、目录）不收录；目录由 Typst 按章节自动生成。
// 目录里只有 §1·11 带 * 号（选学节），录入时照扫描标注。
#import "/common/series.typ": *

#show: series-book.with(title: "代数", volume: "第四册")

// 原书行内分式、带分数是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
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
#include "chapters/ch02.typ"
#include "chapters/ch02b.typ"
#include "chapters/ch03.typ"
#include "chapters/ch03b.typ"
#include "chapters/ch03c.typ"
#include "chapters/ch04.typ"
#include "chapters/ch04b.typ"
#include "chapters/ch04c.typ"
#include "chapters/ch04d.typ"
#include "chapters/ch04e.typ"
#include "chapters/ch05.typ"
#include "chapters/ch05b.typ"
#include "chapters/ch05c.typ"
#include "chapters/ch05d.typ"
#include "chapters/ch05e.typ"
#include "chapters/ch05f.typ"
#include "chapters/ch05g.typ"
#include "chapters/ch05h.typ"
#include "chapters/ch05i.typ"
#include "chapters/ch06.typ"
#include "chapters/ch06b.typ"
#include "chapters/ch06c.typ"
#include "chapters/ch06d.typ"

#show: back-matter

#include "appendix/review.typ"
#include "appendix/answers.typ"

