// 图 8·24 蒸汽机汽缸中蒸汽压强变化图线（原书 p.303）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.303，原点取 455,975）。
#import "/common/series.typ": *

#let fig-8-24(width: 8cm) = px-canvas(450, 340, width: width, origin: (455, 975), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let hatch = tiling(size: (4pt, 4pt), place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt)))
  let cd = ((600, 1085), (615, 1108), (635, 1136), (665, 1164), (700, 1182), (740, 1194), (775, 1198), (785, 1203))
  let poly = ((530, 1233), (530, 1085), ..cd, (785, 1233))
  merge-path(fill: hatch, stroke: none, close: true, {
    for i in range(poly.len() - 1) { line(p(..poly.at(i)), p(..poly.at(i + 1))) }
  })
  let ax = (stroke: 0.8pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(479, 1285), p(479, 1005), ..ax)
  line(p(479, 1285), p(860, 1285), ..ax)
  let heavy = 1.6pt
  line(p(530, 1233), p(530, 1085), stroke: heavy)
  line(p(530, 1085), p(600, 1085), stroke: heavy)
  catmull(..cd.map(c => p(..c)), stroke: heavy, tension: 0.5)
  line(p(785, 1203), p(785, 1233), stroke: heavy)
  line(p(530, 1233), p(785, 1233), stroke: heavy)
  let dash = (stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(530, 1233), p(530, 1285), ..dash)
  line(p(600, 1085), p(600, 1285), ..dash)
  line(p(785, 1233), p(785, 1285), ..dash)
  lab(479, 993, $P$)
  lab(874, 1284, $V$)
  lab(477, 1294, $O$)
  lab(533, 1044, $B$)
  lab(601, 1046, $C$)
  lab(518, 1230, $A$)
  lab(795, 1199, $D$)
  lab(795, 1236, $E$)
  lab(535, 1297, $B_1$)
  lab(601, 1296, $C_1$)
  lab(784, 1297, $D_1$)
})
