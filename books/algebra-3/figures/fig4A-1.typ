#import "/common/series.typ": *
// 第 4 章 A 段（§4·1、§4·2）的插图：图 4·1、习题 4·1 第 1 题的圆柱（无编号）、图 4·2–4·9。
// 坐标是 300 dpi 页面像素（y 向下）：轴线、刻度由 numpy 在 300 dpi 渲染上检出（脚本在 build/c4A，不入库），
// 曲线按函数解析式画（单位长度取自刻度间距），曲线端点按扫描上曲线两端的高度取，标注、虚线位置按网格图读出，未做更精的量度。
// 原图是手绘，个别分支与解析式有出入（图 4·9 右支原图偏平，这里按解析式画并取对称范围），见 CHECKLIST。

#let kc = 0.0054cm // 每个 300 dpi 像素的实际长度（约合 130 dpi 页面像素 0.0125 cm）
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let thick = 1.3pt
#let thin = 0.6pt
#let dashc = (paint: black, thickness: 1.3pt, dash: (4pt, 2.5pt)) // 虚线曲线
#let dashl = (paint: black, thickness: 0.5pt, dash: (3pt, 2.5pt)) // 细虚线（辅助线）

// 折线逼近曲线：f(x) 返回页面像素点
#let curve(f, a, b, n: 80, st: thick) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => f(a + (b - a) * i / n)), stroke: st)
}
// 坐标轴
#let hax(p, y, x0, x1) = { import cetz.draw: *; line(p(x0, y), p(x1, y), stroke: thin, mark: ar) }
#let vax(p, x, y0, y1) = { import cetz.draw: *; line(p(x, y0), p(x, y1), stroke: thin, mark: ar) }
#let vax-no(p, x, y0, y1) = { import cetz.draw: *; line(p(x, y0), p(x, y1), stroke: thin) }
#let xticks(p, ox, oy, ux, ks) = {
  import cetz.draw: *
  for k in ks { line(p(ox + ux * k, oy - 6), p(ox + ux * k, oy + 6), stroke: 0.5pt) }
}
#let yticks(p, ox, oy, uy, ks) = {
  import cetz.draw: *
  for k in ks { line(p(ox - 6, oy - uy * k), p(ox + 6, oy - uy * k), stroke: 0.5pt) }
}

// ───────── 图 4·1：p.143，圆环（半径 20 厘米的圆面挖去半径为 x 厘米的圆面） ─────────
#let fig-4-1(width: 660 * kc) = px-canvas(660, 650, origin: (1530, 1920), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, R, r) = (1858, 2241, 309, 109)
  circle(p(cx, cy), radius: R, stroke: thick)
  circle(p(cx, cy), radius: r, stroke: thick)
  // 斜线（向右上倾斜约 70°），按圆环裁剪
  let th = 70deg
  let (dx, dy) = (calc.cos(th), -calc.sin(th))
  let (nx, ny) = (calc.sin(th), calc.cos(th))
  let step = 16
  let s = -R + 6
  while s < R - 4 {
    let ho = calc.sqrt(R * R - s * s) - 2
    let seg(t0, t1) = line(
      p(cx + s * nx + t0 * dx, cy + s * ny + t0 * dy),
      p(cx + s * nx + t1 * dx, cy + s * ny + t1 * dy), stroke: 0.5pt)
    if calc.abs(s) < r {
      let hi = calc.sqrt(r * r - s * s) + 2
      seg(-ho, -hi)
      seg(hi, ho)
    } else {
      seg(-ho, ho)
    }
    s += step
  }
  // 半径 x 与 20 的箭头
  line(p(cx, cy), p(cx + 110, cy + 3), stroke: 0.8pt, mark: ar)
  let (ex, ey) = (cx + 252, cy + 176)
  let k = r / calc.sqrt(252 * 252 + 176 * 176)
  line(p(cx, cy), p(cx + 252 * k, cy + 176 * k), stroke: 0.8pt)
  line(p(cx + 252 * k, cy + 176 * k), p(ex, ey), stroke: (paint: black, thickness: 0.8pt, dash: (3pt, 2pt)), mark: ar)
  content(p(1895, 2213), tt($x$))
  content(p(1985, 2378), tt([20]))
})

