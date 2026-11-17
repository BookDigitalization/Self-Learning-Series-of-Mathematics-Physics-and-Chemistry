// 图 1·1 水和酒精混合时总的体积减小
// 写实插画，沿用原扫描裁剪（已涂去图中文字），文字用 CeTZ 补回。
// 坐标是 fig1-1.png 的像素坐标（460×940，400 dpi 裁剪）；来源页 原书 p.8。
#import "/common/series.typ": *

#let fig-1-1(width: 3.2cm) = px-canvas(460, 940, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-1.png", width: 460 * u))
  let lab(x, y, body, angle: 0deg) = content(p(x, y), anchor: "center", angle: angle, text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(48, 272, [酒精], angle: -90deg)
  lab(50, 686, [水])
  lab(276, 496, [水和酒精的混合物], angle: -90deg)
})
