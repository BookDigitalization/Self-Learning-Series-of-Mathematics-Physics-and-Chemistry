// 图 10·2 动滑轮举重物的功（原书 p.297）
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-2(width: 6.2cm) = px-canvas(460, 680, origin: (960, 140), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let hatch(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: 0.8pt)
    for x in range(x0, x1, step: 10) { line(p(x, y), p(x + 8, y - 8), stroke: 0.5pt) }
  }
  // 位置 I
  hatch(980, 1030, 188)
  lab(1045, 178, $I$)
  line(p(997, 190), p(997, 468), stroke: 1pt)
  circle(p(1063, 468), radius: 67 * u, stroke: 1pt)
  line(p(1063, 468), p(1063, 560), stroke: 1pt)
  rect(p(1023, 560), p(1097, 610), stroke: 1pt)
  line(p(1063, 610), p(1063, 755), stroke: 1pt, mark: arr)
  lab(1083, 712, $G$)
  circle(p(1130, 460), radius: 2.5 * u, fill: black, stroke: none)
  line(p(1130, 460), p(1130, 375), stroke: 1pt, mark: arr)
  lab(1152, 375, $F$)
  line(p(1097, 610), p(1172, 610), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(1150, 545), p(1172, 545), stroke: 0.6pt)
  line(p(1162, 575), p(1162, 546), stroke: 0.6pt, mark: arr)
  line(p(1162, 580), p(1162, 609), stroke: 0.6pt, mark: arr)
  lab(1188, 578, $L_1$)
  // 位置 II
  hatch(1170, 1220, 188)
  lab(1240, 178, $I I$)
  line(p(1197, 190), p(1197, 400), stroke: 1pt)
  circle(p(1263, 400), radius: 66 * u, stroke: 1pt)
  line(p(1263, 466), p(1263, 484), stroke: 1pt)
  rect(p(1226, 484), p(1300, 540), stroke: 1pt)
  line(p(1263, 540), p(1263, 690), stroke: 1pt, mark: arr)
  lab(1288, 665, $G$)
  circle(p(1328, 327), radius: 2.5 * u, fill: black, stroke: none)
  line(p(1328, 327), p(1328, 238), stroke: 1pt, mark: arr)
  lab(1350, 245, $F$)
  line(p(1130, 463), p(1397, 463), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(1335, 327), p(1397, 327), stroke: 0.6pt)
  line(p(1386, 385), p(1386, 328), stroke: 0.6pt, mark: arr)
  line(p(1386, 405), p(1386, 462), stroke: 0.6pt, mark: arr)
  lab(1384, 396, $L_2$)
})
