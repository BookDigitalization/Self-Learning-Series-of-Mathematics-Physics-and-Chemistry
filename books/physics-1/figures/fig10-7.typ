// 图 10·7 轮轴（原书 p.305）
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-7(width: 7cm) = px-canvas(340, 720, origin: (430, 110), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (thickness: 0.6pt, dash: "dashed")
  // 支架
  line(p(515, 122), p(575, 122), stroke: 0.8pt)
  for x in range(517, 575, step: 8) { line(p(x, 122), p(x + 6, 114), stroke: 0.5pt) }
  line(p(556, 122), p(556, 255), stroke: 1.2pt)
  // 轮与轴
  circle(p(558, 255), radius: 110 * u, stroke: 1pt)
  circle(p(558, 255), radius: 52 * u, stroke: 1pt)
  line(p(558, 255), p(468, 208), stroke: 0.8pt, mark: arr)
  line(p(558, 255), p(606, 232), stroke: 0.8pt, mark: arr)
  lab(488, 228, $r_2$); lab(590, 259, $r_1$)
  // 轴上的绳（挂重物）
  line(p(508, 255), p(513, 610), stroke: 1pt)
  rect(p(490, 610), p(553, 665), stroke: 1pt)
  lab(574, 632, $B$)
  line(p(527, 665), p(527, 818), stroke: 1pt, mark: arr)
  lab(553, 793, $G$)
  rect(p(484, 460), p(550, 510), stroke: dash)
  lab(568, 485, $B'$)
  // 轮上的绳（动力）
  line(p(667, 255), p(667, 365), stroke: 1pt)
  line(p(667, 365), p(667, 650), stroke: 1pt, mark: arr)
  circle(p(666, 243), radius: 2.5 * u, fill: black, stroke: none)
  lab(687, 243, $A$)
  lab(691, 348, $F$)
  circle(p(668, 545), radius: 2.5 * u, fill: black, stroke: none)
  lab(699, 545, $A'$)
  // h₁
  line(p(437, 465), p(463, 465), stroke: 0.6pt)
  line(p(437, 668), p(463, 668), stroke: 0.6pt)
  line(p(450, 555), p(450, 466), stroke: 0.6pt, mark: arr)
  line(p(450, 585), p(450, 667), stroke: 0.6pt, mark: arr)
  lab(453, 570, $h_1$)
  // h₂
  line(p(722, 242), p(762, 242), stroke: 0.6pt)
  line(p(748, 540), p(768, 540), stroke: 0.6pt)
  line(p(745, 375), p(745, 243), stroke: 0.6pt, mark: arr)
  line(p(745, 400), p(745, 539), stroke: 0.6pt, mark: arr)
  lab(750, 387, $h_2$)
})
