#import "/common/series.typ": *
// 第 4 章 B 段（§4·3、§4·5）的抛物线图：图 4·10–4·14。
// 坐标取自 200 dpi 页面的真实像素（y 向下），读图用 --grid 100 的网格图并放大裁图（真实坐标，不是缩小显示的数）。
// 原图是手绘的：坐标轴刻度间距、点位有 1–2 个像素格的偏差。这里的做法：
//   · 坐标轴、对称轴、水平虚线的位置、端点按扫描量取；
//   · 单位长度取扫描上刻度的间距（x 方向约 38.5–39 px，y 方向约 36–40 px），原点取坐标轴交点；
//   · 曲线按函数的真实解析式画，描出的点是表里的点（空心圈），曲线两端取到扫描上曲线两端的高度（图 4·14 见该图注释）。
// 图 4·10：p.154，y = x² − x + 2；图 4·11：p.155，y = 3 − 4x − 2x²；图 4·12：p.158，y = −2x² + 8x − 5；
// 图 4·13：p.160，y = x² − x + 2；图 4·14：p.160，y = 3 − 4x − 2x²。

#let k = 0.0105cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let dashed = (paint: black, thickness: 0.6pt, dash: "dashed")
#let thick = 1.3pt

// 沿解析式画曲线（折线逼近，点取得足够密）
#let curve(m, f, a, b, n: 120) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => {
    let x = a + (b - a) * i / n
    m(x, f(x))
  })
  line(..pts, stroke: thick)
}

// ───────── 图 4·10：y = x² − x + 2（p.154）─────────
// 原点 (457.5, 2001)，单位 38.7 × 36；顶点 (1/2, 7/4)；描出 x = 1/2, 1, 3/2, 2, 5/2, 3 六个点。
#let fig-4-10(width: 540 * k) = px-canvas(540, 690, origin: (230, 1450), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (457.5, 2001, 38.7, 36)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let f(x) = x * x - x + 2
  line(p(251, oy), p(715, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 2114), p(ox, 1498), stroke: 0.6pt, mark: ar)
  for i in range(-4, 5) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-2, 12) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  // 对称轴 x = 1/2 与水平线 y = 7/4
  line(p(475, 2114), p(475, 1514), stroke: dashed)
  line(p(253, 1944), p(694, 1944), stroke: dashed)
  // 过各点的水平虚线（从曲线左半支上对称的点画到所描的点）
  for x in (1, 1.5, 2, 2.5, 3) { line(m(1 - x, f(x)), m(x, f(x)), stroke: dashed) }
  curve(m, f, -2.7, 3.7)
  for x in (0.5, 1, 1.5, 2, 2.5, 3) { circle(m(x, f(x)), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
  content(p(455, 1469), tt($y$))
  content(p(741, 2014), tt($x$))
  content(p(445, 2024), tt($O$))
  content(p(425, 1970), tt($A$))
  content(p(526, 1971), tt($x = 1/2$))
  content(p(738, 1948), tt($y = 7/4$))
})

// ───────── 图 4·11：y = 3 − 4x − 2x²（p.155）─────────
// 原点 (1103.75, 1855)，单位 38.8 × 39.8；顶点 (−1, 5)；描出 (0, 3)、(1/2, 1/2)、(1, −3)、(3/2, −15/2)。
// 原图按（印错的）表值 −6½ 把 x = 3/2 的点画在 y = −6.5，已随表订正为 y = −7.5（在曲线上，见 REVISIONS.md）；
// 曲线两端相应取到 x = −1 ± 2.55（y ≈ −8），使该点落在曲线上。
#let fig-4-11(width: 540 * k) = px-canvas(540, 700, origin: (880, 1520), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1103.75, 1855, 38.8, 39.8)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let f(x) = 3 - 4 * x - 2 * x * x
  line(p(899, oy), p(1360, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 2207), p(ox, 1547), stroke: 0.6pt, mark: ar)
  for i in range(-3, 4) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-7, 6) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(m(-1, -7.8), m(-1, 7.7), stroke: dashed)
  line(p(894, 1656), p(1300, 1656), stroke: dashed)
  for (x, y) in ((0, 3), (0.5, 0.5), (1, -3), (1.5, -7.5)) { line(m(-2 - x, y), m(x, y), stroke: dashed) }
  curve(m, f, -1 - 2.55, -1 + 2.55)
  for (x, y) in ((-1, 5), (0, 3), (0.5, 0.5), (1, -3), (1.5, -7.5)) { circle(m(x, y), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
  content(p(1099, 1522), tt($y$))
  content(p(1385, 1855), tt($x$))
  content(p(1115, 1869), tt($O$))
})

