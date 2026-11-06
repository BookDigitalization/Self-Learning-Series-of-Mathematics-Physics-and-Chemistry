// 图 11·22 不同坡度的斜面、图 11·23 沿任意曲线运动重力的功（原书 p.358）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 11·23 曲线上各点按原图位置取点，曲线用平滑样条重绘；最下面一个标注的字母扫描不清，暂作 A_n（见待核对清单）。
#import "/common/series.typ": *

#let fig-11-22(width: 8cm) = px-canvas(540, 340, origin: (320, 160), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(350, 470), p(822, 475), stroke: 1pt)
  line(p(822, 190), p(822, 475), stroke: 2pt)
  line(p(822, 190), p(350, 470), stroke: 1pt)
  line(p(822, 190), p(500, 472), stroke: 1pt)
  line(p(822, 190), p(595, 473), stroke: 1pt)
  lab(838, 175, $A$)
  lab(838, 335, $h$)
  lab(822, 498, $B_0$)
  lab(595, 498, $B_1$)
  lab(495, 497, $B_2$)
  lab(348, 498, $B_3$)
})

#let fig-11-23(width: 8cm) = px-canvas(520, 440, origin: (860, 110), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let st = (end: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.7pt, dash: "dashed")
  // 地面
  line(p(870, 500), p(1358, 500), stroke: 1pt)
  for k in range(0, 40) {
    let x = 875 + k * 12
    line(p(x + 9, 500), p(x, 512), stroke: 0.5pt)
  }
  // 竖直线与曲线
  line(p(1318, 150), p(1318, 497), stroke: 2pt)
  line(p(890, 500), p(935, 428), stroke: 1pt)
  let pts = ((935, 428), (965, 372), (1005, 322), (1065, 262), (1118, 222), (1170, 190), (1245, 154))
  catmull(..pts.map(q => p(..q)), stroke: 1pt, tension: 0.5)
  line(p(1245, 154), p(1316, 150), stroke: dash)
  // 虚线台阶
  line(p(1170, 190), p(1245, 190), stroke: dash)
  line(p(1245, 154), p(1245, 190), stroke: dash)
  line(p(1118, 222), p(1170, 222), stroke: dash)
  line(p(1170, 190), p(1170, 222), stroke: dash)
  line(p(1065, 262), p(1118, 262), stroke: dash)
  line(p(1118, 222), p(1118, 262), stroke: dash)
  line(p(965, 372), p(965, 428), stroke: dash)
  line(p(965, 428), p(1205, 428), stroke: dash)
  // h₂
  line(p(1200, 450), p(1200, 428), stroke: 0.8pt, mark: st)
  line(p(1200, 470), p(1200, 498), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  lab(1203, 460, $h_2$)
  lab(1320, 330, $h_1$)
  lab(1250, 135, $A_0$)
  lab(1155, 168, $A_1$)
  lab(1103, 208, $A_2$)
  lab(1045, 245, $A_3$)
  lab(995, 290, $A_n$)
  lab(908, 418, $B$)
  lab(1270, 188, $h_(01)$)
  lab(1197, 228, $h_(12)$)
  lab(1143, 266, $h_(23)$)
  lab(990, 405, $h_(B n)$)
})
