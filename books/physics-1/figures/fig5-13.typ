// 图 5·13 竖直上抛运动（原书 p.148）
// 线条图，按原图重绘：两条竖线分别表示上升（A→B）和下落（B→C）的过程，旁边的箭头是速度，两侧的 g 是重力加速度。
// 坐标取自裁剪图（原页显示图 (1050,980) 起，×2.1314）的像素坐标，画布 747×1480。
// 原图右侧的 -v 标号扫描里的负号不清，按左侧同名速度加负号重绘，见待核对清单。
#import "/common/series.typ": *

#let fig-5-13(width: 3.4cm) = px-canvas(747, 1480, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 7pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.4)
  let up(x, y0, y1) = line(p(x, y0), p(x, y1), stroke: 1.2pt, mark: mk)
  // 两条竖线，顶部相连
  line(p(345, 1430), p(345, 110), stroke: 1.6pt)
  line(p(375, 1430), p(375, 110), stroke: 1.6pt)
  arc(p(345, 110), start: 180deg, stop: 0deg, radius: (15 * 1, 15), stroke: 1.6pt)
  for y in (540, 1080, 1430) {
    circle(p(345, y), radius: 7, stroke: none, fill: black)
    circle(p(375, y), radius: 7, stroke: none, fill: black)
  }
  // 速度箭头：左侧向上，右侧向下
  up(305, 555, 485); up(305, 1110, 1040); up(305, 1430, 1355)
  line(p(410, 485), p(410, 555), stroke: 1.2pt, mark: mk)
  line(p(410, 1045), p(410, 1115), stroke: 1.2pt, mark: mk)
  line(p(410, 1370), p(410, 1440), stroke: 1.2pt, mark: mk)
  lab(360, 45, $B$); lab(470, 48, $v = 0$)
  lab(240, 470, $v_n$); lab(525, 495, $-v_n$)
  lab(240, 1055, $v_1$); lab(510, 1000, $-v_1$)
  lab(240, 1340, $v_0$); lab(510, 1270, $-v_0$)
  // g
  line(p(100, 620), p(100, 810), stroke: 1.2pt, mark: mk)
  line(p(560, 620), p(560, 790), stroke: 1.2pt, mark: mk)
  lab(65, 800, $g$); lab(610, 800, $g$)
})
