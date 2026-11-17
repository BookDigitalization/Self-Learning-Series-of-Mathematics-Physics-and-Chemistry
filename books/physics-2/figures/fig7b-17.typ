// 图 7·17 压强减小，沸点降低（p.249）
// 写实插画沿用原扫描裁剪（fig7b-17.png，二值化，已涂去标注接抽气机，用真文字补回）。
// 坐标是 fig7b-17.png 的像素坐标（474×647，y 向下）。
#import "/common/series.typ": *

#let fig-7-17(width: 5.6cm) = px-canvas(474, 647, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-17.png", width: 474 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 34 * u, body))
  lab(369, 607, [接抽气机])
})
