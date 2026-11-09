#import "/common/series.typ": *
// 复习题五第 11 题插图：原书 p.212。钢制零件：右边是圆柱（直径 d、长 l），左端是圆锥（高 h）。近似像素坐标。
#let fig-cone(width: 9cm) = px-canvas(560, 160, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.35)
  line(p(10, 70), p(190, 15), stroke: 1.2pt)
  line(p(10, 70), p(190, 125), stroke: 1.2pt)
  line(p(190, 15), p(515, 15), stroke: 1.2pt)
  line(p(190, 125), p(515, 125), stroke: 1.2pt)
  // 圆锥底面与圆柱右端面（椭圆，后半部分虚线）
  circle(p(190, 70), radius: (14 * u, 55 * u), stroke: 1pt)
  circle(p(515, 70), radius: (14 * u, 55 * u), stroke: 1pt)
  // 尺寸
  line(p(10, 70), p(10, 140), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(10, 140), p(190, 140), stroke: 0.5pt, mark: arr)
  content(p(100, 140), text(font: fonts.song, size: 8pt, $h$), fill: white, frame: "rect", stroke: none, padding: 1pt)
  line(p(10, 154), p(535, 154), stroke: 0.5pt, mark: arr)
  content(p(270, 154), text(font: fonts.song, size: 8pt, $l$), fill: white, frame: "rect", stroke: none, padding: 1pt)
  line(p(545, 15), p(545, 125), stroke: 0.5pt, mark: arr)
  t(553, 70, $d$)
})
