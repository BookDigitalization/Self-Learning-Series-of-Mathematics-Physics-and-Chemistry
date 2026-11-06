// 图 3·13 连通器（原书 p.58）
// 实物示意图，沿用原扫描裁剪（fig3-13.png，已涂去 h）；h 用 CeTZ 补回。
// 坐标是 fig3-13.png 的像素坐标（1578×672，y 向下）。
#import "/common/series.typ": *

#let fig-3-13(width: 10cm) = px-canvas(1578, 672, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-13.png", width: 1578 * u))
  content(p(1533, 352), anchor: "center", text(size: 11pt, $h$))
})
