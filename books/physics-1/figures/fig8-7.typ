// 图 8·7 两人站在小车上互相拉绳（原书 p.216）
// 写实插画沿用原扫描裁剪（fig8-7.png，已涂去 F_A、F_B、A、B）；字母用 CeTZ 补回。
// 坐标是 fig8-7.png 的像素坐标：(显示图 x-380)×2.1314，(y-1410)×2.1314。
#import "/common/series.typ": *

#let fig-8-7(width: 11cm) = px-canvas(1962, 981, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-7.png", width: 1962 * u))
  // 涂字后残留的小墨点
  rect(p(695, 250), p(745, 275), fill: white, stroke: none)
  rect(p(1160, 250), p(1215, 275), fill: white, stroke: none)
  content(p(729, 294), anchor: "center", text(size: 10pt, $F_A$))
  content(p(1187, 294), anchor: "center", text(size: 10pt, $F_B$))
  content(p(341, 703), anchor: "center", text(size: 10pt, $A$))
  content(p(1524, 703), anchor: "center", text(size: 10pt, $B$))
})
