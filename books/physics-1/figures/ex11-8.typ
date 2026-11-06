// 习题 11·8 附图（原书 p.367–368）：第 4、6、7 题
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-ex-11-8-4(width: 7cm) = px-canvas(540, 330, origin: (870, 625), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  line(p(890, 926), p(1400, 926), stroke: 2.2pt)
  line(p(890, 925), p(1275, 690), stroke: 1pt)
  line(p(1282, 690), p(1282, 925), stroke: 1.2pt)
  circle(p(1270, 683), radius: 9 * u, stroke: 1pt)
  circle(p(1340, 683), radius: 9 * u, stroke: 1pt)
  line(p(1280, 683), p(1331, 683), stroke: dash)
  lab(1272, 650, text(font: fonts.hei, weight: "medium", [甲]))
  lab(1346, 650, text(font: fonts.hei, weight: "medium", [乙]))
  line(p(1350, 683), p(1400, 683), stroke: 0.8pt)
  line(p(1380, 780), p(1380, 683), stroke: 0.9pt, mark: arr)
  line(p(1380, 830), p(1380, 922), stroke: 0.9pt, mark: arr)
  lab(1380, 800, $h$)
  lab(972, 905, $alpha$)
})

#let fig-ex-11-8-6(width: 4.4cm) = px-canvas(290, 380, origin: (450, 1510), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash = (paint: black, thickness: 1.2pt, dash: "dashed")
  line(p(470, 1540), p(500, 1530), stroke: 1.5pt)
  for k in range(0, 5) {
    line(p(472 + k * 7, 1540 - k * 2.5), p(466 + k * 7, 1548 - k * 2.5), stroke: 0.5pt)
  }
  lab(535, 1530, $O$)
  line(p(498, 1535), p(498, 1850), stroke: dash)
  line(p(498, 1535), p(668, 1795), stroke: 1.5pt)
  circle(p(668, 1795), radius: 5 * u, fill: black, stroke: none)
  circle(p(498, 1845), radius: 5 * u, fill: black, stroke: none)
  lab(688, 1800, $A$)
  lab(500, 1868, $B$)
  lab(516, 1583, $alpha$)
})

#let fig-ex-11-8-7(width: 8.6cm) = px-canvas(560, 340, origin: (800, 1590), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  // 地面
  line(p(815, 1845), p(1340, 1845), stroke: 1pt)
  for k in range(0, 44) {
    let x = 820 + k * 12
    line(p(x + 9, 1845), p(x, 1857), stroke: 0.5pt)
  }
  // 斜坡
  line(p(840, 1612), p(905, 1762), stroke: 2pt)
  circle(p(838, 1608), radius: 4 * u, fill: black, stroke: none)
  line(p(825, 1762), p(905, 1762), stroke: dash)
  // 圆弧轨道
  let r = 148
  let pts = ()
  for k in range(0, 25) {
    let phi = -0.86 + k * (0.86 + 0.82) / 24
    pts.push((1030 + r * calc.sin(phi), 1695 + r * calc.cos(phi)))
  }
  line(..pts.map(q => p(..q)), stroke: 1.2pt)
  line(p(1030, 1695), p(1030, 1845), stroke: 1pt)
  line(p(1030, 1695), p(905, 1768), stroke: dash)
  // 抛物线
  catmull(..((1148, 1770), (1190, 1732), (1245, 1715), (1275, 1765), (1272, 1845)).map(q => p(..q)), stroke: dash, tension: 0.5)
  line(p(1160, 1752), p(1190, 1702), stroke: 0.9pt, mark: arr)
  lab(1198, 1688, $v_1$)
  lab(815, 1608, $A$)
  lab(850, 1690, $L$)
  lab(900, 1776, $R$)
  lab(975, 1740, $R$)
  lab(1040, 1672, $O$)
  lab(1003, 1727, $alpha$)
  lab(1135, 1755, $D$)
  lab(1030, 1866, $C$)
  lab(1272, 1866, $E$)
})
