// 图 2·6 形成通风的实验（原书 p.37）
// 写实插画，沿用原扫描裁剪二值化（fig2-6.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-6.png 的像素坐标（720×930）。
#import "/common/series.typ": *

#let fig-2-6(width: 5.62cm) = px-canvas(720, 930, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-6.png", width: 720 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(580, 584, [烟])
})
