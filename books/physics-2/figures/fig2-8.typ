// 图 2·8 内燃机的冷却系统（原书 p.39）
// 写实插画，沿用原扫描裁剪二值化（fig2-8.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-8.png 的像素坐标（1260×880）。
#import "/common/series.typ": *

#let fig-2-8(width: 9.83cm) = px-canvas(1260, 880, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-8.png", width: 1260 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(262, 534, [#emph[1]])
  lab(1098, 324, [#emph[2]])
  lab(1098, 506, [#emph[3]])
  lab(796, 152, [#emph[4]])
  lab(436, 708, [#emph[5]])
})
