// 图 3·24 槽式水银气压计（原书 p.67）
// 写实插画，沿用原扫描裁剪（已涂去 E、S、D、I、C、B、A），字母用 CeTZ 补回；
// 管子上部有一个字母（像“p”或“D”）紧靠仪器，没有涂去，留在位图里（见 checklist/ch03.md）。
// 坐标是 fig3-24.png 的像素坐标（363×1898）；原页显示图 (530,110) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-24(width: 1.6cm) = px-canvas(363, 1898, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-24.png", width: 363 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(70, 213, $E$)
  lab(217, 347, $S$)
  lab(79, 1435, $D$)
  lab(288, 1460, $I$)
  lab(266, 1562, $C$)
  lab(251, 1709, $B$)
  lab(213, 1854, $A$)
})
