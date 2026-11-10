// §4·6–§4·9 的图：图 4·13（p.117）、图 4·14（p.118）、图 4·15（p.121）、图 4·16、图 4·17（p.133）。
// 坐标取自 150 dpi 页面图（扫描原生像素，y 向下），放大裁图加网格读出。
// 图 4·16、图 4·17 的圆心、半径取实测，顶点取正多边形的位置（实测各点与正七边形、正五边形吻合）。
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig4-common.typ": *

#let am = (end: "stealth", fill: black, scale: 0.4)   // 角弧的小箭头
#let ab = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
// 沿线文字的朝向：落在 (−90°, 90°) 里，不倒着读
#let along(a) = if a > 90deg { a - 180deg } else if a < -90deg { a + 180deg } else { a }

// ───────── 图 4·13：复数乘法的几何解释（p.117）─────────
#let fig-4-13(width: 270 * k) = px-canvas(270, 245, origin: (275, 795), width: width, (p, u) => {
  import cetz.draw: *
  let o = (338, 983)
  let (m1, m2, m) = ((381, 956), (389, 883), (285, 823))
  let a1 = dirang(m1.at(0) - 338, m1.at(1) - 983)
  let a2 = dirang(m2.at(0) - 338, m2.at(1) - 983)
  let a3 = dirang(m.at(0) - 338, m.at(1) - 983)
  line(p(339, 1026), p(339, 806), stroke: axw, mark: ar)
  line(p(275, 984), p(532, 984), stroke: axw, mark: ar)
  line(p(..o), p(..m1), stroke: vw, mark: ar)
  line(p(..o), p(..m2), stroke: vw, mark: ar)
  line(p(..o), p(..m), stroke: vw, mark: ar)
  arc(p(..o), start: 0deg, stop: a1, radius: 23, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  arc(p(..o), start: 0deg, stop: a2, radius: 76, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  arc(p(..o), start: 0deg, stop: a3, radius: 134, anchor: "origin", stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(445, 870), tt($theta_1 + theta_2$))
  content(p(411, 937), tt($theta_2$))
  content(p(374, 975), tt($theta_1$))
  content(p(318, 895), angle: along(a3), tt($r_1 dot r_2$))
  content(p(356, 927), angle: along(a2), tt($r_2$))
  content(p(361, 958), angle: along(a1), tt($r_1$))
  content(p(285, 811), tt($M$))
  content(p(403, 885), tt($M_2$))
  content(p(393, 958), tt($M_1$))
  content(p(327, 994), tt($O$))
  content(p(543, 986), tt($x$))
  content(p(340, 793), tt($y$))
})

