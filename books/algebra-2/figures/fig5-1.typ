#import "/common/series.typ": *
// 图 5·1：原书 p.174。线段 CD（长度单位）恰好 6 次量尽 AB；CD 的长是 AB 的 1/6。
// 坐标为 110 dpi 预览图上的像素坐标（y 向下），不是精确描图。
#let fig-5-1(width: 9.5cm) = px-canvas(430, 56, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9pt, body))
  line(p(8, 36), p(422, 36), stroke: 1pt)
  line(p(8, 30), p(8, 42), stroke: 0.7pt)
  line(p(422, 30), p(422, 42), stroke: 0.7pt)
  line(p(8, 14), p(76, 14), stroke: 1.4pt)
  line(p(8, 9), p(8, 19), stroke: 0.7pt)
  line(p(76, 9), p(76, 19), stroke: 0.7pt)
  t(5, 4, $C$); t(76, 4, $D$)
  t(8, 50, $A$); t(422, 50, $B$)
})
