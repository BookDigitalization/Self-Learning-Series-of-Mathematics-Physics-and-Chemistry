// 图 14·3（原书 p.479）扭秤的几何关系：圆为小球转动轨迹，O 为圆心，l 为半径。
// 线条图，按原图重绘。坐标取 200 dpi 页面图的“显示图”像素（宽 1568）。
// 原图中力 F 的小箭头、A′B 之间的短线用虚线箭头表示；θ、θ₀ 弧用圆弧近似。
#import "/common/series.typ": *

#let fig-14-3(width: 6.4cm) = px-canvas(440, 420, origin: (900, 350), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  let O = (1127, 562)
  circle(p(..O), radius: 195, stroke: 1.6pt)
  // 水平直径 AA
  line(p(932, 562), p(1322, 562), stroke: 0.9pt)
  // 上侧：B、A′、A
  let B1 = (1272, 431)
  let A1 = (1310, 490)
  line(p(..O), p(..B1), stroke: (thickness: 0.8pt, dash: "dash-dotted"))
  line(p(..O), p(..A1), stroke: (thickness: 0.8pt, dash: "dashed"))
  line(p(..A1), p(..B1), stroke: (thickness: 0.8pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.4))
  circle(p(..B1), radius: 11, fill: black, stroke: none)
  // 下侧：B、A′
  let B2 = (985, 693)
  let A2 = (944, 632)
  line(p(..O), p(..B2), stroke: (thickness: 0.8pt, dash: "dash-dotted"))
  line(p(..O), p(..A2), stroke: (thickness: 0.8pt, dash: "dashed"))
  line(p(..A2), p(..B2), stroke: (thickness: 0.8pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.4))
  circle(p(..B2), radius: 14, fill: black, stroke: none)
  // 半径 l
  line(p(..O), p(1297, 665), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 角度弧
  arc(p(1127 + 70, 562), start: 0deg, stop: 31deg, radius: 70, stroke: 0.6pt)
  arc(p(1127 + 100, 562), start: 0deg, stop: 34deg, radius: 100, stroke: 0.6pt)
  // 标注
  lab(1113, 540, $O$)
  lab(1301, 408, $B$)
  lab(1333, 487, $A'$)
  lab(1346, 562, $A$)
  lab(912, 562, $A$)
  lab(922, 634, $A'$)
  lab(958, 718, $B$)
  lab(1274, 477, $F$)
  lab(982, 641, $F$)
  lab(1203, 517, $theta_0$)
  lab(1240, 543, $theta$)
  lab(1014, 583, $theta$)
  lab(1050, 610, $theta_0$)
  lab(1188, 628, $l$)
})
