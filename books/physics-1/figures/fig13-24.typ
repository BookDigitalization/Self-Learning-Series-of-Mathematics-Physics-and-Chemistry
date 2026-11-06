// 图 13·24 向心加速度的推导（原书 p.442）
// 示意图，按原图重绘：圆（心 O，半径 R），A、B 两点，速度 v_1（A 点）、v_2（B 点）；v_2 平移到 A 点，
// 速度三角形（v_1、v_2、Δv）；角 Δθ。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
// 原图上 A→C 的小箭头（Δv 平移到 A）及虚线的含义按几何关系推测：C = A + Δv，虚线为 −v_1。
#import "/common/series.typ": *

#let fig-13-24(width: 8.8cm) = px-canvas(580, 690, origin: (330, 1180), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.9pt, dash: "dashed")
  let o = (612, 1545)
  let A = (428, 1328)
  let B = (620, 1250)
  circle(p(..o), radius: 277 * u, stroke: 1.4pt)
  // 半径、弦
  line(p(..A), p(..o), stroke: 1.4pt)
  line(p(..B), p(..o), stroke: 1.8pt)
  line(p(..A), p(..B), stroke: 1.4pt)
  // v_1（A 点）、v_2（B 点）
  line(p(..A), p(553, 1197), stroke: 1.6pt, mark: arr)
  line(p(..B), p(785, 1248), stroke: 1.6pt, mark: arr)
  // v_2 平移到 A、Δv
  line(p(..A), p(597, 1316), stroke: dsh, mark: arr)
  line(p(553, 1197), p(597, 1316), stroke: 1.6pt, mark: arr)
  // Δv 平移到 A（至 C）和虚线
  line(p(..A), p(471, 1470), stroke: 1.6pt, mark: arr)
  line(p(597, 1316), p(471, 1470), stroke: dsh)
  lab(462, 1485, $C$)
  // 角
  arc(p(428 + 30, 1328 - 4), start: 0deg, stop: 28deg, radius: 30 * u, stroke: 0.7pt)
  arc(p(612, 1545 - 90), start: 90deg, stop: 130deg, radius: 90 * u, stroke: 0.7pt)
  lab(408, 1328, $A$)
  lab(632, 1232, $B$)
  lab(612, 1565, $O$)
  lab(636, 1392, $R$)
  lab(490, 1223, $bold(v)_1$)
  lab(730, 1228, $bold(v)_2$)
  lab(520, 1345, $bold(v)_2$)
  lab(595, 1222, $Delta bold(v)$)
  lab(420, 1400, $Delta bold(v)$)
  lab(490, 1400, $Delta theta$)
  lab(590, 1465, $Delta theta$)
})
