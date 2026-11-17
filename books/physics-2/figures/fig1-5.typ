// 图 1·5 液体的扩散现象
// 写实插画，沿用原扫描裁剪（已涂去图中文字），文字用 CeTZ 补回。
// 坐标是 fig1-5.png 的像素坐标（530×800，400 dpi 裁剪）；来源页 原书 p.15。
#import "/common/series.typ": *

#let fig-1-5(width: 3.7cm) = px-canvas(530, 800, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-5.png", width: 530 * u))
  let lab(x, y, body, angle: 0deg) = content(p(x, y), anchor: "center", angle: angle, text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(40, 216, [水], angle: -90deg)
  lab(38, 584, [硫酸铜溶液], angle: -90deg)
  lab(324, 420, [硫酸铜和水的均匀混合物], angle: -90deg)
})
