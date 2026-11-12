// 数理化自学丛书 · 三角
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 1398–1739 页，
// 用 scripts/split-volume.py trigonometry 切出 original/trigonometry.pdf（页序 0 起计：原书 p.n = 页序 n+7；原书页码 = 合集页码 − 1405）。
// 卷首（封面、书名、版权、内容提要、重印说明、目录）不收录；目录由 Typst 按章节自动生成。
// 三角函数记号按 common/TERMINOLOGY.md 4.9 写成现代记号（tan、cot、csc、arcsin、arccos、arctan、arccot）。
#import "/common/series.typ": *

#show: series-book.with(title: "三角", volume: "")

// 原书行内分式是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
#show math.equation.where(block: false): it => math.display(it) + sym.wj
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")

#show: front-matter

#tableofcontents

#show: main-matter

// 章文件按顺序 include：
#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch02b.typ"
#include "chapters/ch03.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"
#include "chapters/ch07.typ"
#include "chapters/ch08.typ"

#show: back-matter

#include "appendix/review.typ"
#include "appendix/answers.typ"
