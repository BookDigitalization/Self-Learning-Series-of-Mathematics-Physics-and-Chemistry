// 图 9·7–9·13（原书 p.333、335、336、338、339）：数列的点列图；图 9·14（p.344）：逐次作等腰直角三角形；
// 习题 9·6 第 5 题（p.348）：连接各边中点的内接正方形。
// 坐标取自 200 dpi 渲染页面图（用带网格的裁图量出真实像素，不是精量）。原图是手绘的：
// 点位按解析式 a_n 算出，不照手绘位置；数轴、刻度间距取扫描上刻度的位置；坐标轴略有倾斜，一律画成水平、竖直。
// 图 9·10：扫描上 n=2 处没有圈，只画出 n=1,3,4,5,6,7 六个圈，照原图。
// 图 9·7：扫描上虚线旁的标注印作 a_n = 1/n（数列实为 (n−1)/n），照印。
#import "/common/series.typ": *

#let ar = (end: "stealth", fill: black, scale: 0.5)
#let t(p, x, y, body, size: 8pt) = cetz.draw.content(p(x, y), text(font: fonts.song, size: size, body))
#let thick = (thickness: 1.3pt, dash: (3pt, 2.2pt))
#let thin = (thickness: 0.6pt, dash: (2.2pt, 1.8pt))

// 点列图的共同部分：坐标轴、n 轴整数刻度（xt 为刻度位置列表）、点与粗虚线折线
#let axes(p, x0, y0, xl, xr, yb, yt) = {
  import cetz.draw: *
  line(p(xl, y0), p(xr, y0), stroke: 0.6pt, mark: ar)
  line(p(x0, yb), p(x0, yt), stroke: 0.6pt, mark: ar)
}
#let xticks(p, y0, xs, h: 5) = {
  import cetz.draw: *
  for x in xs { line(p(x, y0 - h), p(x, y0 + h), stroke: 0.6pt) }
}
#let yticks(p, x0, ys, h: 5) = {
  import cetz.draw: *
  for y in ys { line(p(x0 - h, y), p(x0 + h, y), stroke: 0.6pt) }
}
#let dots(p, u, pts, skip: ()) = {
  import cetz.draw: *
  for (i, (x, y)) in pts.enumerate() {
    if i not in skip { circle(p(x, y), radius: 5 * u, fill: white, stroke: 0.7pt) }
  }
}

