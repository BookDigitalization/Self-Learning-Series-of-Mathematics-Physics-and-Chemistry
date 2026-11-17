// 习题 5·4 第 4 题附图（原书 p.279）。坐标取自原书页面 150 dpi 像素；磁轭斜线用淡灰色填充代替。
#import "/common/series.typ": *

#let fig-ex-5-4-4(width: 4.4cm) = px-canvas(320, 300, origin: (770, 625), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let pts = ((785, 635), (1075, 635), (1075, 865), (1000, 865), (1000, 768), (1027, 768), (1027, 678),
    (835, 678), (835, 768), (862, 768), (862, 865), (785, 865))
  line(..pts.map(q => p(..q)), close: true, stroke: 1pt, fill: luma(215))
  rect(p(893, 765), p(975, 862), stroke: 2.2pt)
  line(p(933, 690), p(933, 905), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  tx(933, 678, $O$); tx(878, 755, $A$); tx(992, 755, $D$); tx(870, 870, $B$); tx(985, 870, $C$)
  tx(937, 915, $O'$); tx(845, 815, $S$); tx(1020, 815, $N$)
})
