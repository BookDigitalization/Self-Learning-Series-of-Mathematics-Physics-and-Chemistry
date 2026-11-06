// 图 6·14 一个力可以分成无数对的分力（原书 p.181）
// 几何示意图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-6-14(width: 7.4cm) = px-canvas(560, 620, width: width, origin: (385 * 1.0657, 1170 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.7pt, dash: "dashed"))
  let B = (405, 1410)
  let A = (870, 1410)
  line(q(..B), q(..A), stroke: 1.4pt)
  for (pp, qq) in (((565, 1268), (712, 1548)), ((780, 1182), (490, 1630)), ((612, 1350), (663, 1470))) {
    arr(B, pp); arr(B, qq)
    dash(pp, A); dash(qq, A)
  }
  content(q(392, 1410), anchor: "center", text(size: 9pt, $B$))
  content(q(885, 1410), anchor: "center", text(size: 9pt, $A$))
})
