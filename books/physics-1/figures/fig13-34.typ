// 图 13·34 飞轮上的一部分沿切线飞出（原书 p.457）
// 示意图，按原图重绘：飞轮（圆，心 O，半径 R），转动角速度 ω，轮缘上质量为 m 的部分，速度 v 沿切线。
// 原图中 ω、v 的字母较模糊，按正文意思录。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-34(width: 6cm) = px-canvas(360, 330, origin: (1000, 520), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  circle(p(1160, 683), radius: 146 * u, stroke: 1.5pt)
  line(p(1160, 683), p(1285, 683), stroke: 1.2pt, mark: arr)
  arc(p(1160 + 80 * calc.cos(-40deg), 683 - 80 * calc.sin(-40deg)), start: -40deg, stop: 55deg, radius: 80 * u,
    stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(1297, 682), p(1300, 545), stroke: 1.6pt, mark: arr)
  line(p(1297, 682), p(1300, 765), stroke: 1.2pt)
  rect(p(1282, 664), p(1306, 702), fill: luma(80), stroke: none)
  lab(1143, 690, $O$)
  lab(1195, 660, $R$)
  lab(1200, 597, $omega$)
  lab(1335, 685, $m$)
  lab(1312, 535, $v$)
})
