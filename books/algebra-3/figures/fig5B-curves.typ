#import "/common/series.typ": *
// 第 5 章 B 段（§5·3–§5·5）的曲线图：图 5·6（p.194）、图 5·7（p.197）、图 5·8（p.199）、图 5·9（p.200）。
// 坐标取自 200 dpi 页面的真实像素（y 向下），读图用 --grid 100 的网格图裁出的局部图（缩放 1.0，裁图坐标 + 裁图左上角 = 页面像素）。
// 原图是手绘的：坐标轴刻度间距、点位有 1–2 个像素格的偏差，曲线两端的伸展不对称。这里的做法：
//   · 坐标轴、虚线、标注的位置按扫描量取；单位长度取扫描上刻度的间距；原点取坐标轴交点；
//   · 曲线按函数的真实解析式画，两端取到扫描上曲线两端的位置（左右、上下按对称取）；
//   · 原图上描出的点（空心圈）：图 5·6 只在 (1/2, 2)、(2, 1/2)、(4, 1/4) 三处看得清，其余按扫描不加。

#let k = 0.0105cm
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
#let curve(m, f, a, b, n: 160, st: thick) = {
  pline(m, range(n + 1).map(i => { let x = a + (b - a) * i / n; (x, f(x)) }), st: st)
}

// ───────── 图 5·6：y = 1/x（p.194）─────────
// 原点 (522, 1933)，单位 39.5 × 39.5。第一象限曲线从 x≈0.22 画到 x≈4.6，第三象限对称。
// 虚线：原点到 (1/2, 2)、(1, 1)，以及对称的 (−1/2, −2)、(−1, −1)。
#let fig-5-6(width: 590 * k) = px-canvas(590, 590, origin: (260, 1600), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (522, 1933, 39.5, 39.5)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let f(x) = 1 / x
  line(p(280, oy), p(812, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 2178), p(ox, 1648), stroke: 0.6pt, mark: ar)
  for i in range(-6, 8) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-5, 6) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  for (x, y) in ((0.5, 2), (1, 1), (-0.5, -2), (-1, -1)) { line(m(0, 0), m(x, y), stroke: dashed) }
  curve(m, f, 0.22, 4.6)
  curve(m, f, -4.6, -0.22)
  for x in (0.5, 2, 4) { circle(m(x, f(x)), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
  content(p(518, 1620), tt($y$))
  content(p(840, 1933), tt($x$))
  content(p(538, 1947), tt[0])
})

// ───────── 图 5·7：y = k/x，k = ±2、±4（p.197）─────────
// 原点 (785, 970)，单位 39.5 × 39.5。k>0 的两支（第一、三象限）画实线，k<0 的两支（第二、四象限）画虚线（粗虚线）。
// 曲线在 |y| ≤ 5.95、|x| ≤ 5.9 的范围内画。标注与带箭头的引线按扫描量取。
#let fig-5-7(width: 680 * k) = px-canvas(680, 610, origin: (480, 640), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (785, 970, 39.5, 39.5)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let thickdash = (paint: black, thickness: thick, dash: (3pt, 2.2pt))
  line(p(520, oy), p(1078, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1232), p(ox, 675), stroke: 0.6pt, mark: ar)
  for i in range(-6, 7) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for kk in (2, 4) {
    let xa = kk / 5.95
    curve(m, x => kk / x, xa, 5.9)
    curve(m, x => kk / x, -5.9, -xa)
    curve(m, x => -kk / x, xa, 5.9, st: thickdash)
    curve(m, x => -kk / x, -5.9, -xa, st: thickdash)
  }
  let arr(a, b) = line(p(..a), p(..b), stroke: 0.6pt, mark: ar)
  // 标注与引线（页面像素）
  content(p(678, 760), tt($y = -4/x$))
  arr((665, 805), (735, 845))
  content(p(590, 882), tt($y = -2/x$))
  arr((660, 875), (747, 868))
  content(p(865, 760), tt($y = 4/x$))
  arr((860, 805), (842, 850))
  content(p(940, 872), tt($y = 2/x$))
  arr((890, 865), (830, 898))
  content(p(598, 1058), tt($y = 4/x$))
  arr((640, 1068), (700, 1048))
  content(p(705, 1160), tt($y = 2/x$))
  arr((702, 1125), (733, 1035))
  content(p(980, 1055), tt($y = -4/x$))
  arr((930, 1058), (858, 1062))
  content(p(890, 1160), tt($y = -2/x$))
  arr((890, 1125), (825, 1045))
  content(p(778, 655), tt($y$))
  content(p(1110, 965), tt($x$))
  content(p(772, 981), tt[0])
})

// ───────── 图 5·8：y = x^(1/2)（p.199）─────────
// 原点 (550, 610)，单位 38.6（x）× 39.2（y）；x 轴刻度 1–14，y 轴刻度 1–5。曲线从原点画到 x = 14。
// 虚线：x = 5 处竖直线与纵坐标 √5 的水平线。
#let fig-5-8(width: 790 * k) = px-canvas(790, 470, origin: (440, 330), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (550, 610, 38.6, 39.2)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  line(p(468, oy), p(1195, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 770), p(ox, 385), stroke: 0.6pt, mark: ar)
  for i in range(1, 15) { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) }
  for j in range(1, 6) { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) }
  curve(m, x => calc.sqrt(x), 0, 14, n: 200)
  line(m(0, calc.sqrt(5)), m(5, calc.sqrt(5)), stroke: dashed)
  line(m(5, 0), m(5, calc.sqrt(5)), stroke: dashed)
  content(p(547, 350), tt($y$))
  content(p(1210, 600), tt($x$))
  content(p(562, 625), tt[0])
  content(p(743, 637), tt[5])
  content(p(935, 637), tt[10])
})

// ───────── 图 5·9：y = x^(1/3) 与 y = x − 2（p.200）─────────
// 原点 (827, 1240)，单位 34.2（x）× 37（y）；x 轴刻度 −15…14，y 轴刻度 −4…4。
// 曲线 x 从 −13.9 画到 13.9；直线 y = x − 2 取 x ∈ [−2.5, 5.1]。虚线：x = 5 处竖直线与纵坐标 ∛5 的水平线。
// 原图手绘：曲线两端高度、直线的纵截距按解析式取，与扫描有几个像素的差。
#let fig-5-9(width: 1150 * k) = px-canvas(1150, 480, origin: (280, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (827, 1240, 34.2, 37)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  let cbrt(x) = if x >= 0 { calc.root(x, 3) } else { -calc.root(-x, 3) }
  line(p(295, oy), p(1388, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 1420), p(ox, 1040), stroke: 0.6pt, mark: ar)
  for i in range(-15, 15) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(-4, 5) { if j != 0 { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) } }
  line(m(0, cbrt(5)), m(5, cbrt(5)), stroke: dashed)
  line(m(5, 0), m(5, cbrt(5)), stroke: dashed)
  // 曲线：以 t = ∛x 为参数，x = t³，在原点附近点取得足够密
  let tm = calc.root(13.9, 3)
  pline(m, range(-120, 121).map(i => { let t = tm * i / 120; (t * t * t, t) }))
  line(m(-2.5, -4.5), m(5.1, 3.1), stroke: thick)
  content(p(827, 1015), tt($y$))
  content(p(1405, 1222), tt($x$))
  content(p(840, 1247), tt[0])
})
