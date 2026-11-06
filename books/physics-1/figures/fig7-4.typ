// 图 7·4 物体滑下的加速度（原书 p.207，CeTZ 重绘）
// 坐标取自 200 dpi 看图工具的显示图（宽 1568），不是真实像素；画布左上角在显示图 (870, 1210)。
// 斜面底角 A(947,1612)，顶点 C(1335,1308)，直角顶点 B(1337,1612)；物块与分力的位置、长度为按原图估量的近似值。
#import "/common/series.typ": *

#let fig-7-4(width: 8.5cm) = px-canvas(530, 470, origin: (870, 1210), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.7pt
  set-style(stroke: lw, mark: (fill: black, scale: 0.45))
  let tx(pt, body, anchor: "center") = content(pt, anchor: anchor, text(size: 8pt, body))
  let A = (947, 1612)
  let B = (1337, 1612)
  let C = (1335, 1308)
  // 单位向量：沿斜面向上 e，斜面外法线 n（显示坐标，y 向下）
  let e = (0.787, -0.617)
  let nrm = (-0.617, -0.787)
  let at(o, a, v1, b, v2) = (o.at(0) + a * v1.at(0) + b * v2.at(0), o.at(1) + a * v1.at(1) + b * v2.at(1))
  // 三角形
  line(p(..A), p(..C), stroke: 1.2pt)
  line(p(..C), p(..B), stroke: 1.2pt)
  line(p(..A), p(..B), stroke: 1.2pt)
  // 斜边长度标注线（平行于斜面，向外偏移）
  let la = at(A, 0, e, 95, nrm)
  let lb = at(C, 0, e, 95, nrm)
  line(p(..la), p(..lb), mark: (start: ">", end: ">"))
  line(p(..A), p(..la), stroke: 0.5pt)
  line(p(..C), p(..lb), stroke: 0.5pt)
  let lm = at(A, 246, e, 95, nrm)
  content(p(..lm), anchor: "center", angle: 38deg, frame: "rect", fill: white, stroke: none, padding: 1pt, text(size: 8pt)[$l = 5$ 米])
  // 高度标注
  line(p(1335, 1308), p(1380, 1308), stroke: 0.5pt)
  line(p(1337, 1612), p(1380, 1612), stroke: 0.5pt)
  line(p(1365, 1308), p(1365, 1612), mark: (start: ">", end: ">"))
  content(p(1365, 1460), anchor: "center", angle: 90deg, frame: "rect", fill: white, stroke: none, padding: 1pt, text(size: 8pt)[$h = 3$ 米])
  // 底边标注
  line(p(947, 1650), p(1337, 1650), mark: (start: ">", end: ">"))
  line(p(947, 1612), p(947, 1658), stroke: 0.5pt)
  line(p(1337, 1612), p(1337, 1658), stroke: 0.5pt)
  content(p(1142, 1650), anchor: "center", frame: "rect", fill: white, stroke: none, padding: 1pt, text(size: 8pt)[$b = 4$ 米])
  // 底角 θ
  arc(p(..A), start: 0deg, stop: 38deg, radius: 45, anchor: "origin", stroke: 0.6pt)
  tx(p(1000, 1590), [$theta$])
  // 物块（沿斜面放置的矩形）
  let P = at(A, 275, e, 0, e)   // 斜面上一点
  let q1 = at(P, -48, e, 0, nrm)
  let q2 = at(P, 48, e, 0, nrm)
  let q3 = at(P, 48, e, 50, nrm)
  let q4 = at(P, -48, e, 50, nrm)
  line(p(..q1), p(..q2), p(..q3), p(..q4), close: true, stroke: 0.8pt)
  // 受力点（物块中心）
  let O = at(P, 0, e, 25, nrm)
  // 重力 G（竖直向下）
  line(p(..O), p(O.at(0), O.at(1) + 90), mark: (end: ">"))
  tx(p(O.at(0) + 2, O.at(1) + 105), [$G$])
  // 分力 G1（沿斜面向下）、G2（垂直斜面向内）
  let g1 = at(O, -55, e, 0, nrm)
  let g2 = at(O, 0, e, -62, nrm)
  line(p(..O), p(..g1), mark: (end: ">"))
  line(p(..O), p(..g2), mark: (end: ">"))
  let gtip = (O.at(0), O.at(1) + 90)
  line(p(..g1), p(..gtip), stroke: (paint: black, thickness: 0.5pt, dash: "dashed"))
  line(p(..g2), p(..gtip), stroke: (paint: black, thickness: 0.5pt, dash: "dashed"))
  tx(p(g1.at(0) - 14, g1.at(1) - 4), [$G_1$])
  tx(p(g2.at(0) + 16, g2.at(1) - 2), [$G_2$])
  // 摩擦力 f（沿斜面向上）
  let f0 = at(O, 10, e, 22, nrm)
  let f1 = at(O, 60, e, 22, nrm)
  line(p(..f0), p(..f1), mark: (end: ">"))
  tx(p(f1.at(0) + 8, f1.at(1) - 4), [$f$])
  // 物块处的 θ
  tx(p(O.at(0) + 10, O.at(1) + 28), [$theta$])
})
