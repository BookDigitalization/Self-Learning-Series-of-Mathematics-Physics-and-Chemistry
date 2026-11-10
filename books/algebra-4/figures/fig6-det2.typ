#import "/common/series.typ": *
// 第 6 章 §6·1（p.197）：二阶行列式的“左上到右下、左下到右上”两条箭头，不编号。
// 坐标取自 200 dpi 页面的真实像素（y 向下）：行列式两条竖线 x≈428、535（y 218–308），
// a(442,236) c(517,236) b(443,294) d(519,294)；实线 a→d，虚线 b→c，箭头在 d、c 一端。
#let k = 0.0155cm
#let tt(body) = text(size: 10.5pt, body)
#let ar = (end: "stealth", fill: black, scale: 0.5)

#let fig-6-det2(width: 150 * k) = px-canvas(150, 120, origin: (405, 200), width: width, (p, u) => {
  import cetz.draw: *
  line(p(428, 218), p(428, 308), stroke: 0.7pt)
  line(p(535, 218), p(535, 308), stroke: 0.7pt)
  content(p(442, 236), tt[$a$])
  content(p(518, 236), tt[$c$])
  content(p(443, 294), tt[$b$])
  content(p(519, 294), tt[$d$])
  line(p(454, 246), p(505, 285), stroke: 0.6pt, mark: ar)
  line(p(454, 284), p(506, 247), stroke: (paint: black, thickness: 0.6pt, dash: "dashed"), mark: ar)
})
