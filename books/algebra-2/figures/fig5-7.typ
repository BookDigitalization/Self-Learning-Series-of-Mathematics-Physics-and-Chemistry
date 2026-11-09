#import "/common/series.typ": *
// 图 5·7：原书 p.203。圆环（斜线部分），外半径 R、内半径 r。近似像素坐标。
#let fig-5-7(width: 4.2cm) = px-canvas(240, 240, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let hatch = tiling(size: (3.2pt, 3.2pt))[#place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt))]
  circle(p(120, 120), radius: 115 * u, stroke: 1pt, fill: hatch)
  circle(p(120, 120), radius: 48 * u, stroke: 1pt, fill: white)
  line(p(120, 120), p(235, 120), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(120, 120), p(148, 162), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.4))
  t(150, 111, $R$); t(124, 147, $r$)
})

