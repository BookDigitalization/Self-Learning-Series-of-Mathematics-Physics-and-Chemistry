// 图 5·18 鼠笼式转子（原书 p.277）
// 写实线条图沿用原扫描裁剪（fig5-18.png）；原图中没有文字。
#import "/common/series.typ": *
#let fig-5-18(width: 5.4cm) = px-canvas(886, 652, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-18.png", width: 886 * u))
})
