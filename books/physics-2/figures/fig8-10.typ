// 图 8·10 等温线（原书 p.291）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.291，原点取 170,915）。
#import "/common/series.typ": *

#let fig-8-10(width: 8cm) = px-canvas(360, 370, width: width, origin: (170, 915), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let hatch = tiling(size: (4pt, 4pt), place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt)))
  let curve = ((232, 980), (247, 1018), (275, 1062), (300, 1098), (335, 1135), (380, 1167), (420, 1188), (460, 1210))
  // 阴影区：曲线 A(247,1018)–B(420,1188) 下方
  let pts = ((247, 1240), (247, 1018), (275, 1062), (300, 1098), (335, 1135), (380, 1167), (420, 1188), (420, 1240))
  merge-path(fill: hatch, stroke: none, close: true, {
    for i in range(pts.len() - 1) { line(p(..pts.at(i)), p(..pts.at(i + 1))) }
  })
  let ax = (stroke: 0.8pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(203, 1240), p(203, 950), ..ax)
  line(p(203, 1240), p(485, 1240), ..ax)
  catmull(..curve.map(c => p(..c)), stroke: 1.6pt, tension: 0.5)
  let dash = (stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(247, 1018), p(247, 1240), ..dash)
  line(p(420, 1188), p(420, 1240), ..dash)
  lab(202, 935, $P$)
  lab(498, 1244, $V$)
  lab(195, 1252, $O$)
  lab(255, 1011, $A(P_1 V_1)$, anchor: "west")
  lab(422, 1180, $B(P_2 V_2)$, anchor: "west")
  lab(245, 1254, $V_1$)
  lab(421, 1255, $V_2$)
})
