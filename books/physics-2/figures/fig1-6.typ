// 图 1·6 观察布朗运动的装置的示意图（左）；右面是在显微镜里看到的运动中的微粒
// 写实插画，沿用原扫描裁剪（已涂去图中文字），文字用 CeTZ 补回。
// 坐标是 fig1-6.png 的像素坐标（860×430，400 dpi 裁剪）；来源页 原书 p.17。
#import "/common/series.typ": *

#let fig-1-6(width: 6.2cm) = px-canvas(860, 430, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-6.png", width: 860 * u))
  let lab(x, y, body, angle: 0deg) = content(p(x, y), anchor: "center", angle: angle, text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(346, 28, [显微镜物镜])
  lab(352, 200, [盖玻璃])
  lab(90, 386, [载物玻璃])
  lab(332, 380, [悬浊液])
  lab(668, 396, [经过放大后的悬浊液])
})
