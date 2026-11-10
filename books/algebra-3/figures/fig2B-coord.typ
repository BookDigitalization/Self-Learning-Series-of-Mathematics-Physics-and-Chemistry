#import "/common/series.typ": *
// 第 2 章 B 段（§2·5、§2·6）的坐标系图：图 2·5–2·10，以及习题 2·5 第 2 题、习题 2·6 第 4 题的无编号图。
// 坐标取自 200 dpi 页面图（render-pages.py --dpi 200 --grid 100）的真实像素（y 向下）；
// 每幅图先写“数学原点所在的页面像素 (ox, oy)”和每单位的像素数，再用数学坐标 (a, b) 画图。
// 点位、网格间距按网格图读出，未做更精的量度；原图手绘的曲线（图 2·10、习题 2·6 第 4 题）按读出的点光滑连接或折线连接。

#let kpx = 0.0088cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let num(k) = if k < 0 [−#calc.abs(k)] else [#k]
#let gridc = 0.35pt + luma(110)
#let dashed = (paint: black, thickness: 0.6pt, dash: "dashed")

// ───────── 图 2·5：p.92，直角坐标系 ─────────
#let fig-2-5(width: 720 * kpx) = px-canvas(720, 710, origin: (480, 870), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(804 + 50 * a, 1238 - 50 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  line(p(530, 1238), p(1139, 1238), stroke: 0.6pt, mark: ar)
  line(p(804, 1534), p(804, 907), stroke: 0.6pt)
  for k in range(-4, 5) {
    if k != 0 {
      line(p(804 + 50 * k, 1233), p(804 + 50 * k, 1243), stroke: 0.5pt)
      line(p(799, 1238 - 50 * k), p(809, 1238 - 50 * k), stroke: 0.5pt)
      t(k, -0.5, num(k))
      t(0.5, k, num(k))
    }
  }
  t(0.2, -0.4, $O$)
  content(p(499, 1238), tt($X'$))
  content(p(1165, 1240), tt($X$))
  content(p(804, 879), tt($Y$))
  content(p(804, 1557), tt($Y'$))
})

// ───────── 图 2·6：p.93，P(2, 4) 的作法 ─────────
#let fig-2-6(width: 560 * kpx) = px-canvas(560, 680, origin: (550, 320), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(803 + 48 * a, 684 - 50 * b)
  line(p(591, 684), p(1049, 684), stroke: 0.6pt, mark: ar)
  line(p(803, 969), p(803, 357), stroke: 0.6pt)
  for k in range(1, 5) { line(m(-0.1, k), m(0.1, k), stroke: 0.5pt) }
  line(m(1, -0.1), m(1, 0.1), stroke: 0.5pt)
  line(m(0, 4), m(2, 4), m(2, 0), stroke: 0.8pt)
  content(p(572, 679), tt($X'$))
  content(p(1074, 691), tt($X$))
  content(p(810, 332), tt($Y$))
  content(p(790, 972), tt($Y'$))
  content(p(784, 482), tt($N$))
  content(p(958, 479), tt($P(2, 4)$))
  content(p(899, 707), tt($M$))
  content(p(785, 703), tt($O$))
  content(p(850, 711), tt[1])
  content(p(784, 631), tt[1])
})

// ───────── 图 2·7：p.94，例 1 的八个点 ─────────
#let fig-2-7(width: 880 * kpx) = px-canvas(880, 840, origin: (400, 240), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(918 + 99.6 * a, 695 - 101 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  // 网格：x∈[−3.5, 2.5]，y∈[−2.5, 3.5]，每 0.5 一条
  for i in range(-7, 6) { line(m(i * 0.5, -2.5), m(i * 0.5, 3.5), stroke: gridc) }
  for j in range(-5, 8) { line(m(-3.5, j * 0.5), m(2.5, j * 0.5), stroke: gridc) }
  rect(m(-3.5, -2.5), m(2.5, 3.5), stroke: 0.8pt)
  // 坐标轴
  line(m(-4.5, 0), m(2.9, 0), stroke: 0.7pt, mark: ar)
  line(m(0, -2.95), m(0, 3.85), stroke: 0.7pt, mark: ar)
  t(-4.75, 0.05, $X'$)
  t(3.25, 0.0, $X$)
  t(0.0, 4.2, $Y$)
  t(0.15, -3.55, $Y'$)
  // 轴上刻度值
  for k in (-3, -2, -1, 1, 2) { t(k, -0.28, num(k)) }
  t(0.15, -0.28, $O$)
  for k in (3, 2, 1, -1, -2) { t(0.1, k, num(k), anchor: "west") }
  // 点
  let dot(a, b) = circle(m(a, b), radius: 4.5 * u, fill: black, stroke: none)
  let pts = ((1, -2), (0.5, 3), (-3, 2), (-2.5, -1), (2, 0), (-1, 0), (0, 1.5), (0, -4 / 3))
  for (a, b) in pts { dot(a, b) }
  // 虚线
  line(m(0, 3), m(0.5, 3), m(0.5, 0), stroke: dashed)
  line(m(0, 2), m(-3, 2), m(-3, 0), stroke: dashed)
  line(m(0, -1), m(-2.5, -1), m(-2.5, 0), stroke: dashed)
  line(m(0, -2), m(1, -2), m(1, 0), stroke: dashed)
  // 点的标注
  t(1.15, -1.95, $A(1, -2)$, anchor: "west")
  t(0.7, 2.95, $B lr(( 1/2, 3 ))$, anchor: "west")
  t(-3.1, 2.0, $C(-3, 2)$, anchor: "east")
  t(-2.6, -1.0, $D(-2.5, -1)$, anchor: "east")
  t(2.0, 0.38, $E(2, 0)$)  // 原书作 E(2.0)（逗号印成句点，疑似印刷错误，已订正，见 REVISIONS.md）
  t(-1.0, 0.38, $F(-1, 0)$)
  t(-0.15, 1.5, $G(0, 1.5)$, anchor: "east")
  t(-0.15, -4 / 3, $H lr(( 0, -4/3 ))$, anchor: "east")
})

// ───────── 图 2·8：p.94，例 2，y = x² 的九个点 ─────────
#let fig-2-8(width: 880 * kpx) = px-canvas(880, 820, origin: (450, 1440), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(865 + 113.5 * a, 2057 - 113.3 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  // 网格：x∈[−2.5, 2.5]，y∈[0.5, 4]，每 0.5 一条
  for i in range(-5, 6) { line(m(i * 0.5, 0.5), m(i * 0.5, 4), stroke: gridc) }
  for j in range(1, 9) { line(m(-2.5, j * 0.5), m(2.5, j * 0.5), stroke: gridc) }
  rect(m(-2.5, 0.5), m(2.5, 4), stroke: 0.8pt)
  // 坐标轴
  line(m(-2.92, 0), m(3.6, 0), stroke: 0.7pt, mark: ar)
  line(m(0, -1.45), m(0, 4.7), stroke: 0.7pt, mark: ar)
  t(-3.3, 0.0, $X'$)
  t(3.85, 0.0, $X$)
  t(-0.05, 5.15, $Y$)
  t(0.0, -1.7, $Y'$)
  for k in (-2, -1, 1, 2) { t(k, -0.28, num(k)) }
  t(-0.18, -0.28, $O$)
  for k in (4, 3, 2, 1) { t(-0.17, k, [#k], anchor: "east") }
  // 虚线：水平、竖直
  let pts = ((-2, 4), (-1.5, 9 / 4), (-1, 1), (-0.5, 1 / 4), (0.5, 1 / 4), (1, 1), (1.5, 9 / 4), (2, 4))
  line(m(-2, 4), m(2, 4), stroke: dashed)
  line(m(-1.5, 9 / 4), m(1.5, 9 / 4), stroke: dashed)
  line(m(-1, 1), m(1, 1), stroke: dashed)
  line(m(-0.5, 1 / 4), m(0.5, 1 / 4), stroke: dashed)
  for (a, b) in pts { line(m(a, b), m(a, 0), stroke: dashed) }
  // 空心圈
  for (a, b) in pts { circle(m(a, b), radius: 5 * u, fill: white, stroke: 0.7pt) }
  circle(m(0, 0), radius: 5 * u, fill: white, stroke: 0.7pt)
})

// ───────── 图 2·9：p.95，例 3，写出各点坐标 ─────────
#let fig-2-9(width: 1060 * kpx) = px-canvas(1060, 820, origin: (330, 1050), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(837 + 101 * a, 1474 - 101 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  // 网格：x∈[−4, 4]，y∈[−3, 3]，每 0.5 一条
  for i in range(-8, 9) { line(m(i * 0.5, -3), m(i * 0.5, 3), stroke: gridc) }
  for j in range(-6, 7) { line(m(-4, j * 0.5), m(4, j * 0.5), stroke: gridc) }
  rect(m(-4, -3), m(4, 3), stroke: 0.8pt)
  line(m(-4.4, 0), m(4.94, 0), stroke: 0.7pt, mark: ar)
  line(m(0, -3.5), m(0, 3.6), stroke: 0.7pt, mark: ar)
  t(-4.7, 0.1, $X'$)
  t(5.05, 0.0, $X$)
  t(0.05, 3.95, $Y$)
  t(0.0, -3.75, $Y'$)
  for k in (-4, -3, -2, -1, 1, 2, 3, 4) { t(k, -0.25, num(k)) }
  t(0.1, -0.25, $O$)
  for k in (3, 2, 1, -1, -2, -3) { t(-0.13, k, num(k), anchor: "east") }
  // 虚线
  line(m(0, 2), m(2, 2), m(2, 0), stroke: dashed)
  line(m(0, 1), m(-1, 1), m(-1, 0), stroke: dashed)
  line(m(0, -1), m(2.5, -1), m(2.5, 0), stroke: dashed)
  line(m(0, -2), m(-3, -2), m(-3, 0), stroke: dashed)
  // 点
  let pts = ((3, 0), (3.5, 0), (-2, 0), (0, -3), (2, 2), (-1, 1), (-3, -2), (2.5, -1))
  for (a, b) in pts { circle(m(a, b), radius: 4.5 * u, fill: black, stroke: none) }
  t(3.05, 0.25, $A$)
  t(3.5, -0.3, $B$)
  t(-2, 0.25, $C$)
  t(0.2, -3.05, $D$)
  t(2.2, 2.0, $E$)
  t(-1.25, 1.0, $F$)
  t(-3.2, -2.0, $G$)
  t(2.75, -1.0, $H$)
})

// ───────── 习题 2·5 第 2 题的图（无编号）：p.97 ─────────
#let fig-ex2-5-2(width: 920 * kpx) = px-canvas(920, 880, origin: (390, 850), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(818 + 101.5 * a, 1310 - 102 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  for i in range(-6, 7) { line(m(i * 0.5, -3), m(i * 0.5, 3), stroke: gridc) }
  for j in range(-6, 7) { line(m(-3, j * 0.5), m(3, j * 0.5), stroke: gridc) }
  rect(m(-3, -3), m(3, 3), stroke: 0.8pt)
  line(m(-3.9, 0), m(4.4, 0), stroke: 0.9pt, mark: ar)
  line(m(0, -3.9), m(0, 4.15), stroke: 0.9pt, mark: ar)
  t(0.0, 4.45, $y$)
  t(4.65, 0.0, $x$)
  for k in (-3, -2, -1, 1, 2, 3) { t(k, 0.22, num(k)) }
  t(-0.2, 0.18, $o$)
  for k in (3, 2, 1, -1, -2, -3) { t(-0.15, k, num(k), anchor: "east") }
  // 粗线（点到坐标轴的垂线）
  let st = 1.6pt
  line(m(0, 2.5), m(2.5, 2.5), m(2.5, 0), stroke: st)
  line(m(0, 2), m(-2, 2), m(-2, 0.3), stroke: st)
  line(m(0, -1), m(-1.25, -1), m(-1.25, 0), stroke: st)
  line(m(0, -1.5), m(1.5, -1.5), m(1.5, 0), stroke: st)
  let pts = ((2.5, 2.5), (0, 1.5), (-2, 2), (-2.5, 0), (-1.25, -1), (0, -2.5), (1.5, -1.5))
  for (a, b) in pts { circle(m(a, b), radius: 5 * u, fill: black, stroke: none) }
  t(2.7, 2.5, $A$)
  t(0.2, 1.5, $B$)
  t(-2.2, 2.0, $C$)
  t(-2.5, -0.3, $D$)
  t(-1.5, -1.0, $E$)
  t(0.2, -2.5, $F$)
  t(1.7, -1.5, $G$)
})

// ───────── 图 2·10：p.100，一天的温度曲线 ─────────
#let fig-2-10(width: 1130 * kpx) = px-canvas(1130, 760, origin: (270, 280), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(362 + 34.4 * a, 696 - 35 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  line(m(-2.4, 0), m(26.5, 0), stroke: 0.7pt, mark: ar)
  line(m(0, -9.5), m(0, 9.8), stroke: 0.7pt, mark: ar)
  // 刻度：t 每 1 小时，C 每 1 度
  for k in range(1, 25) { line(p(362 + 34.4 * k, 692), p(362 + 34.4 * k, 700), stroke: 0.5pt) }
  for k in range(-9, 10) { if k != 0 { line(p(358, 696 - 35 * k), p(366, 696 - 35 * k), stroke: 0.5pt) } }
  for k in range(2, 25, step: 2) { t(k, -0.85, [#k]) }
  t(0.45, -0.5, [0])
  for k in (8, 6, 4, 2, -2, -4, -6, -8) { t(-0.4, k, num(k), anchor: "east") }
  t(0.0, 11.3, [$C$（摄氏度）])
  t(27.0, -0.2, [$t$（小时）], anchor: "west")
  // 虚线
  line(m(0, 6), m(16, 6), stroke: dashed)
  line(m(0, 4), m(13, 4), m(13, 0), stroke: dashed)
  line(m(0, -8), m(4, -8), stroke: dashed)
  // 曲线：按表中各点光滑连接
  let pts = ((0, -2), (2, -6), (4, -8), (6, -6), (8, -3), (10, 0), (12, 3), (14, 5), (16, 6), (18, 4), (20, 0), (22, -3), (24, -4))
  catmull(..pts.map(((a, b)) => m(a, b)), stroke: 1.4pt)
})

// ───────── 习题 2·6 第 4 题的图（无编号）：p.101，气球周围温度 t 与高度 h ─────────
#let fig-ex2-6-4(width: 820 * 0.0072cm) = px-canvas(820, 1280, origin: (446, 995), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(534 + 68.0 * a, 1223 - 17.41 * b)
  let t(a, b, body, anchor: "center") = content(m(a, b), tt(body), anchor: anchor)
  // 网格：h∈[0, 9] 每 0.5 一条，t∈[−50, 8] 每 2° 一条
  for i in range(0, 19) { line(m(i * 0.5, -50), m(i * 0.5, 8), stroke: gridc) }
  for j in range(-25, 5) { line(m(0, 2 * j), m(9, 2 * j), stroke: gridc) }
  rect(m(0, -50), m(9, 8), stroke: 0.8pt)
  line(m(-1.07, 0), m(10.4, 0), stroke: 0.9pt, mark: ar)
  line(m(0, -58.9), m(0, 11.6), stroke: 0.9pt)
  for k in range(0, 10) { t(k, -2.0, [#k]) }
  t(9.35, -2.2, [公里], anchor: "west")
  t(10.7, 0.0, $h$)
  t(-0.5, 12.8, $t degree$)
  for k in (8, 6, 4, 2, -10, -20, -30, -40, -50) { t(-0.15, k, [#num(k)°], anchor: "east") }
  // 曲线：折线连接按网格读出的点
  let pts = ((0, 7.8), (1, 4.5), (2, -2), (3, -3.7), (4, -7.7), (5, -16), (6, -21), (7, -29), (8, -36.3), (9, -50))
  line(..pts.map(((a, b)) => m(a, b)), stroke: 1.3pt)
})
