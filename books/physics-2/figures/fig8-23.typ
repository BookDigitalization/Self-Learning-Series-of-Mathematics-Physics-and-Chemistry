// 图 8·23（原书 p.303）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-23.png（页坐标 220,165–830,380，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-23(width: 10cm) = px-canvas(610, 215, width: width, origin: (220, 165), (p, u) => {
  import cetz.draw: *
  content(p(220, 165), anchor: "north-west", image("fig8-23.png", width: 610 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(391, 181, [第一级汽缸])
  lab(515, 182, [第二级汽缸])
  lab(670, 181, [第三级汽缸])
})
