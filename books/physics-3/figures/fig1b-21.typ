// 图 1·21 电场力的功（原书 p.39）。CeTZ 重绘；坐标取自 150 dpi 页面图（原点 (640,1065)）。
#import "fig1b-lib.typ": *

#let fig-1-21(width: 7.5cm) = px-canvas(430, 280, origin: (640, 1065), width: width, (p, u) => {
  import cetz.draw: *
  // 上下极板
  hatch(p, 645, 1075, 1062, 1115, d: 9)
  hatch(p, 645, 1297, 1062, 1335, d: 9)
  rect(p(842, 1083), p(872, 1107), stroke: none, fill: white)
  lab(p, 857, 1095, [$+$], size: 11pt)
  rect(p(842, 1305), p(872, 1327), stroke: none, fill: white)
  lab(p, 857, 1316, [$-$], size: 11pt)
  // 电力线（向下）
  for i in range(13) {
    let x = 663 + 32 * i
    arr(p, (x, 1115), (x, 1297), w: 0.6pt, s: 0.4)
  }
  // 路径：P→M、P→L、P→N、L–N
  line(p(770, 1252), p(940, 1252), stroke: th)
  arr(p, (770, 1135), (940, 1135), w: 1pt)
  arr(p, (770, 1135), (770, 1252), w: 1.6pt)
  arr(p, (770, 1135), (940, 1252), w: 1.6pt)
  circle(p(770, 1135), radius: 3 * u, fill: white, stroke: 0.6pt)
  lab(p, 752, 1135, [$P$])
  lab(p, 953, 1133, [$M$])
  lab(p, 752, 1252, [$L$])
  lab(p, 955, 1256, [$N$])
  lab(p, 784, 1165, [$theta$], size: 8pt)
  lab(p, 990, 1195, [$E$], fill: white)
})
