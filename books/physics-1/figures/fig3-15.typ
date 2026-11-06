// 图 3·15 连通器里水面相平的说明（原书 p.60）
// 线条图，按原图重绘：U 形管，两管液面高度 h₁、h₂，底部取一小块薄片 AB。
// 坐标取自原页（200 dpi 预览图在看图工具里的显示坐标）：画布原点为显示图 (310,1465)，宽 400、高 470；
// 只求图形相近，管壁粗细、液体里的横短线（表示水）没有逐笔描。
#import "/common/series.typ": *

#let fig-3-15(width: 5cm) = px-canvas(400, 470, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 310, y - 1465)
  let st = 1pt
  let cx = 500
  let cy = 1795
  // 外管壁
  line(q(402, 1475), q(402, cy), stroke: 1.3pt)
  line(q(598, 1475), q(598, cy), stroke: 1.3pt)
  let ucurve(r, sw) = line(..range(0, 37).map(k => {
    let a = k * 5deg
    q(cx - r * calc.cos(a), cy + r * calc.sin(a))
  }), stroke: sw)
  ucurve(98, 1.3pt)
  ucurve(61, 0.9pt)
  // 内管壁
  line(q(440, 1475), q(440, cy), stroke: 0.9pt)
  line(q(562, 1475), q(562, cy), stroke: 0.9pt)
  // 两条水平虚线：液面和底部
  line(q(320, 1500), q(670, 1500), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(q(320, 1893), q(680, 1893), stroke: (thickness: 0.6pt, dash: "dashed"))
  // h₁、h₂ 箭头
  line(q(350, 1500), q(350, 1893), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5))
  line(q(648, 1500), q(648, 1893), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5))
  content(q(343, 1635), anchor: "center", text(size: 8.5pt, $h_1$))
  content(q(646, 1635), anchor: "center", text(size: 8.5pt, $h_2$))
  // 薄片 AB
  line(q(497, 1868), q(497, 1905), stroke: 1.1pt)
  content(q(515, 1862), anchor: "center", text(size: 9pt, $A$))
  content(q(488, 1912), anchor: "center", text(size: 9pt, $B$))
})
