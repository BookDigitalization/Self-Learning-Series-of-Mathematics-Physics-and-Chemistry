#import "/common/series.typ": *
// 图 5·3：原书 p.175。正方形 ABCD（A 左下、B 右下、C 右上、D 左上），对角线 AC。
#let fig-5-3(width: 3.6cm) = px-canvas(140, 150, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9pt, body))
  rect(p(10, 130), p(130, 10), stroke: 1pt)
  line(p(10, 130), p(130, 10), stroke: 1pt)
  t(3, 10, $D$); t(137, 10, $C$); t(3, 138, $A$); t(137, 138, $B$)
})
