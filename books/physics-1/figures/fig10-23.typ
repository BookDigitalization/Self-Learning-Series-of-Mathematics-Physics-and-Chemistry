// 图 10·23 手拉式葫芦的原理图（原书 p.316）
// CeTZ 重绘；原图链条为手绘曲线，这里用贝塞尔曲线近似（见待核对清单）。
// 坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-23(width: 8cm) = px-canvas(480, 640, origin: (340, 285), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  // 外框
  rect(p(352, 293), p(782, 533), stroke: 1.4pt)
  // 第一轮轴（左）：轮 r₄、轴 r₃
  circle(p(437, 413), radius: 67 * u, stroke: 1pt)
  circle(p(440, 408), radius: 23 * u, stroke: 1pt)
  line(p(440, 408), p(448, 343), stroke: 0.8pt, mark: arr)
  line(p(440, 408), p(455, 450), stroke: 0.8pt, mark: arr)
  lab(458, 357, $r_4$); lab(461, 437, $r_3$)
  // 第二轮轴（右）：轮 r₂、轴 r₁
  circle(p(603, 415), radius: 98 * u, stroke: 1pt)
  circle(p(582, 413), radius: 40 * u, stroke: 1pt)
  line(p(582, 413), p(658, 352), stroke: 0.8pt, mark: arr)
  line(p(582, 413), p(584, 452), stroke: 0.8pt, mark: arr)
  lab(610, 347, $r_2$); lab(596, 424, $r_1$)
  lab(543, 466, $A$)
  // 拉动的链条（手拉）
  line(p(687, 398), p(748, 665), stroke: 1.8pt, mark: arr)
  lab(766, 670, $F$)
  bezier(p(748, 665), p(808, 840), p(765, 750), p(812, 800), stroke: 1.2pt)
  bezier(p(808, 840), p(740, 882), p(800, 880), p(770, 888), stroke: 1.2pt)
  bezier(p(740, 882), p(497, 495), p(660, 880), p(560, 640), stroke: 1.2pt)
  // 绕动滑轮的链条
  circle(p(462, 775), radius: 38 * u, stroke: 1pt)
  line(p(500, 500), p(500, 775), stroke: 1.2pt)
  line(p(424, 515), p(424, 775), stroke: 1.2pt)
  circle(p(424, 515), radius: 2.5 * u, fill: black, stroke: none)
  line(p(462, 813), p(462, 832), stroke: 1pt)
  rect(p(436, 832), p(487, 882), stroke: 1pt)
  lab(502, 858, $G$)
})
