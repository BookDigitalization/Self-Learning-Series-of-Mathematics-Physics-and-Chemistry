#import "/common/series.typ": *
// 第 5 章 A 段（§5·1、§5·2）的插图：图 5·1（立方体）、图 5·2（y=x³ 与对称点）、图 5·3（y=x³ 与直线交点）、
// 图 5·4（y=x² 与 y=x³ 并排）、图 5·5（有界函数 y=√(25−x²) 的半圆）。
// 坐标取自 200 dpi 页面的真实像素（y 向下）：坐标轴位置、刻度间距由 numpy 在 200 dpi 渲染上检出（脚本在 build/c5A/tools，不入库），
// 端点、标注位置按网格图读出。原图是手绘的：曲线两侧不完全对称、刻度间距有一两个像素格的偏差。
// 曲线的做法：按解析式画（y = x³ 取 dy = A·dx³，y = x² 取 dy = A·dx²，A 按曲线两端的高度拟合），不照手绘的不对称描折线；
// 与扫描最大的出入见各图注释和 CHECKLIST。

#let k = 0.0095cm // 每个 200 dpi 像素的实际长度
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let ar2 = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let thick = 1.3pt
#let thin = 0.6pt
#let dashed = (paint: black, thickness: 0.6pt, dash: (3pt, 2.5pt))
#let dashed-thick = (paint: black, thickness: 1.3pt, dash: (4pt, 2.5pt))

// 沿解析式画曲线（折线逼近）：f 返回页面像素点，参数在 [a, b]
#let curve(f, a, b, n: 160, st: thick) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => f(a + (b - a) * i / n)), stroke: st)
}
// 水平、竖直坐标轴（带箭头）与刻度
#let hax(p, y, x0, x1) = { import cetz.draw: *; line(p(x0, y), p(x1, y), stroke: thin, mark: ar) }
#let vax(p, x, y0, y1) = { import cetz.draw: *; line(p(x, y0), p(x, y1), stroke: thin, mark: ar) }
#let xt(p, xs, y) = { import cetz.draw: *; for x in xs { line(p(x, y - 5), p(x, y + 5), stroke: 0.5pt) } }
#let yt(p, ys, x) = { import cetz.draw: *; for y in ys { line(p(x - 5, y), p(x + 5, y), stroke: 0.5pt) } }
#let dot(p, x, y, u) = { import cetz.draw: *; circle(p(x, y), radius: 5 * u, fill: black, stroke: none) }

// ───────── 图 5·1：p.183，立方体（棱长 l，体积 V） ─────────
// 前面正方形左上 (1037, 488)，边长约 281；后面相对前面偏移 (78, −135)；虚线是看不见的三条棱。
#let fig-5-1(width: 480 * k) = px-canvas(480, 540, origin: (1000, 330), width: width, (p, u) => {
  import cetz.draw: *
  let (fx, fy, s, dx, dy) = (1037, 488, 281, 78, -135)
  let f(i, j) = p(fx + s * i, fy + s * j) // 前面：i 向右、j 向下（0 或 1）
  let b(i, j) = p(fx + s * i + dx, fy + s * j + dy) // 后面
  // 前面正方形
  line(f(0, 0), f(1, 0), f(1, 1), f(0, 1), close: true, stroke: thick)
  // 后面：上边和右边实线
  line(b(0, 0), b(1, 0), b(1, 1), stroke: thick)
  // 四条斜棱：上面两条、右下一条实线，左下一条虚线
  line(f(0, 0), b(0, 0), stroke: thick)
  line(f(1, 0), b(1, 0), stroke: thick)
  line(f(1, 1), b(1, 1), stroke: thick)
  line(f(0, 1), b(0, 1), stroke: dashed-thick)
  // 后面看不见的两条棱（虚线）
  line(b(0, 0), b(0, 1), stroke: dashed-thick)
  line(b(0, 1), b(1, 1), stroke: dashed-thick)
  // 尺寸标注：右侧竖向（高）、右下斜向（深）、下方横向（宽）
  line(p(1424, 355), p(1424, 637), stroke: 0.6pt, mark: ar2)
  line(p(1346, 768), p(1432, 636), stroke: 0.6pt, mark: ar2)
  line(p(1037, 805), p(1318, 805), stroke: 0.6pt, mark: ar2)
  let lab(x, y, body) = content(p(x, y), box(fill: white, inset: (x: 1pt, y: 0pt), tt(body)))
  lab(1424, 490, $l$)
  lab(1388, 728, $l$)
  lab(1178, 806, $l$)
  content(p(1203, 578), tt($V$))
})

// ───────── 图 5·2：p.183，函数 y = x³ 的图像，点 P(x, y)、P′(−x, −y) ─────────
// 原点 (462, 1560)；y 轴刻度间距 35.4、x 轴刻度间距 34.3；曲线 dy = 8.7×10⁻⁴·dx³（像素），
// 左支端点在 dx = −77.8（扫描 −80），右支 dx = 78.8（扫描 79），与手绘有最多约 5 px 的出入。
#let fig-5-2(width: 520 * 0.0085cm) = px-canvas(520, 1000, origin: (200, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (462, 1560)
  let A = 8.7e-4
  let f(dx) = p(ox + dx, oy - A * calc.pow(dx, 3))
  hax(p, oy, 280, 655)
  vax(p, ox, 1990, 1055)
  xt(p, (-3, -2, -1, 1, 2, 3).map(i => ox + 34.3 * i), oy)
  yt(p, range(1, 14).map(i => oy - 35.4 * i), ox)
  yt(p, range(1, 12).map(i => oy + 35.4 * i), ox)
  // 实线、虚线
  line(p(ox, 1303), p(530, 1303), stroke: 0.6pt)
  line(p(ox, 1390), p(520, 1390), stroke: dashed)
  line(p(ox, 1443), p(513, 1443), stroke: dashed)
  line(p(528, 1303), p(528, oy), stroke: dashed)
  line(p(512, 1443), p(512, oy), stroke: dashed)
  curve(f, -77.8, 78.8)
  // 点 P、P′
  let dp = 58.0
  dot(p, ox + dp, oy - A * calc.pow(dp, 3), u)
  dot(p, ox - 57, oy + A * calc.pow(57, 3), u)
  content(p(463, 1033), tt($y$))
  content(p(668, 1560), tt($x$))
  content(p(476, 1573), text(font: fonts.song, size: 7pt, $O$))
  content(p(594, 1391), tt($P(x, y)$))
  content(p(305, 1719), tt($P'(-x, -y)$))
})

