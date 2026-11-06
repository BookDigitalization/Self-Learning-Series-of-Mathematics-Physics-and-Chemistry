// 复习题 10 第 7 题附图（原书 p.328）：两只轮轴通过过桥齿轮相联
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-rev-10-7(width: 6.4cm) = px-canvas(460, 520, origin: (590, 395), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  // 第一轮轴
  circle(p(730, 496), radius: 95 * u, stroke: 1.2pt)
  circle(p(730, 497), radius: 42 * u, stroke: 1.2pt)
  line(p(730, 497), p(657, 440), stroke: 0.8pt, mark: arr)
  line(p(730, 497), p(752, 459), stroke: 0.8pt, mark: arr)
  lab(693, 438, $R_1$); lab(762, 447, $R_2$)
  // 过桥齿轮
  circle(p(843, 492), radius: 70 * u, stroke: 1.2pt)
  line(p(843, 492), p(878, 437), stroke: 0.8pt, mark: arr)
  lab(881, 482, $R_3$)
  // 第二轮轴
  circle(p(972, 490), radius: 62 * u, stroke: 1.2pt)
  circle(p(972, 490), radius: 33 * u, stroke: 1.2pt)
  line(p(972, 490), p(996, 497), stroke: 0.8pt, mark: arr)
  lab(927, 428, $R_4$); lab(1003, 509, $R_5$)
  // 动力 F 和重物
  line(p(636, 496), p(638, 640), stroke: 1pt)
  line(p(626, 610), p(638, 640), stroke: 1pt, mark: arr)
  lab(614, 622, $F$)
  line(p(943, 540), p(950, 790), stroke: 1pt)
  line(p(1033, 520), p(1030, 790), stroke: 1pt)
  circle(p(990, 792), radius: 38 * u, stroke: 1.2pt)
  line(p(990, 792), p(990, 876), stroke: 1pt)
  rect(p(968, 876), p(1013, 908), stroke: 1pt)
  lab(991, 892, $G$)
})
