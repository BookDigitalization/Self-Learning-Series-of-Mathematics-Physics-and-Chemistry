// 图 9·29（原书 p.263）例 8 的圆板。CeTZ 重绘（示意）：6 个同心圆，圆上的小钉位置按原图大致描出；
// 三根绳分别与第 4、第 2、第 6 个圆相切。坐标取自页面显示图，原点 (800,220)。
#import "/common/series.typ": *

#let fig-9-29(width: 9cm) = px-canvas(600, 460, origin: (800, 220), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let o = (1005, 415)
  for k in range(1, 7) {
    circle(p(..o), radius: 29 * k * u, stroke: 0.7pt)
  }
  // 小钉
  for k in range(1, 7) {
    let n = 4 + 2 * k
    for i in range(0, n) {
      let a = 360deg * i / n
      circle(p(o.at(0) + 29 * k * calc.cos(a), o.at(1) - 29 * k * calc.sin(a)), radius: 3.5 * u, fill: black, stroke: none)
    }
  }
  // 绳 F1：切于第 4 圈，绕过滑轮
  line(p(1005, 297), p(1300, 309), stroke: 1.2pt)
  circle(p(1300, 325), radius: 15 * u, stroke: 1pt, fill: white)
  line(p(1315, 325), p(1318, 378), stroke: 1.2pt)
  rect(p(1306, 378), p(1340, 390), stroke: 1pt, fill: luma(200))
  // 绳 F2：切于第 2 圈
  line(p(900, 313), p(1262, 448), stroke: 1.2pt)
  circle(p(1262, 462), radius: 15 * u, stroke: 1pt, fill: white)
  line(p(1277, 464), p(1290, 580), stroke: 1.2pt)
  for k in range(0, 4) {
    rect(p(1275, 580 + k * 16), p(1308, 592 + k * 16), stroke: 1pt, fill: luma(200))
  }
  // 绳 F3：切于第 6 圈
  line(p(831, 415), p(838, 603), stroke: 1.2pt)
  for k in range(0, 2) {
    rect(p(824, 603 + k * 16), p(860, 615 + k * 16), stroke: 1pt, fill: luma(200))
  }
  lab(1022, 410, $O$); lab(1360, 388, $F_1$); lab(1328, 640, $F_2$); lab(880, 640, $F_3$)
})
