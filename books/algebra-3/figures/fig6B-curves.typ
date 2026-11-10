#import "/common/series.typ": *
// 第 6 章 B 段（§6·3、§6·4）的曲线图：图 6·2（p.227）、图 6·3（p.233）、图 6·4（p.234）。
// 坐标取自 200 dpi 页面的真实像素（y 向下），读图用 --grid 100 的网格图（显示宽 1596，真实宽 1654，乘 1.04）。
// 原图是手绘的：刻度间距、曲线两端的伸展和单位长度都不严格，这里的做法：
//   · 坐标轴、虚线、标注的位置按扫描量取；单位长度取扫描上刻度的间距；原点取坐标轴交点；
//   · 曲线按函数的真实解析式画，两端取到扫描上曲线两端的位置。

#let k = 0.0105cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let dashed = (paint: black, thickness: 0.6pt, dash: "dashed")
#let dashdot = (paint: black, thickness: 0.9pt, dash: "dash-dotted")
#let thick = 1.3pt

// 沿一列点画折线
#let pline(m, pts, st: thick) = {
  import cetz.draw: *
  line(..pts.map(((x, y)) => m(x, y)), stroke: st)
}
// 沿解析式画曲线（均匀取点）
#let curve(m, f, a, b, n: 200, st: thick) = {
  pline(m, range(n + 1).map(i => { let x = a + (b - a) * i / n; (x, f(x)) }), st: st)
}
// 对数曲线：真数按几何级数取点，靠近 y 轴的一段取得更密
#let lcurve(m, f, a, b, n: 240, st: thick) = {
  pline(m, range(n + 1).map(i => { let x = a * calc.pow(b / a, i / n); (x, f(x)) }), st: st)
}

// ───────── 图 6·2：y = 2^x，直线 y = 5 与交点（p.227）─────────
// 原点 (1182, 1167)，x 方向单位 40，y 方向单位 38.8；x≈2.3 处竖虚线，y=5 处横虚线。
#let fig-6-2(width: 470 * k) = px-canvas(470, 600, origin: (1000, 700), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1182, 1167, 40, 38.8)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  line(p(1017, oy), p(1435, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1271), p(ox, 718), stroke: 0.6pt, mark: ar)
  for i in range(-4, 6) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-2, 9) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  // y = 5 的横虚线与过交点的竖虚线
  line(p(1059, 973), p(1347, 973), stroke: dashed)
  line(p(1274, 973), p(1274, oy), stroke: dashed)
  curve(m, x => calc.pow(2, x), -2.9, 3.15)
  content(p(1182, 705), tt($y$))
  content(p(1432, oy), tt($x$))
  content(p(1198, 1182), tt[0])
})

// ───────── 图 6·3：y = 2^x 与 y = log₂x（p.233）─────────
// 原点 (636, 1966)，单位 39.4。点划线 y = x 按扫描上两端 (530, 2101)、(922, 1680) 画。
#let fig-6-3(width: 630 * k) = px-canvas(630, 670, origin: (470, 1500), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (636, 1966, 39.4, 39.4)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  line(p(487, oy), p(1056, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 2148), p(ox, 1534), stroke: 0.6pt, mark: ar)
  for i in range(-3, 11) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-4, 10) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(p(530, 2101), p(922, 1680), stroke: dashdot)
  curve(m, x => calc.pow(2, x), -2.8, 3.05)
  lcurve(m, x => calc.log(x, base: 2), 0.23, 8.2)
  content(p(629, 1515), tt($y$))
  content(p(1078, oy), tt($x$))
  content(p(650, 1981), tt[0])
  content(p(762, 1602), tt($y = 2^x$))
  content(p(1030, 1841), tt($y = log_2 x$))
})

// ───────── 图 6·4：y = log₂x、y = log₁₀x、y = log_{1/2}x（p.234）─────────
// 原点 (647, 657)，x 方向单位 39.5，y 方向单位 38；x = 1 处竖虚线（下端标“1”）。
#let fig-6-4(width: 600 * k) = px-canvas(600, 455, origin: (570, 395), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (647, 657, 39.5, 38)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  line(p(577, oy), p(1134, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 832), p(ox, 432), stroke: 0.6pt, mark: ar)
  for i in range(1, 13) { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) }
  for j in range(-4, 4) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(p(686, 832), p(686, 458), stroke: dashed)
  lcurve(m, x => calc.log(x, base: 2), 0.044, 8.8)
  lcurve(m, x => calc.log(x, base: 10), 0.03, 10.4)
  lcurve(m, x => -calc.log(x, base: 2), 0.12, 9.0)
  content(p(652, 398), tt($y$))
  content(p(1152, 666), tt($x$))
  content(p(634, 674), tt[0])
  content(p(686, 842), tt[1])
  content(p(1071, 544), tt($y = log_2 x$))
  content(p(1139, 628), tt($y = log_10 x$))
  content(p(1078, 796), tt($y = log_(1/2) x$))
})
