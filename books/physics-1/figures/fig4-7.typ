// 图 4·7 匀速直线运动的路程图线（原书 p.98）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (330,1260)）。
#import "/common/series.typ": *

#let fig-4-7(width: 7cm) = px-canvas(470, 580, origin: (330, 1260), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (398, 1788)
  let sx = 45.7    // 每 1 秒
  let sy = 24.5    // 每 1 米
  line(p(ox, oy), p(ox, 1322), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(757, oy), stroke: 0.9pt, mark: mk)
  // 路程图线 OD，v = 2.5 米/秒
  line(p(ox, oy), p(718, 1348), stroke: 1.3pt)
  for s in (4, 8, 12, 16) {
    line(p(ox, oy - s * sy), p(ox + 7, oy - s * sy), stroke: 0.6pt)
    lab(ox - 22, oy - s * sy, str(s))
  }
  for t in (2, 4, 6) {
    line(p(ox + t * sx, oy), p(ox + t * sx, oy - 7), stroke: 0.6pt)
    lab(ox + t * sx, oy + 18, str(t))
  }
  // A(2, 5)、B(4, 10)、C(6, 15)
  for (t, s) in ((2, 5), (4, 10), (6, 15)) {
    let (x, y) = (ox + t * sx, oy - s * sy)
    line(p(ox, y), p(x, y), stroke: 0.7pt, dash: "dashed")
    line(p(x, oy), p(x, y), stroke: 0.7pt, dash: "dashed")
    circle(p(x, y), radius: 3 * u, stroke: 0.6pt, fill: white)
  }
  // P：t = 3 秒，s = 7.5 米
  let (px, py) = (ox + 3 * sx, oy - 7.5 * sy)
  line(p(ox, py), p(px, py), stroke: 0.7pt, dash: "dashed")
  line(p(px, oy), p(px, py), stroke: 0.7pt, dash: "dashed")
  lab(ox - 20, py - 6, $M$)
  lab(px + 18, py - 2, $P$)
  lab(px, oy + 18, $N$)
  lab(ox - 4, oy + 18, $O$)
  lab(480, 1646, $A$)
  lab(570, 1508, $B$)
  lab(657, 1393, $C$)
  lab(712, 1352, $D$)
  lab(417, 1283, [$s$（米）])
  lab(735, oy + 18, [$t$（秒）])
})
