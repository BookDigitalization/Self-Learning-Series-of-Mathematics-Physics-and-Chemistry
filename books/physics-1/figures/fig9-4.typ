// 图 9·4 三个共点力平衡（原书 p.242）。坐标取自页面显示图，原点 (470,130)。
#import "/common/series.typ": *

#let fig-9-4(width: 9cm) = px-canvas(720, 380, origin: (470, 130), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b) = line(p(..a), p(..b), stroke: 1.5pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let o = (772, 300)
  arrow(o, (1140, 170))
  arrow(o, (525, 288))
  arrow(o, (775, 448))
  line(p(..o), p(1143, 320), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  line(p(1140, 170), p(1143, 320), stroke: (thickness: 0.7pt, dash: "dashed"))
  line(p(775, 448), p(1143, 320), stroke: (thickness: 0.7pt, dash: "dashed"))
  lab(1162, 160, $F_1$)
  lab(495, 288, $F_3$)
  lab(785, 468, $F_2$)
  lab(1162, 326, $R$)
})
