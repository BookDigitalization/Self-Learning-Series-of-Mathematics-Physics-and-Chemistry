// 例 4 示意图（原书 p.102）：A、B 两车相向而行，不编号
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (490,1690)）。
#import "/common/series.typ": *

#let fig-ex-4(width: 11cm) = px-canvas(800, 240, origin: (490, 1690), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, box(fill: white, inset: 1.5pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.35)
  line(p(523, 1775), p(523, 1905), stroke: 0.8pt)
  line(p(1235, 1775), p(1235, 1905), stroke: 0.8pt)
  line(p(982, 1775), p(982, 1822), stroke: 0.8pt)
  line(p(523, 1790), p(982, 1790), stroke: 0.7pt, mark: mk)
  line(p(982, 1790), p(1235, 1790), stroke: 0.7pt, mark: mk)
  lab(750, 1790, [$A$ 车所走路程 $S_A$])
  lab(1110, 1790, [$B$ 车所走路程 $S_B$])
  line(p(523, 1822), p(1235, 1822), stroke: 0.8pt)
  line(p(523, 1878), p(1235, 1878), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  lab(880, 1878, [220 公里])
  content(p(525, 1745), anchor: "center", text(size: 8.5pt)[甲地])
  content(p(1232, 1755), anchor: "center", text(size: 8.5pt)[乙地])
  // 速度箭头
  line(p(752, 1712), p(800, 1712), stroke: 0.7pt, mark: mk)
  lab(728, 1708, $v_A$)
  line(p(1140, 1715), p(1090, 1715), stroke: 0.7pt, mark: mk)
  lab(1160, 1711, $v_B$)
})
