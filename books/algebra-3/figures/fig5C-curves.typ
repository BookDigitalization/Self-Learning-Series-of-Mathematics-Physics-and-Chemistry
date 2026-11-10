// 图 5·10（原书 p.203）：y=x³ 与它的反函数 y=∛x，关于直线 y=x 对称。
// 图 5·11（原书 p.208）：x²+y²=25，上半圆 y=√(25−x²) 实线，下半圆 y=−√(25−x²) 虚线。
// 坐标取自 200 dpi 页面图（显示宽 1596 的缩放图，y 向下），未用网格精量。
// 图 5·10：原点 (795, 915)，单位约 54.4 像素（x 轴刻度间距 54.5、y 轴 54.3）；
//   y=x³ 取 x∈[−2.07, 2.07]；y=∛x 取 x∈[−9.08, 9.5]；直线 y=x 取 x∈[−6.65, 6.4]；
//   虚线连接 (2,8)↔(8,2)、(1.82,6)↔(6,1.82) 及其关于原点的对称点。
// 图 5·11：原点 (770, 1180)，单位约 48.8 像素，半径 5 个单位。
#import "/common/series.typ": *

#let fig-5-10(width: 9.2cm) = px-canvas(1270, 1180, origin: (200, 290), width: width, (p, u) => {
  import cetz.draw: *
  let ox = 795
  let oy = 915
  let s = 54.4
  let q(x, y) = p(ox + s * x, oy - s * y)
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let t(x, y, body, size: 8pt) = content(p(x, y), text(font: fonts.song, size: size, body))
  // 坐标轴与刻度
  line(p(215, oy), p(1408, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1435), p(ox, 345), stroke: 0.6pt, mark: ar)
  for k in range(-9, 10) {
    if k != 0 { line(q(k, 0.09), q(k, -0.09), stroke: 0.5pt) }
  }
  for k in range(-9, 9) {
    if k != 0 { line(q(-0.09, k), q(0.09, k), stroke: 0.5pt) }
  }
  // 直线 y=x（点划线）
  line(q(-6.65, -6.65), q(6.4, 6.4), stroke: (thickness: 0.8pt, dash: (6pt, 2pt, 1pt, 2pt)))
  // 虚线连接对称点
  let dsh = (thickness: 0.5pt, dash: (3pt, 2pt))
  line(q(2, 8), q(8, 2), stroke: dsh)
  line(q(1.82, 6), q(6, 1.82), stroke: dsh)
  line(q(-2, -8), q(-8, -2), stroke: dsh)
  line(q(-1.82, -6), q(-6, -1.82), stroke: dsh)
  // y = x^3（实线）
  let n = 60
  let cube = range(n + 1).map(i => { let x = -2.07 + 4.14 * i / n; q(x, calc.pow(x, 3)) })
  line(..cube, stroke: 1.5pt)
  // y = x^(1/3)（粗虚线）
  let root3(x) = if x < 0 { -calc.pow(-x, 1 / 3) } else { calc.pow(x, 1 / 3) }
  let m = 120
  let cr = range(m + 1).map(i => { let x = -9.08 + 18.58 * i / m; q(x, root3(x)) })
  line(..cr, stroke: (thickness: 1.5pt, dash: (5pt, 2pt)))
  // 标注
  t(797, 313, $y$)
  t(1420, 915, $x$)
  t(808, 937, $O$, size: 7pt)
  t(952, 415, $y = x^3$)
  t(1190, 537, $y = x$)
  t(1388, 805, $y = root(3, x)$)
})

#let fig-5-11(width: 6.4cm) = px-canvas(760, 740, origin: (400, 790), width: width, (p, u) => {
  import cetz.draw: *
  let ox = 770
  let oy = 1180
  let s = 48.8
  let q(x, y) = p(ox + s * x, oy - s * y)
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let t(x, y, body, size: 8pt) = content(p(x, y), text(font: fonts.song, size: size, body))
  line(p(412, oy), p(1125, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1520), p(ox, 830), stroke: 0.6pt, mark: ar)
  for k in range(-5, 6) {
    if k != 0 { line(q(k, 0.1), q(k, -0.1), stroke: 0.5pt) }
  }
  for k in range(-5, 6) {
    if k != 0 { line(q(-0.1, k), q(0.1, k), stroke: 0.5pt) }
  }
  // 上半圆：实线；下半圆：虚线
  let n = 90
  let upper = range(n + 1).map(i => { let x = -5 + 10 * i / n; q(x, calc.sqrt(calc.max(0, 25 - x * x))) })
  let lower = range(n + 1).map(i => { let x = -5 + 10 * i / n; q(x, -calc.sqrt(calc.max(0, 25 - x * x))) })
  line(..upper, stroke: 1.6pt)
  line(..lower, stroke: (thickness: 1.6pt, dash: (5pt, 1.5pt)))
  t(770, 803, $y$)
  t(1142, 1180, $x$)
  t(757, 1193, $O$, size: 7pt)
  t(1060, 968, $y = sqrt(25 - x^2)$, size: 6.5pt)
  t(1075, 1390, $y = -sqrt(25 - x^2)$, size: 6.5pt)
})