// ───────── 习题 4·1 第 1 题：圆柱（无编号） ─────────
#let fig-4-cyl(width: 410 * kc) = px-canvas(410, 700, origin: (1820, 1395), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, a) = (2024, 188)
  let (cy1, b1) = (1482, 78)
  let (cy2, b2) = (2008, 76)
  let pt(cy, b, t) = p(cx + a * calc.cos(t), cy + b * calc.sin(t))
  let arc(cy, b, t0, t1, stroke) = line(..range(41).map(i => pt(cy, b, t0 + (t1 - t0) * i / 40)), stroke: stroke)
  arc(cy1, b1, 0deg, 360deg, thick)               // 上底
  arc(cy2, b2, 0deg, 180deg, thick)               // 下底前半（实线）
  arc(cy2, b2, 180deg, 360deg, (paint: black, thickness: 1.3pt, dash: (5pt, 3pt))) // 下底后半（虚线）
  line(p(cx - a, cy1), p(cx - a, cy2), stroke: thick)
  line(p(cx + a, cy1), p(cx + a, cy2), stroke: thick)
  // r、h 的虚线
  line(p(2021, 1485), p(2208, 1485), stroke: dashl)
  line(p(2021, 1485), p(2021, 2005), stroke: dashl)
  line(p(2021, 2005), p(2208, 2005), stroke: dashl)
  content(p(2097, 1503), tt($r$))
  content(p(2046, 1725), tt($h$))
})

// ───────── 图 4·2：p.145，抛物线 y = x² ─────────
#let fig-4-2(width: 790 * kc) = px-canvas(790, 1235, origin: (1360, 840), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1724, 1929, 51.5, 51.5)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 1367, 2100)
  vax(p, ox, 2068, 895)
  xticks(p, ox, oy, ux, (-4, -3, -2, -1, 1, 2, 3, 4))
  yticks(p, ox, oy, uy, range(1, 17))
  // 虚线 AA′、BB′、CC′、DD′
  for k in (1, 2, 3, 4) { line(m(-k, k * k), m(k, k * k), stroke: dashl) }
  curve(x => m(x, x * x), -4.18, 4.18)
  for k in (1, 2, 3, 4) {
    for s in (-1, 1) { circle(m(s * k, k * k), radius: 7 * u, fill: white, stroke: 0.6pt) }
  }
  // 点名
  for (k, nm, nm2) in ((1, $A$, $A'$), (2, $B$, $B'$), (3, $C$, $C'$), (4, $D$, $D'$)) {
    content(m(k, k * k), anchor: "west", padding: (left: 12 * u), tt(nm))
    content(m(-k, k * k), anchor: "east", padding: (right: 12 * u), tt(nm2))
  }
  content(p(1728, 862), tt($y$))
  content(p(2128, 1942), tt($x$))
  content(p(1706, 1955), tt($O$))
})

// ───────── 图 4·3：p.147，y = 2x²、y = x²、y = ½x² ─────────
#let fig-4-3(width: 750 * kc) = px-canvas(750, 940, origin: (1450, 680), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1720.5, 1495.5, 58, 58)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 1382, 2130)
  vax(p, ox, 1617, 737)
  xticks(p, ox, oy, ux, (-4, -3, -2, -1, 1, 2, 3, 4))
  yticks(p, ox, oy, uy, range(1, 11))
  // 虚线：x = −2、2、2.5、3
  line(m(-2, 0), m(-2, 8), stroke: dashl)
  line(m(2, 0), m(2, 8), stroke: dashl)
  line(m(2.5, 0), m(2.5, 6.25), stroke: dashl)
  line(m(3, 0), m(3, 9), stroke: dashl)
  curve(x => m(x, 2 * x * x), -2.12, 2.12)
  curve(x => m(x, x * x), -3.05, 3.05)
  curve(x => m(x, x * x / 2), -4.1, 4.1)
  content(p(1722, 710), tt($y$))
  content(p(2160, 1498), tt($x$))
  content(p(1705, 1518), tt($O$))
  content(p(1940, 872), tt($y = x^2$))
  content(p(1810, 925), tt($y = 2x^2$))
  content(p(2005, 942), tt($y = 1/2 x^2$))
})

