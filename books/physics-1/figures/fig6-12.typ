// 图 6·12 求四个共点力的合力（原书 p.178）
// 矢量示意图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-6-12(width: 7.6cm) = px-canvas(560, 700, width: width, origin: (330 * 1.0657, 1110 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 1pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.5pt, dash: "dashed"))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let O = (412, 1265)
  let a = (412, 1148)
  let b = (648, 1148)
  let c = (805, 1470)
  let d = (760, 1555)
  let f2 = (650, 1265)
  let f4 = (365, 1352)
  let f3 = (570, 1690)
  // F1 F2 及其合力 R12
  arr(O, a); arr(O, f2)
  dash(a, b); dash(b, f2)
  arr(O, b)
  lab(412, 1133, $a$); lab(650, 1128, $b$); lab(395, 1262, $O$)
  lab(392, 1200, $F_1$); lab(570, 1243, $F_2$); lab(510, 1195, $R_(12)$)
  // R123
  dash(b, c); dash(O, c)
  arr(O, f3); arr(O, f4)
  dash(f3, c); dash(f4, d)
  lab(817, 1467, $c$)
  lab(523, 1665, $F_3$); lab(362, 1295, $F_4$); lab(612, 1347, $R_(123)$)
  // 总合力 R
  arr(O, d, w: 1.4pt)
  lab(630, 1422, $R$); lab(775, 1567, $d$)
  dash(c, d)
})
