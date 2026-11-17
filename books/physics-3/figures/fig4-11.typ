// 图 4·11（原书 p.240）例 3 附图（CeTZ 重绘）
#import "fig4-lib.typ": *

#let fig-4-11(width: 5.2cm) = px-canvas(500, 295, origin: (210, 1245), width: width, (p, u) => {
  import cetz.draw: *
  for y in (1265, 1313, 1362, 1412, 1462, 1510) {
    line(p(230, y), p(642, y), mark: arrow-mark, stroke: 0.8pt)
  }
  let dash = (thickness: 0.6pt, dash: "dashed")
  line(p(525, 1318), p(525, 1385), stroke: dash)
  line(p(372, 1385), p(525, 1385), stroke: dash)
  line(p(372, 1385), p(372, 1525), stroke: (thickness: 0.6pt, dash: "dash-dotted"))
  line(p(384, 1318), p(525, 1385), stroke: 1.4pt, mark: arrow-mark)
  line(p(372, 1333), p(372, 1383), stroke: 1pt, mark: arrow-mark)
  circle(p(372, 1311), radius: 22, fill: white, stroke: 0.8pt)
  for k in range(-3, 4) {
    line(p(372 + k * 7 - 14, 1311 + 20), p(372 + k * 7 + 14, 1311 - 20), stroke: 0.4pt)
  }
  arc(p(432, 1318), start: 0deg, stop: -32deg, radius: 58, stroke: 0.6pt, anchor: "origin")
  tx(p, 452, 1330, $theta$, size: 8pt)
  tx(p, 350, 1393, $v'$, size: 8pt); tx(p, 536, 1393, $v$, size: 8pt)
  tx(p, 680, 1393, $H$)
})
