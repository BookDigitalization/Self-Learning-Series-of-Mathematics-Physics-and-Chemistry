// 图 1·3 在液体层之间有吸引力
// 写实插画，沿用原扫描裁剪（已涂去图中文字），文字用 CeTZ 补回。
// 坐标是 fig1-3.png 的像素坐标（520×830，400 dpi 裁剪）；来源页 原书 p.11。
#import "/common/series.typ": *

#let fig-1-3(width: 3.7cm) = px-canvas(520, 830, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-3.png", width: 520 * u))
  let lab(x, y, body, angle: 0deg) = content(p(x, y), anchor: "center", angle: angle, text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(416, 624, [玻璃])
  lab(254, 762, [水])
})