// ───────── 图 4·4：p.148，y = x²（虚线）与 y = −x²（实线） ─────────
#let fig-4-4(width: 910 * kc) = px-canvas(910, 1410, origin: (300, 450), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (716.5, 1217, 59.3, 59)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 314, 1170)
  vax(p, ox, 1840, 509)
  xticks(p, ox, oy, ux, (-3, -2, -1, 1, 2, 3))
  yticks(p, ox, oy, uy, (-9, -8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9))
  line(m(-2, 4), m(-2, -4), stroke: dashl)
  line(m(2, 4), m(2, -4), stroke: dashl)
  line(m(-1, 1), m(-1, -1), stroke: dashl)
  line(m(1, 1), m(1, -1), stroke: dashl)
  curve(x => m(x, x * x), -3.18, 2.97, st: dashc)
  curve(x => m(x, -x * x), -3.18, 2.97)
  content(p(719, 470), tt($y$))
  content(p(1190, 1217), tt($x$))
  content(p(733, 1250), tt($O$))
  content(p(912, 620), tt($y = x^2$))
  content(p(870, 1848), tt($y = -x^2$))
})

// ───────── 图 4·5：p.148，y = ±2x²、y = ±½x² ─────────
#let fig-4-5(width: 890 * kc) = px-canvas(890, 1310, origin: (1310, 520), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1703, 1216, 58.7, 59.3)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 1325, 2110)
  vax(p, ox, 1810, 585)
  xticks(p, ox, oy, ux, (-4, -3, -2, -1, 1, 2, 3, 4))
  yticks(p, ox, oy, uy, (-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8))
  // 虚线：连接对应的点
  for (x, h) in ((-2, 8), (-1.5, 4.5), (-1, 2)) { line(m(x, h), m(x, -h), stroke: dashl) }
  for (x, h) in ((2, 2), (3, 4.5), (4, 8)) { line(m(x, h), m(x, -h), stroke: dashl) }
  curve(x => m(x, 2 * x * x), -2.05, 2.05, st: dashc)
  curve(x => m(x, x * x / 2), -4, 4, st: dashc)
  curve(x => m(x, -2 * x * x), -2.05, 2.05)
  curve(x => m(x, -x * x / 2), -4, 4)
  content(p(1702, 545), tt($y$))
  content(p(2140, 1218), tt($x$))
  content(p(1690, 1245), tt($O$))
  content(p(1820, 678), tt($y = 2x^2$))
  content(p(2050, 755), tt($y = 1/2 x^2$))
  content(p(1812, 1742), tt($y = -2x^2$))
  content(p(2058, 1684), tt($y = -1/2 x^2$))
})

// ───────── 图 4·6：p.149，y = 2x²+1、y = 2x²（虚线）、y = 2x²−3 ─────────
#let fig-4-6(width: 800 * kc) = px-canvas(800, 1120, origin: (1450, 1940), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1768, 2760, 57.5, 57.5)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 1465, 2090)
  vax(p, ox, 3043, 2020)
  xticks(p, ox, oy, ux, (-3, -2, -1, 1, 2, 3))
  yticks(p, ox, oy, uy, (-4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))
  curve(x => m(x, 2 * x * x + 1), -2, 2)
  curve(x => m(x, 2 * x * x), -2, 2, st: dashc)
  curve(x => m(x, 2 * x * x - 3), -2, 2)
  content(p(1782, 1978), tt($y$))
  content(p(2140, 2762), tt($x$))
  content(p(1752, 2788), tt($O$))
  content(p(1925, 2190), tt($y = 2x^2 + 1$))
  content(p(1985, 2362), tt($y = 2x^2$))
  content(p(2005, 2540), tt($y = 2x^2 - 3$))
})

