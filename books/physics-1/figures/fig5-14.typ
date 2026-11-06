// 图 5·14 竖直上抛运动中的速度、加速度和位移（原书 p.150）
// 线条图，按原图重绘。坐标取自裁剪图（原页显示图 (300,335) 起，×2.1314）的像素坐标，画布 981×1418。
// 原图中 v 与 0 之间的符号（=、>、<）在扫描里不清，按图意取：最高点 v = 0，上升 v > 0，下降 v < 0，见待核对清单。
#import "/common/series.typ": *

#let fig-5-14(width: 4.2cm) = px-canvas(981, 1418, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 7.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.4)
  let arr(x, y0, y1) = line(p(x, y0), p(x, y1), stroke: 1.2pt, mark: mk)
  // 两条竖线，顶部相连
  line(p(280, 845), p(280, 70), stroke: 1.6pt)
  line(p(318, 1360), p(318, 70), stroke: 1.6pt)
  arc(p(280, 70), start: 180deg, stop: 0deg, radius: (19, 19), stroke: 1.6pt)
  for (x, y, hollow) in ((283, 240, false), (318, 240, false), (283, 520, true), (322, 520, false), (287, 845, true), (322, 845, false), (330, 1115, false)) {
    circle(p(x, y), radius: 8, stroke: 0.8pt, fill: if hollow { white } else { black })
  }
  // 起点水平虚线
  line(p(30, 845), p(215, 845), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(390, 845), p(870, 845), stroke: (thickness: 1pt, dash: "dashed"))
  // 速度箭头：左侧向上，右侧向下
  arr(245, 235, 170); arr(238, 510, 450); arr(232, 845, 705)
  arr(360, 165, 240); arr(368, 435, 535); arr(365, 700, 845); arr(370, 1125, 1380)
  // 加速度 a = -g
  arr(45, 590, 775); arr(610, 590, 775)
  lab(150, 610, $a = -g$); lab(500, 590, $a = -g$)
  // 位移 S
  arr(725, 845, 615); arr(725, 845, 1070)
  lab(810, 635, $S > 0$); lab(810, 1050, $S < 0$)
  // 速度标注
  lab(395, 48, $v = 0$); lab(175, 270, $v > 0$); lab(455, 255, $v < 0$)
})
