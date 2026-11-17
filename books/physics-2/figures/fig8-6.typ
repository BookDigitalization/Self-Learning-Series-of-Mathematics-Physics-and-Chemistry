// 图 8·6 等压线（原书 p.289）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.289，原点取 130,615）。
#import "/common/series.typ": *

#let fig-8-6(width: 8cm) = px-canvas(430, 360, width: width, origin: (130, 615), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let hatch = tiling(size: (4pt, 4pt), place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt)))
  rect(p(330, 775), p(420, 910), fill: hatch, stroke: none)
  let ax = (stroke: 0.8pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(210, 910), p(210, 640), ..ax)
  line(p(210, 910), p(527, 910), ..ax)
  line(p(172, 775), p(475, 775), stroke: 1.2pt)
  let dash = (stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(330, 775), p(330, 945), ..dash)
  line(p(420, 775), p(420, 970), ..dash)
  line(p(208, 925), p(208, 970), stroke: 0.6pt)
  // P 的尺寸线
  line(p(187, 835), p(187, 775), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.5))
  line(p(187, 852), p(187, 910), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.5))
  lab(187, 843, $P$)
  // V1、V2 的尺寸线
  line(p(210, 935), p(232, 935), stroke: 0.7pt)
  line(p(290, 935), p(330, 935), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.5))
  lab(268, 934, $V_1$)
  line(p(210, 955), p(300, 955), stroke: 0.7pt)
  line(p(345, 955), p(418, 955), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.5))
  lab(323, 958, $V_2$)
  lab(212, 628, $P$)
  lab(543, 913, $V$)
  lab(198, 924, $O$)
  lab(337, 758, $E(P V_1)$)
  lab(421, 758, $F(P V_2)$)
  lab(343, 927, $E_1$)
  lab(431, 927, $F_1$)
})
