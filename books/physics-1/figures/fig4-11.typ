// 图 4·11 s-t 图（原书 p.101）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (520,1360)）。
#import "/common/series.typ": *

#let fig-4-11(width: 9cm) = px-canvas(660, 540, origin: (520, 1360), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (583, 1825)
  let sx = 55.3    // 每 1 秒
  let sy = 10.97   // 每 1 厘米
  let pt(t, s) = (ox + t * sx, oy - s * sy)
  line(p(ox, oy), p(ox, 1405), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(1130, oy), stroke: 0.9pt, mark: mk)
  for s in (5, 10, 15, 20, 25, 30, 35) {
    line(p(ox, oy - s * sy), p(ox + 7, oy - s * sy), stroke: 0.6pt)
    lab(ox - 20, oy - s * sy, str(s))
  }
  for t in range(1, 9) {
    line(p(ox + t * sx, oy), p(ox + t * sx, oy - 6), stroke: 0.6pt)
    if t != 4 { lab(ox + t * sx - 4, oy + 20, str(t)) }
  }
  lab(ox + 4 * sx + 6, oy + 20, [4])
  lab(ox - 12, oy + 10, [0])
  lab(610, 1375, [$s$（厘米）])
  lab(1095, oy + 24, [$t$（秒）])
  // 图线 O-A-B-C
  line(p(..pt(0, 0)), p(..pt(2, 10)), p(..pt(4, 10)), p(..pt(8, 34)), stroke: 1.3pt)
  for (t, s) in ((1, 5), (2, 10), (3, 10), (4, 10), (5, 16), (6, 22), (7, 28), (8, 34)) {
    circle(p(..pt(t, s)), radius: 2.5 * u, stroke: none, fill: black)
  }
  // N（3.5 秒）、M，P（6.5 秒）、H、F
  line(p(ox, pt(2, 10).at(1)), p(..pt(3.5, 10)), stroke: 0.7pt, dash: "dashed")
  line(p(..pt(3.5, 10)), p(pt(3.5, 0).at(0), oy), stroke: 0.7pt, dash: "dashed")
  line(p(ox, pt(6.5, 25).at(1)), p(..pt(6.5, 25)), stroke: 0.7pt, dash: "dashed")
  line(p(..pt(6.5, 25)), p(pt(6.5, 0).at(0), oy), stroke: 0.7pt, dash: "dashed")
  lab(597, 1698, $F$)
  lab(692, 1698, $A$)
  lab(776, 1697, $M$)
  lab(797, 1742, $B$)
  lab(601, 1535, $H$)
  lab(922, 1535, $P$)
  lab(1027, 1427, $C$)
  lab(pt(3.5, 0).at(0) - 4, oy + 22, $N$)
})
