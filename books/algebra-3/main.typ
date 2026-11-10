// 数理化自学丛书 · 代数 第三册
// 原书：上海科学技术出版社。扫描本为 original/数理化自学丛书-数学分册合集.pdf 的第 757–1147 页，
// 用 scripts/split-volume.py algebra-3 切出 original/algebra-3.pdf（页序 0 起计：原书 p.n = 页序 n+6；原书页码 = 合集页码 − 763）。
// 卷首（封面、内容提要、扉页、重印说明、目录）不收录；目录由 Typst 按章节自动生成。
// 目录里带 * 的节（§1·7、§1·8、§1·10 等）是星号节，录入时照扫描标注。
#import "/common/series.typ": *

#show: series-book.with(title: "代数", volume: "第三册")

// 原书行内分式、带分数是整号大小：行内公式一律按 display 样式排，并按真实边界撑行高（避免压行）
#show math.equation.where(block: false): it => math.display(it)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")

#show: front-matter

#tableofcontents

#show: main-matter

// 章文件录入完成后逐个加在这里：
// #include "chapters/ch01.typ"

// #show: back-matter
// #include "appendix/review.typ"
// #include "appendix/answers.typ"
