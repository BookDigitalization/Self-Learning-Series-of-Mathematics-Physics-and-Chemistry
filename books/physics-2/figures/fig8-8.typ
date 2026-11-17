// 图 8·8 等容线（原书 p.290）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.290，原点取 200,500）。
#import "/common/series.typ": *

#let fig-8-8(width: 8cm) = px-canvas(400, 360, width: width, origin: (200, 500), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let ax = (stroke: 0.8pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(233, 801), p(233, 530), ..ax)
  line(p(233, 801), p(558, 801), ..ax)
  line(p(409, 572), p(409, 840), stroke: 0.9pt)
  line(p(404, 588), p(409, 588), stroke: 0.7pt)
  line(p(404, 712), p(409, 712), stroke: 0.7pt)
  line(p(237, 812), p(237, 842), stroke: 0.6pt)
  line(p(238, 826), p(300, 826), stroke: 0.7pt, mark: (start: ">", fill: black, scale: 0.5))
  line(p(336, 826), p(409, 826), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.5))
  lab(318, 826, $V$)
  lab(232, 515, $P$)
  lab(571, 801, $V$)
  lab(224, 809, $O$)
  lab(414, 592, $F(P_2 V)$, anchor: "west")
  lab(414, 712, $E(P_1 V)$, anchor: "west")
})
