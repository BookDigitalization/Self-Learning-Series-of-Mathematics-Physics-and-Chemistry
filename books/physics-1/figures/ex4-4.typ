// 例 2 示意图（原书 p.95）：甲、乙两车相向而行，不编号
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (510,920)）。
#import "/common/series.typ": *

#let fig-ex-2(width: 11cm) = px-canvas(820, 200, origin: (510, 920), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, box(fill: white, inset: 2pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.35)
  content(p(545, 950), anchor: "center", text(size: 8.5pt, align(center)[甲车\ 出发站]))
  content(p(1252, 950), anchor: "center", text(size: 8.5pt, align(center)[乙车\ 出发站]))
  line(p(565, 988), p(565, 1095), stroke: 0.8pt)
  line(p(1270, 988), p(1270, 1095), stroke: 0.8pt)
  line(p(965, 988), p(965, 1030), stroke: 0.8pt)
  line(p(565, 1000), p(965, 1000), stroke: 0.7pt, mark: mk)
  line(p(965, 1000), p(1270, 1000), stroke: 0.7pt, mark: mk)
  lab(770, 1000, [甲车走的路程（0.9 千米）])
  lab(1115, 1000, [乙车走的路程])
  line(p(565, 1040), p(1270, 1040), stroke: 0.8pt)
  line(p(565, 1085), p(1270, 1085), stroke: 0.7pt, mark: mk)
  lab(920, 1085, [1.5 千米])
})
