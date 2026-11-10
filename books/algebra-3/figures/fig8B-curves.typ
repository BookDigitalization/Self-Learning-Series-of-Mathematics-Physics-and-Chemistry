#import "/common/series.typ": *
// 第 8 章 B 段（*§8·3）的图象解法两幅图：图 8·2（原书 p.290）、图 8·3（原书 p.291）。
// 坐标取自 200 dpi 页面的真实像素（y 向下），在 400 dpi 局部裁图上量取（真实坐标 = 裁图起点 + 裁图像素 / 2）。
// 原图是手绘的，做法同第 6 章图：
//   · 坐标轴、虚线、标注的位置按扫描量取；单位长度取扫描上刻度的间距（两幅图都约 38.4 像素）；原点取坐标轴交点；
//   · 曲线按函数的真实解析式画，两端取到扫描上曲线两端的位置；
//   · 两条坐标轴的两端在扫描上都是箭头形（正方向一端较大），这里两端都画小箭头。

#let k = 0.0105cm
#let ar2 = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let dashed = (paint: black, thickness: 0.6pt, dash: "dashed")
#let thick = 1.3pt

// 沿一列点画折线
#let pline(m, pts, st: thick) = {
  import cetz.draw: *
  line(..pts.map(((x, y)) => m(x, y)), stroke: st)
}
// 沿解析式画曲线（均匀取点）
#let curve(m, f, a, b, n: 240, st: thick) = {
  pline(m, range(n + 1).map(i => { let x = a + (b - a) * i / n; (x, f(x)) }), st: st)
}
// 对数曲线：真数按几何级数取点，靠近 u 轴的一段取得更密
#let lcurve(m, f, a, b, n: 240, st: thick) = {
  pline(m, range(n + 1).map(i => { let x = a * calc.pow(b / a, i / n); (x, f(x)) }), st: st)
}

// ───────── 图 8·2：u = 2^x 和 u = 4x（原书 p.290）─────────
// 原点 (430, 1877.5)，两个方向的单位都是 38.4。x 轴上刻度 −3…4，u 轴上刻度 1…17（u=1 处刻度被曲线盖住）。
// 曲线 u = 2^x 取 −3.0 ≤ x ≤ 4.14；直线 u = 4x 取 −0.34 ≤ x ≤ 4.5。
#let fig-8-2(width: 520 * k) = px-canvas(520, 870, origin: (250, 1085), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (430, 1877.5, 38.4)
  let m(x, y) = p(ox + s * x, oy - s * y)
  line(p(260, oy), p(712, oy), stroke: 0.6pt, mark: ar2)
  line(p(ox, 1930), p(ox, 1127), stroke: 0.6pt, mark: ar2)
  for i in range(-3, 5) { if i != 0 { line(p(ox + s * i, oy - 5), p(ox + s * i, oy + 5), stroke: 0.5pt) } }
  for j in range(1, 18) { line(p(ox - 5, oy - s * j), p(ox + 5, oy - s * j), stroke: 0.5pt) }
  curve(m, x => calc.pow(2, x), -3.0, 4.14)
  curve(m, x => 4 * x, -0.34, 4.5, n: 2)
  content(p(422, 1100), tt($u$))
  content(p(735, oy), tt($x$))
  content(p(446, 1893), tt[0])
  content(p(655, 1183), tt($u = 4x$))
  content(p(626, 1355), tt($u = 2^x$))
})

// ───────── 图 8·3：u = log₂x 和 u = 4 − x/2（原书 p.291）─────────
// 原点 (512.5, 1342.5)，两个方向的单位都是 38.4。x 轴上刻度 1…16，u 轴上刻度 −3…4；
// x = 4 处从交点 (4, 2) 到 x 轴一段竖虚线。
// 曲线 u = log₂x 取 0.125 ≤ x ≤ 16.6；直线 u = 4 − x/2 取 −1.49 ≤ x ≤ 12.4。
#let fig-8-3(width: 890 * k) = px-canvas(890, 480, origin: (400, 1045), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (512.5, 1342.5, 38.4)
  let m(x, y) = p(ox + s * x, oy - s * y)
  line(p(408, oy), p(1250, oy), stroke: 0.6pt, mark: ar2)
  line(p(ox, 1497), p(ox, 1078), stroke: 0.6pt, mark: ar2)
  for i in range(1, 17) { line(p(ox + s * i, oy - 5), p(ox + s * i, oy + 5), stroke: 0.5pt) }
  for j in range(-3, 5) { if j != 0 { line(p(ox - 5, oy - s * j), p(ox + 5, oy - s * j), stroke: 0.5pt) } }
  line(m(4, 2), m(4, 0), stroke: dashed)
  curve(m, x => 4 - x / 2, -1.49, 12.4, n: 2)
  lcurve(m, x => calc.log(x, base: 2), 0.125, 16.6)
  content(p(ox, 1058), tt($u$))
  content(p(1265, oy), tt($x$))
  content(p(500, 1356), tt[0])
  content(p(1120, 1163), tt($u = log_2 x$))
  content(p(1068, 1443), tt($u = 4 - 1 / 2 x$))
})
