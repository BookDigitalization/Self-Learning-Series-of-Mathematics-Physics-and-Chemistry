// 图 8·4（原书 p.287）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-4.png（页坐标 640,855–905,1290，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-4(width: 10cm) = px-canvas(265, 435, width: width, origin: (640, 855), (p, u) => {
  import cetz.draw: *
  content(p(640, 855), anchor: "north-west", image("fig8-4.png", width: 265 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))

})
