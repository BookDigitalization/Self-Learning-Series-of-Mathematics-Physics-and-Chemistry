// 图 4·12 A、B 两车的路程图线（原书 p.103）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (850,1120)）。
#import "/common/series.typ": *

#let fig-4-12(width: 8cm) = px-canvas(540, 500, origin: (850, 1120), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (920, 1567)
  let sx = 79      // 每 1 小时
  let sy = 1.355   // 每 1 公里
  let pt(t, s) = (ox + t * sx, oy - s * sy)
  line(p(ox, oy), p(ox, 1185), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(1350, oy), stroke: 0.9pt, mark: mk)
  for s in (60, 120, 180, 240) {
    line(p(ox, oy - s * sy), p(ox + 7, oy - s * sy), stroke: 0.6pt)
    lab(ox - 28, oy - s * sy, str(s))
  }
  for t in (1, 2, 3, 4) {
    line(p(ox + t * sx, oy), p(ox + t * sx, oy - 6), stroke: 0.6pt)
    lab(ox + t * sx, oy + 22, str(t))
  }
  lab(ox - 8, oy + 22, [0])
  lab(938, 1157, [$s$（公里）])
  lab(1328, oy + 22, [$t$（小时）])
  // A 车：OA，v = 40 公里/小时
  line(p(ox, oy), p(..pt(5.1, 204)), stroke: 1.3pt)
  // B 车：B(0, 220) → C(1, 190) → D(3, 190) → F
  line(p(..pt(0, 220)), p(..pt(1, 190)), p(..pt(3, 190)), p(..pt(5.1, 127)), stroke: 1.3pt)
  // E(4, 160)
  line(p(ox, pt(4, 160).at(1)), p(..pt(4, 160)), stroke: 0.7pt, dash: "dashed")
  line(p(..pt(4, 160)), p(pt(4, 0).at(0), oy), stroke: 0.7pt, dash: "dashed")
  circle(p(..pt(4, 160)), radius: 2.5 * u, stroke: none, fill: black)
  circle(p(..pt(1, 190)), radius: 2.5 * u, stroke: 0.6pt, fill: white)
  circle(p(..pt(3, 190)), radius: 2.5 * u, stroke: 0.6pt, fill: white)
  lab(ox - 20, pt(0, 220).at(1) - 6, $B$)
  lab(1003, 1297, $C$)
  lab(1155, 1295, $D$)
  lab(1230, 1328, $E$)
  lab(1322, 1296, $A$)
  lab(1322, 1414, $F$)
  lab(1308, 1344, [(4, 160)])
})
