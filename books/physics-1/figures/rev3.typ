// 第 3 章 单元检查题（复习题三）附图
// 五幅图都是线条图，沿用原扫描裁剪（rev3-N.png），图中的字母、“1 公斤”、h 已涂去，用 CeTZ 文字补回；
// rev3-2.png 里原先带着的“（第 2 题）”图注也已涂去（图注由章文件的 plainfig 给出）。
// 坐标是各 PNG 的像素坐标（y 向下）。
#import "/common/series.typ": *

#let rev-lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))

// 第 1 题：小车和绳（1141×619）
#let fig-rev-3-1(width: 6cm) = px-canvas(1141, 619, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev3-1.png", width: 1141 * u))
  content(p(751, 62), anchor: "center", text(size: 8pt)[1 公斤])
  rev-lab(p, 539, 300, $D$, size: 8.5pt)
  rev-lab(p, 689, 322, $A$, size: 8.5pt)
  rev-lab(p, 1068, 322, $C$, size: 8.5pt)
})

// 第 2 题：三个容器（2026×939）
#let fig-rev-3-2(width: 11cm) = px-canvas(2026, 939, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev3-2.png", width: 2026 * u))
  rev-lab(p, 386, 655, $A$)
  rev-lab(p, 969, 668, $B$)
  rev-lab(p, 688, 330, $h$)
  rev-lab(p, 1534, 886, $C$)
})

// 第 3 题：两个瓶（555×1088）
#let fig-rev-3-3(width: 3.2cm) = px-canvas(555, 1088, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev3-3.png", width: 555 * u))
  rev-lab(p, 126, 1034, $A$)
  rev-lab(p, 414, 1032, $B$)
})

// 第 2 题（单元检查题二）：水中的折线框（683×939）
#let fig-rev-3-4(width: 3.6cm) = px-canvas(683, 939, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev3-4.png", width: 683 * u))
  rev-lab(p, 127, 297, $A$, size: 8.5pt)
  rev-lab(p, 357, 295, $F$, size: 8.5pt)
  rev-lab(p, 277, 455, $E$, size: 8.5pt)
  rev-lab(p, 496, 455, $D$, size: 8.5pt)
  rev-lab(p, 122, 617, $B$, size: 8.5pt)
  rev-lab(p, 491, 620, $C$, size: 8.5pt)
})

// 第 6 题：水压机活塞（321×1301）
#let fig-rev-3-5(width: 1.8cm) = px-canvas(321, 1301, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev3-5.png", width: 321 * u))
  rev-lab(p, 294, 54, $A$, size: 8pt)
  rev-lab(p, 147, 846, $B$, size: 8pt)
  rev-lab(p, 118, 953, $D$, size: 8pt)
  rev-lab(p, 199, 1080, $E$, size: 8pt)
  rev-lab(p, 200, 1233, $C$, size: 8pt)
})
