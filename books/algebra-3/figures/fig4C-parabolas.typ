// 图 4·18–4·24（原书 p.167、168、170、171、172）：用二次函数的图像解一元二次方程、不等式。
// 坐标取自 200 dpi 渲染页面的网格图（--grid 100）。读图用的是缩小显示的网格图（显示宽 1596，真实宽 1654），
// 下面的数是“显示图上的像素”（真实像素 = 显示像素 × 1.04）；画布只用相对位置，整体等比缩放，不影响形状。
// 每幅图：先在扫描上量出原点 (ox, oy) 和 x、y 方向的单位长度 (ux, uy)（像素），
// 再按函数的真实解析式画曲线；曲线两端的 x 取值按扫描上曲线端点的位置反推；
// 扫描上坐标轴略有倾斜、刻度间距不很均匀，这里一律按整数刻度均匀画。
// 图 4·24：扫描上对称轴附近有两条很近的虚线，这里只画一条（x=1/2）。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.5)
#let lab(p, x, y, body, size: 8pt) = cetz.draw.content(p(x, y), text(font: fonts.song, size: size, body))
#let dashed = (thickness: 0.6pt, dash: "dashed")

// 坐标轴：xa = (x 轴左端, 右端) 的像素横坐标，ya = (y 轴下端, 上端) 的像素纵坐标；整数刻度；o-pos 为字母 O 的位置
#let axes(p, ox, oy, ux, uy, xa, ya, o-pos: none) = {
  import cetz.draw: *
  line(p(xa.at(0), oy), p(xa.at(1), oy), stroke: 0.6pt, mark: arr)
  line(p(ox, ya.at(0)), p(ox, ya.at(1)), stroke: 0.6pt, mark: arr)
  for k in range(-20, 21) {
    let x = ox + ux * k
    if k != 0 and x > xa.at(0) + 6 and x < xa.at(1) - 14 { line(p(x, oy - 5), p(x, oy + 5), stroke: 0.5pt) }
    let y = oy - uy * k
    if k != 0 and y < ya.at(0) - 6 and y > ya.at(1) + 14 { line(p(ox - 5, y), p(ox + 5, y), stroke: 0.5pt) }
  }
  lab(p, xa.at(1) + 16, oy, $x$)
  lab(p, ox, ya.at(1) - 16, $y$)
  let op = if o-pos == none { (ox - 12, oy + 14) } else { o-pos }
  lab(p, op.at(0), op.at(1), $O$, size: 7pt)
}

// 曲线：y = f(x)，x 从 x0 到 x1，折线逼近
#let curve(p, ox, oy, ux, uy, f, x0, x1, n: 120) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => {
    let x = x0 + (x1 - x0) * i / n
    p(ox + ux * x, oy - uy * f(x))
  })
  line(..pts, stroke: 1.6pt)
}

// 空心圈（交点）
#let ring(p, u, ox, oy, ux, uy, x, y) = cetz.draw.circle(p(ox + ux * x, oy - uy * y), radius: 5 * u, fill: white, stroke: 0.6pt)

// 图 4·18：y = x² − 2x − 3，交 x 轴于 A(−1, 0)、B(3, 0)，顶点 (1, −4)
#let fig-4-18(width: 5.4cm) = px-canvas(540, 720, origin: (250, 1400), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (458, 1785, 38.3, 36)
  axes(p, ox, oy, ux, uy, (270, 735), (2110, 1415), o-pos: (446, 1797))
  line(p(ox + ux, 1430), p(ox + ux, 2010), stroke: dashed)
  line(p(295, oy + 4 * uy), p(710, oy + 4 * uy), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => x * x - 2 * x - 3, -2.05, 4.05)
  ring(p, u, ox, oy, ux, uy, -1, 0)
  ring(p, u, ox, oy, ux, uy, 3, 0)
  lab(p, 433, 1757, $A$)
  lab(p, 560, 1752, $B$)
})

// 图 4·19：y = x² − 2x − 2，交 x 轴于 A、B（横坐标 1 ∓ √3），顶点 (1, −3)
#let fig-4-19(width: 5.2cm) = px-canvas(480, 590, origin: (230, 1500), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (412, 1877, 40, 38)
  axes(p, ox, oy, ux, uy, (250, 680), (2060, 1555), o-pos: (426, 1866))
  line(p(ox + ux, 1580), p(ox + ux, 2065), stroke: dashed)
  line(p(248, oy + 3 * uy), p(670, oy + 3 * uy), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => x * x - 2 * x - 2, -2.15, 4.15)
  ring(p, u, ox, oy, ux, uy, 1 - calc.sqrt(3), 0)
  ring(p, u, ox, oy, ux, uy, 1 + calc.sqrt(3), 0)
  lab(p, 370, 1900, $A$)
  lab(p, 530, 1900, $B$)
})

