#import "/common/series.typ": *
// 图 5·4：原书 p.179。数轴上取单位正方形，以 O 为圆心、对角线 OC 为半径画弧交数轴于 M，OM = √2。
// 单位长 70 px；O 在 x = 100。
#let fig-5-4(width: 8cm) = px-canvas(300, 105, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let ox = 100
  let s = 70
  let y0 = 90
  line(p(5, y0), p(295, y0), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.4))
  rect(p(ox, y0), p(ox + s, y0 - s), stroke: 0.9pt)
  line(p(ox, y0), p(ox + s, y0 - s), stroke: 0.9pt)
  let r = s * calc.sqrt(2)
  arc(p(ox + s, y0 - s), start: 45deg, stop: 0deg, radius: r * u, stroke: (thickness: 0.8pt, dash: "dashed"))
  for (x, lab) in ((ox - s, $-1$), (ox, $O$), (ox + r, $sqrt(2)$), (ox + 2 * s, $2$)) {
    line(p(x, y0), p(x, y0 + 4), stroke: 0.6pt)
    t(x, y0 + 12, lab)
  }
  t(ox + r + 6, y0 - 8, $M$)
  t(293, y0 - 8, $x$)
})
