// 图 8·2（原书 p.286）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-2.png（页坐标 270,440–810,650，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-2(width: 10cm) = px-canvas(540, 210, width: width, origin: (270, 440), (p, u) => {
  import cetz.draw: *
  content(p(270, 440), anchor: "north-west", image("fig8-2.png", width: 540 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))

})
