// 图 11·24 自由落体中机械能的转变（原书 p.361）
// 示意图，按原图重绘（B 球原图涂黑，A、C 为空心圆）。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-11-24(width: 4.6cm) = px-canvas(280, 700, origin: (1110, 125), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let st = (end: "stealth", fill: black, scale: 0.4)
  line(p(1120, 818), p(1385, 818), stroke: 1pt)
  for k in range(0, 23) {
    let x = 1122 + k * 12
    line(p(x + 9, 818), p(x, 832), stroke: 0.5pt)
  }
  line(p(1207, 190), p(1207, 760), stroke: 1.8pt)
  circle(p(1207, 162), radius: 30 * u, stroke: 1.1pt)
  circle(p(1205, 525), radius: 30 * u, fill: luma(40), stroke: 1.1pt)
  circle(p(1205, 788), radius: 30 * u, fill: white, stroke: 1.1pt)
  lab(1160, 160, $C$)
  lab(1158, 525, $B$)
  lab(1158, 792, $A$)
  line(p(1210, 195), p(1368, 195), stroke: 0.7pt)
  line(p(1235, 557), p(1302, 557), stroke: 0.7pt)
  line(p(1275, 330), p(1275, 195), stroke: 0.8pt, mark: st)
  line(p(1275, 400), p(1275, 557), stroke: 0.8pt, mark: st)
  lab(1275, 365, $h_1$)
  line(p(1335, 420), p(1335, 195), stroke: 0.8pt, mark: st)
  line(p(1335, 500), p(1335, 817), stroke: 0.8pt, mark: st)
  lab(1335, 458, $h$)
})
