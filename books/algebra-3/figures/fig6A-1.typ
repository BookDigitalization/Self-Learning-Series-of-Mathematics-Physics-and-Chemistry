#import "/common/series.typ": *
// 第 6 章 A 段的图：图 6·1（p.218）：y=2^x、y=(1/2)^x、y=10^x 三条指数函数的图像。
// 坐标取自 200 dpi 页面的真实像素（y 向下），读图用 --grid 100 的网格图（裁图坐标 + 裁图左上角 (260, 1350) = 页面像素）。
// 原点（坐标轴交点）(497, 1935)；曲线都过 (0, 1)，该点在 y=1895，所以单位长度（纵向）40 px；横向刻度间距也是 40 px。
// 原图是手绘的：曲线按函数的真实解析式画，两端取到扫描上曲线两端的高度：
//   y=2^x 右端在 x≈3.05（y≈8.3）；y=(1/2)^x 左端在 x≈−3.07（y≈8.4）；
//   y=10^x 右端扫描上落在 x≈0.83（y≈10），按解析式 10^x 则 y=10 时 x=1（约 7 px 之差），这里画到 y=10 处，即 x=1。
// 虚线 y=1 取扫描上虚线的两端；纵轴上的短刻度画到 y=9。

#let k = 0.0105cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let dashed = (paint: black, thickness: 0.6pt, dash: "dashed")
#let thick = 1.3pt

#let pline(m, pts, st: thick) = {
  import cetz.draw: *
  line(..pts.map(((x, y)) => m(x, y)), stroke: st)
}
#let curve(m, f, a, b, n: 200, st: thick) = {
  pline(m, range(n + 1).map(i => { let x = a + (b - a) * i / n; (x, f(x)) }), st: st)
}

#let fig-6-1(width: 440 * k) = px-canvas(440, 690, origin: (300, 1390), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (497, 1935, 40, 40)
  let m(x, y) = p(ox + ux * x, oy - uy * y)
  // 坐标轴
  line(p(322, oy), p(705, oy), stroke: 0.6pt, mark: ar)
  line(p(ox, 2052), p(ox, 1412), stroke: 0.6pt, mark: ar)
  // 刻度
  for i in range(-3, 4) { if i != 0 { line(p(ox + ux * i, oy - 4), p(ox + ux * i, oy + 4), stroke: 0.5pt) } }
  for j in range(1, 10) { line(p(ox - 4, oy - uy * j), p(ox + 4, oy - uy * j), stroke: 0.5pt) }
  // 虚线 y = 1
  line(p(320, oy - uy), p(675, oy - uy), stroke: dashed)
  // 三条曲线
  curve(m, x => calc.pow(10, x), -3, 1.0)
  curve(m, x => calc.pow(2, x), -4.3, 3.05)
  curve(m, x => calc.pow(0.5, x), -3.07, 4.3)
  // 标注
  content(p(492, 1403), tt($y$))
  content(p(718, 1937), tt($x$))
  content(p(508, 1950), tt[0])
  content(p(555, 1502), tt($y = 10^x$))
  content(p(370, 1555), tt($y = (1 / 2)^x$))
  content(p(670, 1608), tt($y = 2^x$))
  content(p(668, 1877), tt($y = 1$))
})
