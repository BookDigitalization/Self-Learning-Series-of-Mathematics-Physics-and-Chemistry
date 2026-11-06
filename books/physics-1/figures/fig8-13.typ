// 图 8·13 把甲、乙两物体看成一个整体（原书 p.225）
// 线条图，用 CeTZ 按原图重绘。坐标是原页显示图坐标（x-580, y-110），y 向下。
#import "/common/series.typ": *

#let fig-8-13(width: 9cm) = px-canvas(570, 150, width: width, origin: (580, 110), (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 7.5pt, weight: "medium", body))
  rect(p(683, 148), p(750, 200), stroke: 0.9pt)
  rect(p(932, 147), p(1003, 200), stroke: 0.9pt)
  line(p(750, 174), p(932, 174), stroke: 0.6pt)
  line(p(683, 174), p(598, 174), stroke: 1.5pt, mark: arr)
  line(p(1003, 174), p(1128, 174), stroke: 1.5pt, mark: arr)
  m(718, 174, $m_2$)
  m(967, 173, $m_1$)
  m(625, 150, $m_2 g$)
  m(1097, 148, $m_1 g$)
  lab(718, 128, [乙])
  lab(965, 125, [甲])
  line(p(685, 223), p(760, 223), stroke: 0.8pt, mark: arr)
  line(p(940, 223), p(1010, 223), stroke: 0.8pt, mark: arr)
  m(714, 241, $a$)
  m(972, 241, $a$)
})
