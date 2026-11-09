#import "/common/series.typ": *
// 图 5·2：原书 p.174。CD 量 4 次后剩下 A'B，再用 CD/10 量 5 次，剩 A''B，再用 CD/100 量 7 次恰好量完。
#let fig-5-2(width: 9.5cm) = px-canvas(430, 56, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9pt, body))
  line(p(8, 36), p(422, 36), stroke: 1pt)
  for x in (8, 350, 392, 422) { line(p(x, 30), p(x, 42), stroke: 0.7pt) }
  line(p(8, 14), p(76, 14), stroke: 1.4pt)
  line(p(8, 9), p(8, 19), stroke: 0.7pt)
  line(p(76, 9), p(76, 19), stroke: 0.7pt)
  t(5, 4, $C$); t(76, 4, $D$)
  t(8, 50, $A$); t(350, 50, $A'$); t(392, 50, $A''$); t(422, 50, $B$)
})
