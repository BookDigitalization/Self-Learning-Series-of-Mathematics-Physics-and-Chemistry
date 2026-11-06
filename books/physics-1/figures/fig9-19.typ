// 图 9·19（a）（b）（c）（d）（原书 p.255）
// （a）（b）是写实插画，位图已涂去字母 O'、O、F，用 CeTZ 补回；（c）（d）是立体线条图，整幅用 CeTZ 重绘。
// 坐标都是对应原 png 的像素坐标（y 向下）。
#import "/common/series.typ": *

#let _lab(p, x, y, body) = cetz.draw.content(p(x, y), anchor: "center", text(size: 9pt, body))
#let _head = (end: "stealth", fill: black, scale: 0.55)
#let _dd = (thickness: 0.8pt, dash: "dash-dotted")
#let _ds = (thickness: 0.7pt, dash: "dashed")

#let fig-9-19a(width: 5cm) = px-canvas(918, 1029, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-19a.png", width: 918 * u))
  _lab(p, 238, 92, $O'$); _lab(p, 212, 953, $O$); _lab(p, 888, 183, $F$)
})

#let fig-9-19b(width: 4.3cm) = px-canvas(768, 837, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-19b.png", width: 768 * u))
  _lab(p, 182, 92, $O'$); _lab(p, 175, 805, $O$); _lab(p, 725, 428, $F$)
})

// （c）推力 F 向前偏向上方：分解为 F₁（沿交线）与 F₂（竖直向上）
#let fig-9-19c(width: 4.4cm) = px-canvas(896, 1280, width: width, (p, u) => {
  import cetz.draw: *
  let th = 1.1pt
  // 水平面
  line(p(18, 528), p(638, 533), p(868, 893), p(245, 890), close: true, stroke: th)
  // 竖直面
  line(p(638, 533), p(638, 15), p(875, 355), p(870, 893), stroke: th)
  // 转轴
  line(p(432, 60), p(432, 660), stroke: _dd)
  line(p(432, 895), p(432, 1165), stroke: _dd)
  line(p(432, 660), p(722, 662), stroke: _ds)
  // 分力与合力
  line(p(727, 220), p(724, 520), stroke: _dd)
  line(p(724, 520), p(722, 662), stroke: _ds)
  line(p(727, 505), p(727, 446), stroke: th, mark: _head)
  line(p(727, 450), p(833, 610), stroke: _ds)
  line(p(833, 612), p(830, 840), stroke: _dd)
  line(p(722, 662), p(833, 610), stroke: th, mark: _head)
  line(p(722, 662), p(826, 822), stroke: th, mark: _head)
  circle(p(722, 662), radius: 3 * u, fill: black, stroke: none)
  _lab(p, 430, 38, $O'$); _lab(p, 428, 1192, $O$)
  _lab(p, 423, 697, $C$); _lab(p, 693, 700, $A$)
  _lab(p, 768, 402, $F_2$); _lab(p, 838, 545, $F$); _lab(p, 764, 840, $F_1$)
})

// （d）推力 F 向前偏向下方：分解为 F₁（沿交线）与 F₂（竖直向下）
#let fig-9-19d(width: 4.4cm) = px-canvas(875, 1397, width: width, (p, u) => {
  import cetz.draw: *
  let th = 1.1pt
  // 水平面
  line(p(20, 555), p(630, 573), p(855, 940), p(243, 925), close: true, stroke: th)
  // 竖直面（上半实线，下半虚线）
  line(p(632, 573), p(632, 20), p(862, 375), p(858, 940), stroke: th)
  line(p(635, 573), p(637, 1042), p(850, 1385), stroke: _ds)
  line(p(858, 940), p(850, 1385), stroke: _dd)
  // 转轴
  line(p(403, 200), p(403, 702), stroke: _dd)
  line(p(403, 940), p(403, 1195), stroke: _dd)
  line(p(403, 702), p(705, 703), stroke: _ds)
  line(p(708, 250), p(705, 703), stroke: 0.8pt)
  // 分力与合力
  line(p(705, 703), p(704, 950), stroke: _ds)
  line(p(704, 945), p(704, 1004), stroke: th, mark: _head)
  line(p(705, 703), p(773, 1050), stroke: _ds)
  line(p(771, 1045), p(773, 1108), stroke: th, mark: _head)
  line(p(705, 703), p(775, 822), stroke: th, mark: _head)
  line(p(775, 822), p(773, 1106), stroke: _dd)
  line(p(704, 1004), p(773, 1108), stroke: _ds)
  circle(p(705, 703), radius: 3 * u, fill: black, stroke: none)
  _lab(p, 410, 175, $O'$); _lab(p, 402, 1225, $O$)
  _lab(p, 372, 722, $C$); _lab(p, 750, 672, $A$)
  _lab(p, 795, 758, $F_1$); _lab(p, 678, 1010, $F_2$); _lab(p, 780, 1140, $F$)
})
