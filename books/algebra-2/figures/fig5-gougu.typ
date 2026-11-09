#import "/common/series.typ": *
// 勾股定理脚注里的小直角三角形：原书 p.175 脚注（弦、勾、股），不编号。
#let fig-gougu(width: 2.2cm) = px-canvas(100, 70, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  line(p(30, 10), p(90, 55), p(30, 55), close: true, stroke: 0.8pt)
  t(12, 28, [弦]); t(98, 33, [勾]); t(60, 65, [股])
})
