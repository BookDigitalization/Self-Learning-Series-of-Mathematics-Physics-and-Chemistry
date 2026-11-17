// 图 3·44 电流计构造图（原书 p.205）
// 写实插画，沿用原扫描裁剪（fig3b-44.png，已涂去 0、B、n、a、Q、N、K、c，用文字补回）。坐标是 PNG 像素坐标（739×1362）。
#import "fig3b-lib.typ": *

#let fig-3-44(width: 4.9cm) = px-canvas(739, 1362, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3b-44.png", width: 739 * u))
  lab(p, 230, 50, $0$)
  lab(p, 432, 130, $B$)
  lab(p, 205, 230, $n$)
  lab(p, 680, 595, $a$)
  lab(p, 558, 618, $Q$)
  lab(p, 137, 953, $N$)
  lab(p, 373, 943, $K$)
  lab(p, 462, 925, $c$)
  lab(p, 115, 1085, $a$)
  lab(p, 318, 1017, $Q$)
})
