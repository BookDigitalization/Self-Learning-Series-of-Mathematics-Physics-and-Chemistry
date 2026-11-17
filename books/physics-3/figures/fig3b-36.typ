// 图 3·36 左手法则（原书 p.197）
// 写实插画，沿用原扫描裁剪（fig3b-36.png，已涂去 F、I、S、N，用文字补回）。坐标是 PNG 像素坐标（1109×855）。
#import "fig3b-lib.typ": *

#let fig-3-36(width: 7.2cm) = px-canvas(1109, 855, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3b-36.png", width: 1109 * u))
  lab(p, 667, 35, $F$)
  lab(p, 790, 297, $I$)
  lab(p, 75, 447, $S$)
  lab(p, 857, 435, $N$)
})
