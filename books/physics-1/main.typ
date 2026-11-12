// 数理化自学丛书 · 物理 第一册
// 原书：上海科学技术出版社，第二版。扫描本见 original/数理化自学丛书物理第一册.pdf
// PDF 第 n 页（0 起计）= 原书第 n−4 页；PDF 第 0–4 页为目录 i–v。
#import "/common/series.typ": *

#show: series-book.with(title: "物理", volume: "第一册")
// 行内公式后紧跟的“，。；”不与公式断开（否则会落到下一行行首）
#show math.equation.where(block: false): it => it + sym.wj

#show: front-matter

#tableofcontents

#show: main-matter

#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"
#include "chapters/ch04.typ"
#include "chapters/ch05.typ"
#include "chapters/ch06.typ"
#include "chapters/ch07.typ"
#include "chapters/ch08.typ"
#include "chapters/ch09.typ"
#include "chapters/ch10.typ"
#include "chapters/ch11.typ"
#include "chapters/ch12.typ"
#include "chapters/ch13.typ"
#include "chapters/ch14.typ"
#include "chapters/ch15.typ"

#show: back-matter

#include "appendix/review.typ"
#include "appendix/answers.typ"
#include "appendix/appendix1.typ"
#include "appendix/appendix2.typ"