// ───────── 图 4·7：p.151，y = ½(x+1)²（实线）与 y = ½x²（虚线） ─────────
#let fig-4-7(width: 860 * kc) = px-canvas(860, 980, origin: (380, 1720), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (774.5, 2481, 58.4, 58.4)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 390, 1170)
  vax(p, ox, 2685, 1770)
  xticks(p, ox, oy, ux, (-5, -4, -3, -2, 1, 2, 3, 4, 5))
  yticks(p, ox, oy, uy, range(1, 10))
  line(p(713, 1775), p(713, 2690), stroke: (paint: black, thickness: 0.8pt, dash: (6pt, 3pt))) // x = −1
  // 对应点间的短虚线：y = 8、4.5、2
  for (x1, x2, h) in ((-5, -4, 8), (-4, -3, 4.5), (-3, -2, 2), (3, 4, 8), (2, 3, 4.5), (1, 2, 2)) {
    line(m(x1, h), m(x2, h), stroke: dashl)
  }
  curve(x => m(x, (x + 1) * (x + 1) / 2), -5.2, 3.1)
  curve(x => m(x, x * x / 2), -4.2, 4.1, st: dashc)
  content(p(780, 1738), tt($y$))
  content(p(1200, 2482), tt($x$))
  content(p(795, 2505), tt($O$))
  content(p(965, 1915), tt($y = 1/2 (x + 1)^2$))
  content(p(1080, 2080), tt($y = 1/2 x^2$))
})

// ───────── 图 4·8：p.151，y = ½(x−1)²（实线）与 y = ½x²（虚线） ─────────
#let fig-4-8(width: 860 * kc) = px-canvas(860, 930, origin: (1260, 1760), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (1612.5, 2479, 58.4, 58.4)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 1270, 2030)
  vax(p, ox, 2665, 1810)
  xticks(p, ox, oy, ux, (-4, -3, -2, -1, 1, 2, 3, 4))
  yticks(p, ox, oy, uy, range(1, 10))
  line(p(1672, 1855), p(1672, 2665), stroke: (paint: black, thickness: 0.8pt, dash: (6pt, 3pt))) // x = 1
  curve(x => m(x, (x - 1) * (x - 1) / 2), -3.0, 5.2)
  curve(x => m(x, x * x / 2), -4.0, 4.15, st: dashc)
  content(p(1608, 1772), tt($y$))
  content(p(2075, 2478), tt($x$))
  content(p(1593, 2500), tt($O$))
  content(p(1830, 1905), tt($y = 1/2 x^2$))
  content(p(2020, 2155), tt($y = 1/2 (x - 1)^2$))
})

// ───────── 图 4·9：p.152，y = ½(x−1)²+2 与 y = ½(x−1)² ─────────
#let fig-4-9(width: 940 * kc) = px-canvas(940, 970, origin: (320, 1020), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (632, 1788, 58, 59)
  let m = (a, b) => p(ox + ux * a, oy - uy * b)
  hax(p, oy, 335, 1040)
  vax(p, ox, 1978, 1055)
  xticks(p, ox, oy, ux, (-4, -3, -2, -1, 2, 3, 4, 5))
  yticks(p, ox, oy, uy, range(1, 9))
  line(p(688, 1090), p(688, 1975), stroke: (paint: black, thickness: 0.8pt, dash: (6pt, 3pt))) // x = 1
  curve(x => m(x, (x - 1) * (x - 1) / 2 + 2), -3.1, 5.1)
  curve(x => m(x, (x - 1) * (x - 1) / 2), -3.1, 5.1)
  content(p(632, 1038), tt($y$))
  content(p(1085, 1790), tt($x$))
  content(p(610, 1812), tt($O$))
  content(p(985, 1140), tt($y = 1/2 (x - 1)^2 + 2$))
  content(p(1085, 1440), tt($y = 1/2 (x - 1)^2$))
})
