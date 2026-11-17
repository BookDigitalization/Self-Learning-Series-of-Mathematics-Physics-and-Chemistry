// 图 3·34 磁场对直线电流的作用（原书 p.195）
// 写实插画，沿用原扫描裁剪（fig3b-34.png，已涂去字母和 ±、(a)(b)，用文字补回；F 的箭头保留在位图里）。
// 坐标是 PNG 的像素坐标（1224×1131）。
#import "fig3b-lib.typ": *

#let fig-3-34(width: 8.2cm) = px-canvas(1224, 1131, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3b-34.png", width: 1224 * u))
  lab(p, 305, 352, $F$)
  lab(p, 75, 447, $B$)
  lab(p, 565, 557, $A$)
  lab(p, 512, 588, [+], size: 10pt)
  lab(p, 122, 485, [−], size: 10pt)
  lab(p, 248, 562, $N$)
  lab(p, 412, 522, $S$)
  lab(p, 328, 1080, $(a)$)
  lab(p, 668, 587, $B$)
  lab(p, 708, 613, [+], size: 10pt)
  lab(p, 835, 575, $N$)
  lab(p, 1000, 532, $S$)
  lab(p, 913, 792, $F$)
  lab(p, 1138, 687, $A$)
  lab(p, 1097, 723, [−], size: 10pt)
  lab(p, 950, 1102, $(b)$)
})
