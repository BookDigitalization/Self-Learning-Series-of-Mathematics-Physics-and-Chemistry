// 图 15·20 飞机爬升时的举力（原书 p.510）
// 机翼与线条沿用原扫描裁剪（fig15-20.png，已涂去字母）；字母用文字补回。
// 坐标是 fig15-20.png 的像素坐标（1002×630，y 向下）。
// 注：图中 v 的下标（原图左上角箭头旁，应为 v₁）较糊，按图 15·19 写作 v₁。
#import "/common/series.typ": *

#let fig-15-20(width: 6.4cm) = px-canvas(1002, 630, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-20.png", width: 1002 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(455, 32, $Q'$)
  lab(590, 40, $Q$)
  lab(135, 158, unclear[$v_1$])
  lab(481, 205, $theta$)
  lab(445, 577, $G$)
  lab(662, 508, $theta$)
})
