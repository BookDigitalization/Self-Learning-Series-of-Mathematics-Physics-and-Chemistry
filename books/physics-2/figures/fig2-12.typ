// 图 2·12 验温器（原书 p.43）
// 写实插画，沿用原扫描裁剪二值化（fig2-12.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-12.png 的像素坐标（770×740）。
#import "/common/series.typ": *

#let fig-2-12(width: 6.01cm) = px-canvas(770, 740, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-12.png", width: 770 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(476, 38, [刻度尺])
  lab(470, 194, [液滴])
  lab(400, 618, [烧瓶])
})
