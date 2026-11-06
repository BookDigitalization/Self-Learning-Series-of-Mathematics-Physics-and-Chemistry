// 图 15·17 机翼的剖面（原书 p.507）
// 机翼与线条沿用原扫描裁剪（fig15-17.png，已涂去文字）；“翼弦”“前缘”“后缘”和 α 用文字补回。
// 坐标是 fig15-17.png 的像素坐标（1290×385，y 向下）。
#import "/common/series.typ": *

#let fig-15-17(width: 9cm) = px-canvas(1290, 385, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-17.png", width: 1290 * u))
  let zh(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 10pt, weight: "medium", body))
  zh(608, 40, [翼弦])
  zh(373, 132, [前缘])
  zh(1200, 266, [后缘])
  content(p(72, 312), anchor: "center", text(size: 10pt, $alpha$))
})