// ───────── 图 4·12：y = −2x² + 8x − 5（p.158）─────────
// 原点 (451, 1315.6)，单位 39 × 36；顶点 (2, 3)；描出 (0, −5)、(1, 1)、(2, 3)、(3, 1)。
#let fig-4-12(width: 520 * k) = px-canvas(520, 620, origin: (250, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (451, 1315.6, 39, 36)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let f(x) = -2 * x * x + 8 * x - 5
  line(p(266, oy), p(716, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1605), p(ox, 1036), stroke: 0.6pt, mark: ar)
  for i in range(-4, 7) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-7, 10) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(p(ox + 2 * ux, 1599), p(ox + 2 * ux, 1046), stroke: dashed)
  curve(m, f, -0.1, 4.1)
  for (x, y) in ((0, -5), (1, 1), (2, 3), (3, 1)) { circle(m(x, y), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
  content(p(453, 1017), tt($y$))
  content(p(739, 1317), tt($x$))
  content(p(437, 1335), tt($O$))
})

// ───────── 图 4·13：y = x² − x + 2（p.160）─────────
// 原点 (511, 1013.3)，单位 39 × 38；对称轴 x = 1/2、水平线 y = 7/4；曲线上没有描点。
#let fig-4-13(width: 530 * k) = px-canvas(530, 620, origin: (280, 555), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (511, 1013.3, 39, 38)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let f(x) = x * x - x + 2
  line(p(293, oy), p(753, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1153), p(ox, 593), stroke: 0.6pt, mark: ar)
  for i in range(-2, 6) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-3, 11) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(p(ox + 0.5 * ux, 1153), p(ox + 0.5 * ux, 617), stroke: dashed)
  line(p(293, oy - 1.75 * uy), p(723, oy - 1.75 * uy), stroke: dashed)
  curve(m, f, -2.2, 3.2)
  content(p(650, 650), tt($y = x^2 - x + 2$))
  content(p(512, 567), tt($y$))
  content(p(778, 1015), tt($x$))
  content(p(497, 1028), tt($O$))
})

// ───────── 图 4·14：y = 3 − 4x − 2x²（p.160）─────────
// 原点 (1122, 856.7)，单位 38.5 × 37.3；对称轴 x = −1、水平线 y = 5。
// 扫描上曲线是手绘的，下半部比解析式更陡更窄（两端在 y ≈ −10.6，横向比解析式窄约 15 px）；这里按解析式画，
// 向下画到扫描上曲线末端的高度（y = −10.6，x = −1 ± 2.79）。
#let fig-4-14(width: 490 * k) = px-canvas(490, 770, origin: (900, 500), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1122, 856.7, 38.5, 37.3)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let f(x) = 3 - 4 * x - 2 * x * x
  line(p(913, oy), p(1340, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1225), p(ox, 555), stroke: 0.6pt, mark: ar)
  for i in range(-4, 4) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-12, 7) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(p(ox - ux, 1220), p(ox - ux, 583), stroke: dashed)
  line(p(913, oy - 5 * uy), p(1300, oy - 5 * uy), stroke: dashed)
  curve(m, f, -3.79, 1.79)
  content(p(1115, 527), tt($y$))
  content(p(1355, 853), tt($x$))
  content(p(1137, 869), tt($O$))
})
