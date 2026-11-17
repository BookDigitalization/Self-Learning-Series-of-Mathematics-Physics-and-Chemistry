// 图 6·36 硅晶体点阵；来源 原书 p.336，坐标取自 200 dpi 页面像素（1671×2500）。
// 每个“+4”圆圈是一个硅原子（带 4 个价电子），四条斜线各带一个黑点表示价键中的电子。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-36(width: 6.4cm) = px-canvas(690, 720, origin: (180, 850), width: width, (p, u) => {
  import cetz.draw: *
  let atoms = (
    (266, 936), (474, 936), (684, 936),
    (370, 1046), (577, 1046), (790, 1046),
    (263, 1147), (474, 1147), (684, 1147),
    (370, 1254), (581, 1254), (790, 1254),
    (261, 1359), (474, 1359), (684, 1359),
    (366, 1469), (579, 1469), (790, 1469),
  )
  let r = 34
  let k = 0.7071
  for (x, y) in atoms {
    for (sx, sy) in ((1, 1), (1, -1), (-1, 1), (-1, -1)) {
      line(p(x + sx * (r - 4) * k, y + sy * (r - 4) * k), p(x + sx * 78 * k, y + sy * 78 * k), stroke: 1.3pt)
      circle(p(x + sx * 72 * k + sy * 6 * k, y + sy * 72 * k - sx * 6 * k), radius: 6, fill: black, stroke: none)
    }
  }
  for (x, y) in atoms {
    circle(p(x, y), radius: r, stroke: 1.5pt, fill: white)
    content(p(x, y), anchor: "center", text(size: 10pt, weight: "bold")[+4])
  }
  // 空穴 a 与自由电子，及空穴移动的路径
  circle(p(376, 1104), radius: 20, stroke: (thickness: 0.9pt, dash: "dashed"), fill: white)
  content(p(376, 1104), anchor: "center", text(size: 10pt)[+])
  content(p(374, 1143), anchor: "center", text(size: 9pt)[$a$])
  content(p(514, 1051), anchor: "center", text(size: 9pt)[$b$])
  circle(p(579, 1404), radius: 20, stroke: (thickness: 0.9pt, dash: "dashed"), fill: white)
  content(p(579, 1404), anchor: "center", text(size: 10pt)[#sym.minus])
  bezier(p(404, 1115), p(552, 1383), p(405, 1230), p(470, 1330), stroke: 1.1pt,
    mark: (end: "stealth", fill: black, scale: 0.6))
})
