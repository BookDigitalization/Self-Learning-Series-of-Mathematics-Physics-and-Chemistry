// 习题 13·2 附图（原书 p.426–427）：第 5 题（桌上小球相碰后平抛）、第 6 题（四分之一圆弧槽）
// 线条图，按原图重绘；坐标是页面显示图（宽 1568）上的像素坐标，位置为目测。
#import "/common/series.typ": *

#let fig-ex-13-2-5(width: 6.4cm) = px-canvas(540, 260, origin: (375, 1455), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  // 地面
  line(p(385, 1695), p(895, 1695), stroke: 1pt)
  for k in range(0, 26) {
    let x = 392 + k * 20
    line(p(x, 1696), p(x - 8, 1706), stroke: 0.5pt)
  }
  // 桌面与桌腿
  rect(p(385, 1543), p(593, 1558), stroke: 1pt)
  line(p(543, 1558), p(543, 1695), stroke: 1pt)
  line(p(560, 1558), p(560, 1695), stroke: 1pt)
  // 两个小球
  circle(p(408, 1527), radius: 14 * u, stroke: 1pt)
  circle(p(568, 1527), radius: 14 * u, stroke: 1pt)
  // 速度
  line(p(385, 1480), p(435, 1480), stroke: 0.9pt, mark: arr)
  content(p(410, 1467), anchor: "center", text(size: 9pt, $v$))
  // 轨迹与落地的球
  let tr(x) = 1530 + 150 * calc.pow((x - 590) / 268, 2)
  line(..range(0, 28).map(k => { let x = 590 + k * 10; p(x, tr(x)) }), stroke: (thickness: 0.9pt, dash: "dashed"))
  circle(p(858, 1680), radius: 14 * u, stroke: 1pt, fill: luma(190))
})

#let fig-ex-13-2-6(width: 7.6cm) = px-canvas(560, 300, origin: (640, 225), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 地面
  line(p(655, 485), p(1185, 485), stroke: 1pt)
  for k in range(0, 27) {
    let x = 662 + k * 20
    line(p(x, 486), p(x - 8, 497), stroke: 0.5pt)
  }
  // 圆槽：四分之一圆弧 A→B，再接光滑曲线到 D
  let pts = range(0, 10).map(k => {
    let t = 180 - k * 10
    (868 + 146 * calc.cos(t * 1deg), 243 + 146 * calc.sin(t * 1deg))
  })
  line(..pts.map(a => p(..a)), stroke: 1.6pt)
  catmull(p(868, 389), p(960, 394), p(1050, 420), p(1110, 456), p(1130, 472), tension: 0.5, stroke: 1.6pt)
  // 圆心与半径
  line(p(868, 243), p(750, 335), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  circle(p(722, 255), radius: 6 * u, fill: black, stroke: none)
  circle(p(1128, 470), radius: 8 * u, stroke: 1pt)
  // h
  line(p(865, 392), p(865, 485), stroke: (thickness: 0.8pt, dash: "dashed"))
  lab(697, 256, $A$)
  lab(870, 241, $O$)
  lab(822, 300, $R$)
  lab(850, 408, $B$)
  lab(880, 437, $h$)
  lab(865, 510, $C$)
  lab(1128, 510, $D$)
})
