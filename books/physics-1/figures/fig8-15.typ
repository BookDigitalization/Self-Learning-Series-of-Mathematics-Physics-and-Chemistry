// 图 8·15 人的受力图（原书 p.225）
// 线条图，用 CeTZ 按原图重绘：左为电梯上升时（托力 N_1 大于 mg），右为下降时（托力 N_2 小于 mg）。
// 右图的托力记号扫描里像 N_2（下标模糊），按正文“N_2”录。坐标是原页显示图坐标（x-940, y-1560），y 向下。
#import "/common/series.typ": *

#let fig-8-15(width: 7.5cm) = px-canvas(400, 290, width: width, origin: (940, 1560), (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // 左
  line(p(967, 1718), p(967, 1580), stroke: 1.5pt, mark: arr)
  line(p(967, 1718), p(967, 1822), stroke: 1.5pt, mark: arr)
  circle(p(967, 1718), radius: 3.5 * u, fill: black, stroke: none)
  m(998, 1600, $N_1$)
  m(996, 1717, $m$)
  m(1003, 1803, $m g$)
  // 右
  line(p(1235, 1700), p(1235, 1640), stroke: 1.5pt, mark: arr)
  line(p(1235, 1700), p(1235, 1818), stroke: 1.5pt, mark: arr)
  circle(p(1235, 1700), radius: 3.5 * u, fill: black, stroke: none)
  m(1268, 1652, $N_2$)
  m(1263, 1703, $m$)
  m(1274, 1803, $m g$)
})
