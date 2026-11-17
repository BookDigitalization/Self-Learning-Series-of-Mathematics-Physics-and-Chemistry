// 图 2·10 水是不善于导热的物质（原书 p.41）
// 写实插画，沿用原扫描裁剪二值化（fig2-10.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-10.png 的像素坐标（740×550）。
#import "/common/series.typ": *

#let fig-2-10(width: 5.77cm) = px-canvas(740, 550, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-10.png", width: 740 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(420, 238, [水])
  lab(680, 258, [蒸汽])
  lab(268, 522, [冰])
})
