// 图 15·11 水流抽气管（原书 p.502）
// 写实插图，沿用原扫描裁剪（fig15-11.png，已涂去文字）；“水”“空气”M A 用文字补回。
// 坐标是 fig15-11.png 的像素坐标（1823×1397，y 向下）。
#import "/common/series.typ": *

#let fig-15-11(width: 11.5cm) = px-canvas(1823, 1397, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-11.png", width: 1823 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  let zh(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.kai, size: 10pt, body))
  zh(300, 222, [水])
  zh(480, 620, [空气])
  lab(295, 742, $M$)
  lab(800, 575, $M$)
  lab(1562, 638, $A$)
})