// ───────── 图 5·3：p.184，y = x³ 与 y = 5 − (5/3)x 的交点 ─────────
// 原点 (432, 1600)，x 方向刻度间距 34.3，y 方向 34.9；曲线按 y = x³ 画（单位坐标），左支端点取 x = −2.2（扫描约 −2.04，差 5 px），
// 右支取 x = 2.22；直线用扫描上量得的两端点 (358, 1305)、(626, 1741) 连直线（与 y = 5 − (5/3)x 吻合，仅右端差十几个像素）。
#let fig-5-3(width: 530 * 0.0085cm) = px-canvas(530, 920, origin: (230, 1100), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (432, 1600, 34.3, 34.9)
  let f(x) = p(ox + ux * x, oy - uy * calc.pow(x, 3))
  hax(p, oy, 265, 700)
  vax(p, ox, 2000, 1160)
  xt(p, range(-4, 6).filter(i => i != 0).map(i => ox + ux * i), oy)
  yt(p, range(1, 13).map(i => oy - uy * i), ox)
  yt(p, range(1, 12).map(i => oy + uy * i), ox)
  line(p(358, 1305), p(626, 1741), stroke: thick)
  curve(f, -2.2, 2.22)
  content(p(430, 1135), tt($y$))
  content(p(720, 1600), tt($x$))
  content(p(443, 1613), text(font: fonts.song, size: 7pt, $O$))
})

// ───────── 图 5·4：p.186，左 y = x²，右 y = x³ ─────────
// 左：y 轴 x = 578，x 轴 y = 966；抛物线 dy = 0.0256·dx²（以 x = 581 为轴），两端 x = 459、705（扫描 455、700）；
//     x 轴刻度取扫描检出的位置（470、509、545.5、625.5、663、703），y 轴刻度间距 38.4。
// 右：y 轴 x = 1071，x 轴 y = 736；曲线 dy = 8.4×10⁻⁴·dx³，dx 从 −73 到 74（端点高度 1063、396，与扫描一致）；
//     x 轴刻度取扫描位置（957.5、998、1035、1113、1152.5、1191.5），y 轴刻度间距 39.3。
#let fig-5-4(width: 990 * 0.0095cm) = px-canvas(990, 840, origin: (340, 290), width: width, (p, u) => {
  import cetz.draw: *
  // 左图
  let (lx, ly) = (578, 966)
  let fl(x) = p(x, ly - 0.0256 * calc.pow(x - 581, 2))
  hax(p, ly, 360, 815)
  vax(p, lx, 1035, 495)
  xt(p, (470, 509, 545.5, 625.5, 663, 703), ly)
  yt(p, range(1, 13).map(i => ly - 38.4 * i), lx)
  curve(fl, 459, 705)
  content(p(573, 462), tt($y$))
  content(p(845, 962), tt($x$))
  content(p(593, 980), text(font: fonts.song, size: 7pt, $O$))
  content(p(736, 636), tt($y = x^2$))
  // 右图
  let (rx, ry) = (1071, 736)
  let A = 8.4e-4
  let fr(dx) = p(rx + dx, ry - A * calc.pow(dx, 3))
  hax(p, ry, 903, 1285)
  vax(p, rx, 1115, 345)
  xt(p, (957.5, 998, 1035, 1113, 1152.5, 1191.5), ry)
  yt(p, range(1, 10).map(i => ry - 39.3 * i), rx)
  yt(p, range(1, 9).map(i => ry + 39.3 * i), rx)
  curve(fr, -73, 74)
  content(p(1068, 305), tt($y$))
  content(p(1305, 732), tt($x$))
  content(p(1087, 750), text(font: fonts.song, size: 7pt, $O$))
  content(p(1192, 452), tt($y = x^3$))
})

// ───────── 图 5·5：p.188，y = √(25 − x²) 的半圆与直线 y = 5 ─────────
// 原点 (508, 1114)；x 刻度间距 37（±5 在 323、693），y 刻度间距 38.3（5 在 922.5）；半椭圆半轴 188 × 191（取自扫描的端点和顶点高度）。
#let fig-5-5(width: 600 * 0.0095cm) = px-canvas(600, 490, origin: (250, 750), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (508, 1114)
  hax(p, oy, 268, 796)
  vax(p, ox, 1220, 790)
  xt(p, range(-5, 6).filter(i => i != 0).map(i => ox + 37 * i), oy)
  yt(p, range(1, 7).map(i => oy - 38.3 * i), ox)
  line(p(302, 924), p(737, 924), stroke: dashed-thick)
  curve(t => p(ox + 188 * calc.cos(t), oy - 191 * calc.sin(t)), 0, calc.pi, n: 120)
  content(p(510, 768), tt($y$))
  content(p(805, 1115), tt($x$))
  content(p(518, 1130), text(font: fonts.song, size: 7pt, $O$))
  content(p(713, 902), tt($y = 5$))
})
