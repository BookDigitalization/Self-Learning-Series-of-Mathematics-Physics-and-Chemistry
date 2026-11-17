// 数理化自学丛书 · 物理 第三册（电磁学）
// 原书：上海科学技术出版社。扫描来自《物理分册合集》，切出的单册见 original/physics-3.pdf（just 或 scripts/split-volume.py physics-3）。
// 原书页码 = 切出 PDF 页序（0 起计）− 5；PDF 第 0–5 页为卷首（扉页、版权、内容提要、目录）。
#import "/common/series.typ": *

#show: series-book.with(title: "物理", volume: "第三册")
// 行内公式后紧跟的“，。；”不与公式断开（否则会落到下一行行首）
#show math.equation.where(block: false): it => it + sym.wj

#show: front-matter

#tableofcontents

#show: main-matter

#include "chapters/ch01.typ"
#include "chapters/ch01b.typ"
#include "chapters/ch02.typ"
#include "chapters/ch02b.typ"
#include "chapters/ch02c.typ"
#include "chapters/ch03.typ"
#include "chapters/ch03b.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch05b.typ"
#include "chapters/ch06.typ"
#include "chapters/ch06b.typ"

#show: back-matter

#include "appendix/review.typ"
#include "appendix/answers.typ"
