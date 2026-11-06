// 习题 15·5 第 1 题附图：两纸片之间吹气（原书 p.503）
// 写实插画，沿用原扫描裁剪（ex15-5-1.png，已涂去顶部“吹气”）；“吹气”用文字补回。
// 坐标是 ex15-5-1.png 的像素坐标（619×822，y 向下）。
#import "/common/series.typ": *

#let ex-15-5-1(width: 3.4cm) = px-canvas(619, 822, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex15-5-1.png", width: 619 * u))
  content(p(205, 20), anchor: "center", text(font: fonts.hei, size: 9pt, weight: "medium", [吹气]))
})
