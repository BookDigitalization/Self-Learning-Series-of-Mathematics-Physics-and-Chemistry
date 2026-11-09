#import "/common/series.typ": *
// 图 5·5：原书 p.180。三条数轴上 A、B 两点的三种位置关系：A 在 B 左边、重合、A 在 B 右边。
#let fig-5-5(width: 7.5cm) = px-canvas(260, 110, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let axis(y) = {
    line(p(5, y), p(250, y), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.4))
    t(256, y, $x$)
  }
  axis(20)
  circle(p(110, 20), radius: 1.6 * u, fill: black, stroke: none)
  circle(p(150, 20), radius: 1.6 * u, fill: black, stroke: none)
  t(110, 33, $A$); t(150, 33, $B$)
  axis(58)
  circle(p(115, 58), radius: 1.6 * u, fill: black, stroke: none)
  t(115, 47, $B$); t(115, 69, $A$)
  axis(95)
  circle(p(75, 95), radius: 1.6 * u, fill: black, stroke: none)
  circle(p(115, 95), radius: 1.6 * u, fill: black, stroke: none)
  t(75, 106, $B$); t(115, 106, $A$)
})