// ───────── 图 9·7：a_n = (n−1)/n ─────────
#let fig-9-7(width: 6.8cm) = px-canvas(640, 460, origin: (880, 1650), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 972
  let y0 = 1995
  let ux = 38.6
  let uy = 153
  axes(p, x0, y0, 895, 1462, 2070, 1690)
  xticks(p, y0, range(1, 9).map(n => x0 + ux * n))
  yticks(p, x0, range(1, 5).map(k => y0 - uy * k / 4))
  for n in range(1, 9) { t(p, x0 + ux * n, 2025, [#n]) }
  t(p, 948, y0 - uy, [1])
  t(p, 960, 2010, $0$, size: 7pt)
  t(p, 962, 1668, $a_n$)
  t(p, 1478, y0 - 3, $n$)
  // 虚线 a_n = 1
  line(p(978, y0 - uy), p(1345, y0 - uy), stroke: (thickness: 0.6pt, dash: (5pt, 3pt)))
  t(p, 1410, y0 - uy, $a_n = 1 / n$)
  let pts = range(1, 9).map(n => (x0 + ux * n, y0 - uy * (n - 1) / n))
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
})

// ───────── 图 9·8：a_n = (n+1)/n ─────────
#let fig-9-8(width: 7.6cm) = px-canvas(740, 700, origin: (500, 640), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 597
  let y0 = 1175
  let ux = 76.6
  let uy = 195
  axes(p, x0, y0, 528, 1160, 1265, 672)
  xticks(p, y0, range(1, 13).map(k => x0 + ux * k / 2), h: 5)
  yticks(p, x0, range(1, 11).map(k => y0 - uy * k / 5))
  for n in range(1, 7) { t(p, x0 + ux * n, 1198, [#n]) }
  t(p, 571, y0 - uy, [1])
  t(p, 575, y0 - 2 * uy + 2, [2])
  t(p, 583, 1191, $0$, size: 7pt)
  t(p, 590, 645, $a_n$)
  t(p, 1180, 1170, $n$)
  line(p(600, y0 - uy), p(1115, y0 - uy), stroke: (thickness: 0.9pt, dash: (5pt, 3pt)))
  t(p, 1165, y0 - uy, $a_n = 1$)
  let pts = range(1, 7).map(n => (x0 + ux * n, y0 - uy * (n + 1) / n))
  for (x, y) in pts { line(p(x, y), p(x, y0), stroke: (thickness: 0.8pt, dash: (3pt, 2pt))) }
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
})

// ───────── 图 9·9：a_n = (−1)^(n+1)/n ─────────
#let fig-9-9(width: 7.2cm) = px-canvas(700, 520, origin: (500, 1540), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 590
  let y0 = 1897
  let ux = 77
  let uy = 162
  axes(p, x0, y0, 540, 1148, 2030, 1572)
  xticks(p, y0, range(1, 7).map(n => x0 + ux * n))
  yticks(p, x0, (-2, -1, 1, 2, 3, 4).map(k => y0 - uy * k / 4))
  for n in range(1, 7) {
    if calc.odd(n) { t(p, x0 + ux * n, y0 + 28, [#n]) } else { t(p, x0 + ux * n, y0 - 32, [#n]) }
  }
  t(p, 563, y0 - uy, [1])
  t(p, 552, y0 - uy / 2, $1 / 2$)
  t(p, 545, y0 + uy / 2 - 4, $-1 / 2$)
  t(p, 607, y0 + 14, $0$, size: 7pt)
  t(p, 598, 1560, $a_n$)
  t(p, 1170, y0 + 8, $n$)
  let pts = range(1, 7).map(n => (x0 + ux * n, y0 - uy * calc.pow(-1, n + 1) / n))
  for (x, y) in pts { line(p(x, y), p(x, y0), stroke: (thickness: 0.5pt, dash: (3pt, 2pt))) }
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
})

// ───────── 图 9·10：a_n = n ─────────
#let fig-9-10(width: 4.7cm) = px-canvas(470, 480, origin: (270, 700), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 309
  let y0 = 1127
  let ux = 39.2
  let uy = 39
  axes(p, x0, y0, 295, 722, 1175, 750)
  xticks(p, y0, range(1, 8).map(n => x0 + ux * n))
  yticks(p, x0, range(1, 10).map(k => y0 - uy * k))
  t(p, 298, 1142, $0$, size: 7pt)
  t(p, 307, 727, $a_n$)
  t(p, 730, 1127, $n$)
  let pts = (1, 3, 4, 5, 6, 7).map(n => (x0 + ux * n, y0 - uy * n))
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
  t(p, 628, 863, $a_n = n$)
})

// ───────── 图 9·11：a_n = (−1)^(n+1) ─────────
#let fig-9-11(width: 5.2cm) = px-canvas(560, 480, origin: (850, 700), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 908
  let y0 = 983
  let ux = 77
  let uy = 80
  axes(p, x0, y0, 860, 1402, 1170, 750)
  xticks(p, y0, range(1, 6).map(n => x0 + ux * n))
  yticks(p, x0, (-1, 1).map(k => y0 - uy * k))
  for n in range(1, 6) {
    if calc.odd(n) { t(p, x0 + ux * n, y0 + 18, [#n]) } else { t(p, x0 + ux * n, y0 - 24, [#n]) }
  }
  t(p, 884, y0 - uy, [1])
  t(p, 876, y0 + uy, $-1$)
  t(p, 898, y0 + 12, $0$, size: 7pt)
  t(p, 918, 728, $a_n$)
  t(p, 1412, y0 - 6, $n$)
  let pts = range(1, 6).map(n => (x0 + ux * n, y0 - uy * calc.pow(-1, n + 1)))
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
})

// ───────── 图 9·12：a_n = (1/2)^n ─────────
#let fig-9-12(width: 5.0cm) = px-canvas(480, 400, origin: (230, 330), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 290
  let y0 = 635
  let ux = 38.5
  let uy = 316
  axes(p, x0, y0, 245, 665, 695, 368)
  xticks(p, y0, range(1, 7).map(n => x0 + ux * n))
  yticks(p, x0, range(1, 5).map(k => y0 - uy * k / 8))
  for n in range(1, 7) { t(p, x0 + ux * n, 668, [#n]) }
  t(p, 262, y0 - uy / 2, $1 / 2$)
  t(p, 286, 648, $0$, size: 7pt)
  t(p, 293, 341, $a_n$)
  t(p, 683, 638, $n$)
  let pts = range(1, 7).map(n => (x0 + ux * n, y0 - uy * calc.pow(0.5, n)))
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
  t(p, 465, 530, $a_n = (1 / 2)^n$)
})

// ───────── 图 9·13：a_n = 1/n ─────────
#let fig-9-13(width: 6.2cm) = px-canvas(640, 470, origin: (800, 260), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 868
  let y0 = 627
  let ux = 76.3
  let uy = 157
  axes(p, x0, y0, 815, 1392, 695, 312)
  xticks(p, y0, range(1, 11).map(k => x0 + ux * k / 2), h: 4)
  yticks(p, x0, range(1, 5).map(k => y0 - uy * k / 4))
  for n in range(1, 6) { t(p, x0 + ux * n, 657, [#n]) }
  t(p, 843, y0 - uy, [1])
  t(p, 852, 642, $0$, size: 7pt)
  t(p, 868, 284, $a_n$)
  t(p, 1405, 630, $n$)
  let pts = range(1, 6).map(n => (x0 + ux * n, y0 - uy / n))
  line(..pts.map(((x, y)) => p(x, y)), stroke: thick)
  dots(p, u, pts)
  t(p, 1128, 535, $a_n = 1 / n$)
})

// ───────── 图 9·14：逐次作等腰直角三角形 ─────────
// 顶点按几何作法算出：A、B、C 取自扫描（BC=AC，∠C 为直角），D 为 AB 中点，E 在 AC 上且 DE∥BC，
// F 为 E 在 AB 上的垂足，G 在 AC 上且 FG∥BC，H 为 G 在 AB 上的垂足。
#let fig-9-14(width: 4.9cm) = px-canvas(500, 480, origin: (250, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let cx = 672
  let by = 1460
  let l = 392
  let a = (cx, by - l)
  let b = (cx - l, by)
  let c = (cx, by)
  let d = (cx - l / 2, by - l / 2)
  let e = (cx, d.at(1))
  // F：E 在 AB（斜率 −1 的直线）上的垂足
  let tf = ((e.at(0) - b.at(0)) + (b.at(1) - e.at(1))) / 2
  let f = (b.at(0) + tf, b.at(1) - tf)
  let g = (cx, f.at(1))
  let th = ((g.at(0) - b.at(0)) + (b.at(1) - g.at(1))) / 2
  let h = (b.at(0) + th, b.at(1) - th)
  let s = 1.6pt
  line(p(..b), p(..a), p(..c), p(..b), stroke: s)
  line(p(..c), p(..d), stroke: s)
  line(p(..d), p(..e), stroke: s)
  line(p(..e), p(..f), stroke: s)
  line(p(..f), p(..g), stroke: s)
  line(p(..g), p(..h), stroke: s)
  let lab(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, style: "italic", body))
  lab(a.at(0) + 6, a.at(1) - 14, $A$)
  lab(b.at(0) - 8, b.at(1) + 10, $B$)
  lab(c.at(0) + 14, c.at(1) - 4, $C$)
  lab(d.at(0) - 16, d.at(1) - 10, $D$)
  lab(e.at(0) + 16, e.at(1) + 2, $E$)
  lab(f.at(0) - 16, f.at(1) - 12, $F$)
  lab(g.at(0) + 16, g.at(1) - 2, $G$)
  lab(h.at(0) - 14, h.at(1) - 10, $H$)
  lab(488, 1390, $S_1$)
  lab(617, 1336, $S_2$)
  lab(578, 1233, $S_3$)
  lab(644, 1198, $S_4$)
  lab(622, 1152, $S_5$)
})

// ───────── 习题 9·6 第 5 题：连接各边中点的内接正方形 ─────────
#let fig-q5(width: 4.2cm) = px-canvas(420, 420, origin: (968, 1740), width: width, (p, u) => {
  import cetz.draw: *
  let cx = 1178
  let cy = 1948
  let s = 1.4pt
  let sq(r) = rect(p(cx - r, cy - r), p(cx + r, cy + r), stroke: s)
  let dm(r) = line(p(cx, cy - r), p(cx + r, cy), p(cx, cy + r), p(cx - r, cy), close: true, stroke: s)
  sq(202)
  dm(202)
  sq(101)
  dm(101)
  sq(50.5)
})
