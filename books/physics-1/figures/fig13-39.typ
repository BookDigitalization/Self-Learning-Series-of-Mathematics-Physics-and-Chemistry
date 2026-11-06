// 图 13·39 皮带传动（原书 p.464）
// 写实插画，保留原扫描裁剪（fig13-39.png，已涂去字母 v、A，用 CeTZ 补回）；图上的速度小箭头留在位图里。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-39(width: 5.6cm) = px-canvas(395, 545, origin: (385, 1380), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  content(p(385, 1380), anchor: "north-west", image("fig13-39.png", width: 395 * u))
  lab(602, 1568, $v$)
  lab(566, 1903, $A$)
})
