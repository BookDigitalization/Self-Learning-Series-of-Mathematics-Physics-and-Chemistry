// 图 6·3 阻尼振荡和无阻尼振荡的图线（原书 p.307）。CeTZ 重绘，坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-3(width: 10cm) = px-canvas(600, 345, origin: (350, 1225), width: width, (p, u) => {
  import cetz.draw: *
  // (a) 阻尼振荡
  wire(p, (360, 1290), (938, 1290))
  line(p(930, 1290), p(945, 1290), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  let pts = range(0, 560).map(i => {
    let x = 396 + i
    p(x, 1290 + 50 * calc.exp(-i / 190) * calc.cos(2 * calc.pi * i / 59))
  })
  line(..pts, stroke: 1.1pt)
  txt(p, 650, 1340, [($a$)])
  // (b) 无阻尼振荡
  wire(p, (360, 1450), (938, 1450))
  line(p(930, 1450), p(945, 1450), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  let pts2 = range(0, 470).map(i => {
    let x = 396 + i
    p(x, 1450 + 46 * calc.cos(2 * calc.pi * i / 52))
  })
  line(..pts2, stroke: 1.1pt)
  txt(p, 650, 1543, [($b$)])
})