// 图 4·20：y = x² 与 y = 2x + 2，交点横坐标 1 ∓ √3（≈ −0.7、2.7）
#let fig-4-20(width: 5.6cm) = px-canvas(520, 600, origin: (850, 1480), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1050, 1952, 39, 36.6)
  axes(p, ox, oy, ux, uy, (875, 1295), (2045, 1510), o-pos: (1064, 1966))
  line(p(ox + 2.73 * ux, 1560), p(ox + 2.73 * ux, 2040), stroke: dashed)
  line(p(ox - 0.73 * ux, oy), p(ox - 0.73 * ux, 2015), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => x * x, -3.05, 3.1)
  line(p(ox - 2.05 * ux, oy + 2.1 * uy), p(ox + 4.4 * ux, oy - 10.8 * uy), stroke: 1.6pt)
  ring(p, u, ox, oy, ux, uy, 1 - calc.sqrt(3), 2 * (1 - calc.sqrt(3)) + 2)
  ring(p, u, ox, oy, ux, uy, 1 + calc.sqrt(3), 2 * (1 + calc.sqrt(3)) + 2)
  lab(p, 1182, 1977, $2.7$, size: 7pt)
  lab(p, 1022, 2028, $-0.7$, size: 7pt)
})

// 图 4·21：y = x² − 2x − 3，A(−1, 0)、B(3, 0)，顶点 C(1, −4)；D、E 为曲线上的两点标注
#let fig-4-21(width: 5.4cm) = px-canvas(540, 620, origin: (230, 1150), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (440, 1517, 38.75, 35.8)
  axes(p, ox, oy, ux, uy, (255, 715), (1752, 1195), o-pos: (452, 1530))
  line(p(ox + ux, 1180), p(ox + ux, 1752), stroke: dashed)
  line(p(255, oy + 4 * uy), p(685, oy + 4 * uy), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => x * x - 2 * x - 3, -2.05, 4.05)
  ring(p, u, ox, oy, ux, uy, -1, 0)
  ring(p, u, ox, oy, ux, uy, 3, 0)
  lab(p, 432, 1497, $A$)
  lab(p, 548, 1493, $B$)
  lab(p, 508, 1683, $C$)
  lab(p, 396, 1330, $D$)
  lab(p, 572, 1332, $E$)
})

// 图 4·22：y = x² + 2x − 2，顶点 (−1, −3)
#let fig-4-22(width: 5.6cm) = px-canvas(480, 640, origin: (890, 500), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1102, 915, 37, 37.3)
  axes(p, ox, oy, ux, uy, (905, 1330), (1130, 535), o-pos: (1114, 929))
  line(p(ox - ux, 565), p(ox - ux, 1130), stroke: dashed)
  line(p(903, oy + 3 * uy), p(1297, oy + 3 * uy), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => x * x + 2 * x - 2, -4.2, 2.2)
})

// 图 4·23：y = 2x² − 4x + 3，顶点 (1, 1)，抛物线在 x 轴上方
#let fig-4-23(width: 5.0cm) = px-canvas(500, 680, origin: (270, 1440), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (462, 1930, 43, 44)
  axes(p, ox, oy, ux, uy, (290, 745), (2020, 1500), o-pos: (456, 1944))
  line(p(ox + ux, 1495), p(ox + ux, 2110), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => 2 * x * x - 4 * x + 3, -0.85, 2.85)
})

// 图 4·24：y = 4x² − 4x + 1 = (2x − 1)²，顶点 (1/2, 0)
#let fig-4-24(width: 5.0cm) = px-canvas(480, 680, origin: (900, 1440), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1078, 1918, 47, 48)
  axes(p, ox, oy, ux, uy, (915, 1330), (2015, 1475), o-pos: (1068, 1932))
  line(p(ox + 0.5 * ux, 1490), p(ox + 0.5 * ux, 2055), stroke: dashed)
  curve(p, ox, oy, ux, uy, x => 4 * x * x - 4 * x + 1, -0.85, 1.85)
})
