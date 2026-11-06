// 图 3·26 浮力的产生（原书 p.69）
// 线条图，按原图重绘：左边是水中的圆筒和浸没的正立方体（上表面 AB 受向下压力 P，下表面 CD 受向上压力 Q，左右两侧压力相抵），
// 右边是把这个正立方体单独画出来的受力图。原图中水里的小点和圆筒的细部没有逐笔描。
// 坐标取自原页 200 dpi 预览图在看图工具里的显示坐标；画布原点为显示图 (390,1415)，宽 480、高 280。
#import "/common/series.typ": *

#let fig-3-26(width: 8cm) = px-canvas(480, 280, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 390, y - 1415)
  let t(x, y, body, sz: 9pt) = content(q(x, y), anchor: "center", text(size: sz, body))
  let ah = (end: "stealth", fill: black, scale: 0.45)
  let ln(a, b, ..args) = line(q(..a), q(..b), ..args)
  // 立方体：前面左上角 (x, y)，边长 s，后移 (dx, -dy)
  let cube(x, y, s, d) = {
    rect(q(x, y), q(x + s, y + s), stroke: 0.9pt)
    ln((x, y), (x + d, y - d), stroke: 0.9pt)
    ln((x + s, y), (x + s + d, y - d), stroke: 0.9pt)
    ln((x + s, y + s), (x + s + d, y + s - d), stroke: 0.9pt)
    ln((x + d, y - d), (x + s + d, y - d), stroke: 0.9pt)
    ln((x + s + d, y - d), (x + s + d, y + s - d), stroke: 0.9pt)
  }
  // 圆筒
  ln((402, 1430), (402, 1715), stroke: 1pt)
  ln((592, 1430), (592, 1715), stroke: 1pt)
  circle(q(497, 1430), radius: (95 * u, 22 * u), stroke: 1pt)
  line(..range(0, 37).map(k => q(497 + 95 * calc.cos(k * 5deg), 1715 + 22 * calc.sin(k * 5deg))), stroke: 1pt)
  // 左边的立方体及其受力
  cube(452, 1520, 75, 18)
  ln((517, 1458), (517, 1505), mark: ah, stroke: 0.8pt)
  ln((512, 1650), (512, 1602), mark: ah, stroke: 0.8pt)
  ln((420, 1565), (450, 1565), mark: ah, stroke: 0.8pt)
  ln((590, 1570), (546, 1570), mark: ah, stroke: 0.8pt)
  t(517, 1442, $P$)
  t(525, 1660, $Q$)
  t(440, 1500, $A$)
  t(560, 1498, $B$)
  t(437, 1590, $C$)
  t(548, 1612, $D$)
  // 水平虚线：把立方体上、下表面引到右图
  ln((548, 1520), (710, 1520), stroke: (thickness: 0.6pt, dash: "dashed"))
  ln((548, 1608), (710, 1608), stroke: (thickness: 0.6pt, dash: "dashed"))
  // 右边的立方体受力图
  cube(712, 1525, 62, 20)
  ln((767, 1455), (767, 1500), mark: ah, stroke: 0.8pt)
  ln((752, 1650), (752, 1595), mark: ah, stroke: 0.8pt)
  ln((665, 1560), (710, 1560), mark: ah, stroke: 0.8pt)
  ln((848, 1550), (800, 1550), mark: ah, stroke: 0.8pt)
  t(767, 1442, $P$)
  t(768, 1633, $Q$)
})
