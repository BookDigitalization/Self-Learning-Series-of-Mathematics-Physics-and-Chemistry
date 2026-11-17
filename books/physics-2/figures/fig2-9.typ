// 图 2·9 铜和铁导热性能的比较（原书 p.41）
// 写实插画，沿用原扫描裁剪二值化（fig2-9.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-9.png 的像素坐标（1380×690）。
#import "/common/series.typ": *

#let fig-2-9(width: 10.76cm) = px-canvas(1380, 690, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-9.png", width: 1380 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(466, 336, [铜])
  lab(930, 330, [铁])
})
