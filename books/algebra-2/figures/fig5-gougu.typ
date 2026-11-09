#import "/common/series.typ": *
// 勾股定理脚注里的小直角三角形：原书 p.175 脚注（弦、勾、股），不编号。
#let fig-gougu(width: 2.2cm) = px-canvas(100, 70, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  line(p(12, 55), p(88, 10), p(88, 55), close: true, stroke: 0.8pt)
  t(38, 22, [弦]); t(97, 33, [勾]); t(50, 65, [股])
})
