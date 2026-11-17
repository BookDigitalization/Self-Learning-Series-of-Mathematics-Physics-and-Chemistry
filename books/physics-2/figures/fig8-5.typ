// 图 8·5 气体等压膨胀做功（原书 p.288）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.288，原点取 175,695）。
#import "/common/series.typ": *

#let fig-8-5(width: 7.5cm) = px-canvas(370, 260, width: width, origin: (175, 695), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let hatch = tiling(size: (4pt, 4pt), place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt)))
  rect(p(190, 737), p(360, 915), fill: hatch, stroke: none)
  line(p(190, 737), p(190, 915), stroke: 1.4pt)
  line(p(190, 737), p(530, 737), stroke: 1.4pt)
  line(p(190, 915), p(530, 915), stroke: 1.4pt)
  line(p(360, 737), p(360, 915), stroke: 1.2pt)
  line(p(489, 737), p(489, 915), stroke: (thickness: 0.7pt, dash: "dashed"))
  // 压强小箭头与力 F
  for y in (757, 778, 800, 845, 867, 889) {
    line(p(360, y), p(388, y), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.5))
  }
  line(p(360, 825), p(445, 825), stroke: 0.9pt, mark: (end: ">", fill: black, scale: 0.6))
  lab(397, 757, text(weight: "bold", $p$))
  lab(456, 825, $F$)
  lab(349, 825, $A$)
  // 距离 s
  line(p(360, 722), p(360, 722), stroke: none)
  merge-path(stroke: 0.7pt, {
    line(p(363, 722), p(370, 716))
    line((), p(412, 716))
    line((), p(428, 710))
    line((), p(444, 716))
    line((), p(486, 716))
    line((), p(492, 722))
  })
  lab(428, 701, $s$)
  lab(192, 722, $D$)
  lab(353, 722, $E$)
  lab(497, 719, $E_1$)
  lab(193, 928, $C$)
  lab(361, 928, $F$)
  lab(489, 929, $F_1$)
})
