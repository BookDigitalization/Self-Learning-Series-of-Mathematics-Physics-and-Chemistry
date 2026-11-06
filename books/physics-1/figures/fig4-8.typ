// 图 4·8 两个匀速直线运动的路程图线（原书 p.98）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (880,1340)）。
#import "/common/series.typ": *

#let fig-4-8(width: 7cm) = px-canvas(480, 520, origin: (880, 1340), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (928, 1798)
  line(p(ox, oy), p(ox, 1385), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(1297, oy), stroke: 0.9pt, mark: mk)
  // 直线 I、II
  line(p(ox, oy), p(1222, 1455), stroke: 1.3pt)
  line(p(ox, oy), p(1225, 1637), stroke: 1.3pt)
  // C 在 I 上，B 在 II 上，A 在 t 轴上
  line(p(ox, 1534), p(1145, 1534), stroke: 0.7pt, dash: "dashed")
  line(p(ox, 1672), p(1145, 1672), stroke: 0.7pt, dash: "dashed")
  line(p(1145, 1545), p(1145, oy), stroke: 0.7pt, dash: "dashed")
  lab(932, 1378, $s$)
  lab(1217, 1455, $upright(I)$)
  lab(1242, 1628, $upright("II")$)
  lab(1160, 1548, $C$)
  lab(1160, 1690, $B$)
  lab(1145, 1815, $A$)
  lab(ox - 12, oy + 16, $O$)
  lab(1297, 1782, $t$)
})