// ───────── 图 4·14：2(cos 60° + i sin 60°)·3(cos 45° + i sin 45°)（p.118）─────────
#let fig-4-14(width: 250 * k) = px-canvas(250, 300, origin: (275, 328), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (372.7, 540)
  let ux = 28.6
  let uy = 27.7
  let (m, m1, m2) = ((325, 377), (403, 486), (435, 477))
  line(p(ox, 625), p(ox, 343), stroke: axw, mark: ar)
  line(p(277, oy), p(512, oy), stroke: axw, mark: ar)
  for n in (-3, -2, -1, 1, 2, 3) {
    line(p(ox + n * ux, oy), p(ox + n * ux, oy - 4), stroke: 0.6pt)
    content(p(ox + n * ux + (if n < 0 { -3 } else { 0 }), oy + 10), tt($#n$))
  }
  for n in (-2, -1, 1, 2, 3, 4, 5, 6) {
    line(p(ox, oy - n * uy), p(ox + 4, oy - n * uy), stroke: 0.6pt)
    content(p(ox - 5, oy - n * uy), anchor: "east", tt($#n$))
  }
  line(p(ox, oy), p(..m), stroke: vw, mark: ar)
  line(p(ox, oy), p(..m1), stroke: vw, mark: ar)
  line(p(ox, oy), p(..m2), stroke: vw, mark: ar)
  arc(p(ox, oy), start: 0deg, stop: 60deg, radius: 26, anchor: "origin", stroke: 0.7pt)
  arc(p(ox, oy), start: 0deg, stop: 40deg, radius: 45, anchor: "origin", stroke: 0.7pt)
  arc(p(ox, oy), start: 60deg, stop: dirang(m.at(0) - ox, m.at(1) - oy), radius: 20, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(383, 500), tt($45°$))
  content(p(402, 528), tt($60°$))
  content(p(427, 522), tt($45°$))
  content(p(326, 365), tt($M$))
  content(p(412, 473), tt($M_1$))
  content(p(452, 474), tt($M_2$))
  content(p(365, 551), tt($O$))
  content(p(523, 541), tt($x$))
  content(p(373, 329), tt($y$))
})

// ───────── 图 4·15：复数除法的几何解释（p.121）─────────
#let fig-4-15(width: 235 * k) = px-canvas(235, 215, origin: (480, 592), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (510.7, 730.7)
  let (m1, m2, m) = ((636, 657), (559, 649), (572, 767))
  let a1 = dirang(m1.at(0) - ox, m1.at(1) - oy)
  let a2 = dirang(m2.at(0) - ox, m2.at(1) - oy)
  let a3 = dirang(m.at(0) - ox, m.at(1) - oy)
  line(p(ox, 802), p(ox, 603), stroke: axw, mark: ar)
  line(p(481, oy), p(683, oy), stroke: axw, mark: ar)
  line(p(ox, oy), p(..m1), stroke: vw, mark: ar)
  line(p(ox, oy), p(..m2), stroke: vw, mark: ar)
  line(p(ox, oy), p(..m), stroke: vw, mark: ar)
  arc(p(ox, oy), start: 0deg, stop: a2, radius: 96, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  arc(p(ox, oy), start: 0deg, stop: a1, radius: 42, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  arc(p(ox, oy), start: 0deg, stop: a3, radius: 52, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(647, 660), tt($M_1$))
  content(p(565, 651), tt($M_2$))
  content(p(587, 769), tt($M$))
  content(p(605, 695), tt($theta_2$))
  content(p(565, 718), tt($theta_1$))
  content(p(582, 743), tt($theta_1 - theta_2$))
  content(p(555, 693), angle: along(a1), tt($r_1$))
  content(p(525, 690), angle: along(a2), tt($r_2$))
  content(p(535, 765), angle: along(a3), tt($r_1 / r_2$))
  content(p(503, 741), tt($O$))
  content(p(691, 728), tt($x$))
  content(p(511, 594), tt($y$))
})

// ───────── 图 4·16：n = 7 时 n 次方根对应的点（p.133）─────────
#let fig-4-16(width: 260 * 0.024cm) = px-canvas(260, 270, origin: (428, 380), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (551.2, 513.7, 99.5)
  let th = 33deg
  let n = 7
  let v = j => (cx + r * calc.cos(th + 360deg * j / n), cy - r * calc.sin(th + 360deg * j / n))
  circle(p(cx, cy), radius: r, stroke: 0.7pt)
  line(p(cx, 640), p(cx, 387), stroke: axw, mark: ar)
  line(p(432, cy), p(685, cy), stroke: axw, mark: ar)
  for j in range(n) {
    line(p(..v(j)), p(..v(calc.rem(j + 1, n))), stroke: 1.5pt)
    line(p(cx, cy), p(..v(j)), stroke: 1.4pt, mark: ar)
  }
  // 2π/n 与 θ/n 的角弧
  arc(p(cx, cy), start: th, stop: th + 360deg / n, radius: 44, anchor: "origin", stroke: 0.7pt, mark: ab)
  arc(p(cx, cy), start: 0deg, stop: th, radius: 50, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(568, 482), tt($frac(2 pi, n)$))
  content(p(607, 497), tt($frac(theta, n)$))
  content(p(602, 464), tt($root(n, r)$))
  let lab = (
    ("0", 648, 454), ("1", 570, 404), ("2", 472, 435), ("3", 441, 527),
    ("4", 494, 607), ("5", 596, 616), ("6", 657, 556),
  )
  for (s, x, y) in lab { content(p(x, y), tt($M_#s$)) }
  content(p(547, 530), tt($O$))
  content(p(694, 515), tt($x$))
  content(p(551, 379), tt($y$))
})

// ───────── 图 4·17：x⁵ − 1 = 0 的五个根（p.133）─────────
#let fig-4-17(width: 260 * 0.022cm) = px-canvas(260, 270, origin: (428, 726), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (550.8, 868.3, 99.5)
  circle(p(cx, cy), radius: r, stroke: 0.9pt)
  line(p(cx, 995), p(cx, 740), stroke: axw, mark: ar)
  line(p(430, cy), p(682, cy), stroke: axw, mark: ar)
  for j in range(5) {
    let a = 72deg * j
    let tip = (cx + r * calc.cos(a), cy - r * calc.sin(a))
    line(p(cx, cy), p(..tip), stroke: 1.5pt, mark: ar)
    pdot(p(..tip), r: 3)
  }
  arc(p(cx, cy), start: 0deg, stop: 72deg, radius: 28, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(578, 856), tt($72°$))
  content(p(595, 767), tt($M_1$))
  content(p(463, 797), tt($M_2$))
  content(p(465, 937), tt($M_3$))
  content(p(598, 968), tt($M_4$))
  content(p(659, 855), tt($M_0$))
  content(p(440, 877), tt($-1$))
  content(p(658, 877), tt($1$))
  content(p(546, 880), tt($O$))
  content(p(687, 867), tt($x$))
  content(p(553, 729), tt($y$))
})
