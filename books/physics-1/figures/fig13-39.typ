// 图 13·39 皮带传动（原书 p.464）
// 写实插画，保留原扫描裁剪（fig13-39.png，已涂去字母 v、A、B，用 CeTZ 补回）；图上的速度小箭头留在位图里。
// 坐标是 PNG 像素坐标（宽 843、高 870）。
#import "/common/series.typ": *

#let fig-13-39(width: 5.6cm) = px-canvas(843, 870, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  content(p(0, 0), anchor: "north-west", image("fig13-39.png", width: 843 * u))
  lab(465, 190, $v$)
  lab(808, 88, $B$)
  lab(372, 838, $A$)
})
