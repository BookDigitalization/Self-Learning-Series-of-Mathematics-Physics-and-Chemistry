// 图 3·40 平行电流间相互作用的实验装置（原书 p.201）
// 写实插画，沿用原扫描裁剪（fig3b-40.png，已涂去 A、B、(a)、(b)，用文字补回；图中电流方向箭头保留在位图里）。
// 坐标是 PNG 像素坐标（1570×1144）。
#import "fig3b-lib.typ": *

#let fig-3-40(width: 10.2cm) = px-canvas(1570, 1144, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3b-40.png", width: 1570 * u))
  lab(p, 195, 305, $B$)
  lab(p, 282, 305, $A$)
  lab(p, 930, 305, $B$)
  lab(p, 1010, 305, $A$)
  lab(p, 228, 1090, $(a)$)
  lab(p, 978, 1090, $(b)$)
})
