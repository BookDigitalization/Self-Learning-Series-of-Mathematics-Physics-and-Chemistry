#import "/common/series.typ": *
// 第 3 章 B 段（§3·2、§3·3）的直线图：图 3·10–3·14。
// 图 3·10、3·11 的坐标取自 200 dpi 页面图（render-pages.py --dpi 200 --grid 100）的真实像素（y 向下），
// 每单位 50 px；图 3·12–3·14 取自 130 dpi 页面图，每单位 33 px（图 3·14 为 66 px）。
// 直线都用解析式画，端点按扫描上直线两端的位置取；点位、刻度、标注位置按网格图读出，未做更精的量度。

#let k200 = 0.0088cm
#let k130 = 0.0135cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let dashed = (paint: black, thickness: 0.6pt, dash: "dashed")
#let thick = 1.3pt

// ───────── 图 3·10：p.123，y = 2x 与 y = 2x + 2 ─────────
#let fig-3-10(width: 760 * k200) = px-canvas(760, 790, origin: (500, 860), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(860 + 50 * a, 1313 - 50 * b)
  let ring(a, b) = circle(m(a, b), radius: 4.5 * u, fill: white, stroke: 0.6pt)
  line(p(510, 1313), p(1235, 1313), stroke: 0.6pt, mark: ar)
  line(m(0, -6.5), m(0, 8.1), stroke: 0.6pt, mark: ar)
  for k in range(-6, 8) { if k != 0 { line(m(k, -0.1), m(k, 0.1), stroke: 0.5pt) } }
  for k in range(-6, 8) { if k != 0 { line(m(-0.1, k), m(0.1, k), stroke: 0.5pt) } }
  // 虚线
  line(m(2, 0), m(2, 6), stroke: dashed)
  line(m(1, 0), m(1, 4), stroke: dashed)
  line(m(-1, 0), m(-1, -2), stroke: dashed)
  line(m(-2, 0), m(-2, -4), stroke: dashed)
  // y = 2x + 2 与 y = 2x
  line(m(-3.75, -5.5), m(2.5, 7), stroke: thick)
  line(m(-2.9, -5.8), m(3.5, 7), stroke: thick)
  for (a, b) in ((2, 6), (0, 2), (-1, 0), (-2, -2), (2, 4), (0, 0), (-1, -2), (-2, -4)) { ring(a, b) }
  content(p(853, 868), tt($y$))
  content(p(1252, 1310), tt($x$))
  content(p(874, 1329), tt($O$))
  content(p(972, 934), tt($y = 2x + 2$))
  content(p(1090, 970), tt($y = 2x$))
})

// ───────── 图 3·11：p.124，y = 2x 与 y = 2x − 2 ─────────
#let fig-3-11(width: 720 * k200) = px-canvas(720, 810, origin: (540, 300), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(856 + 50 * a, 726 - 50 * b)
  let ring(a, b) = circle(m(a, b), radius: 4.5 * u, fill: white, stroke: 0.6pt)
  line(p(554, 726), p(1196, 726), stroke: 0.6pt, mark: ar)
  line(m(0, -7.4), m(0, 7.3), stroke: 0.6pt, mark: ar)
  for k in range(-6, 7) { if k != 0 { line(m(k, -0.1), m(k, 0.1), stroke: 0.5pt) } }
  for k in range(-7, 8) { if k != 0 { line(m(-0.1, k), m(0.1, k), stroke: 0.5pt) } }
  // 虚线
  line(m(2, 0), m(2, 4), stroke: dashed)
  line(m(1, 0), m(1, 2), stroke: dashed)
  line(m(-1, 0), m(-1, -4), stroke: dashed)
  line(m(-2, 0), m(-2, -6), stroke: dashed)
  // y = 2x 与 y = 2x − 2
  line(m(-3.05, -6.1), m(2.9, 5.8), stroke: thick)
  line(m(-2.6, -7.2), m(3.5, 5.0), stroke: thick)
  for (a, b) in ((2, 4), (1, 2), (0, 0), (-1, -2), (2, 2), (1, 0), (0, -2), (-2, -6)) { ring(a, b) }
  content(p(853, 320), tt($y$))
  content(p(1215, 724), tt($x$))
  content(p(842, 712), tt($O$))
  content(p(996, 409), tt($y = 2x$))
  content(p(1111, 466), tt($y = 2x - 2$))
})

// ───────── 图 3·12：p.125，y = ½x + 3/2 ─────────
#let fig-3-12(width: 600 * k130) = px-canvas(600, 500, origin: (280, 180), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(563 + 33 * a, 462 - 33 * b)
  line(p(298, 463), p(820, 461), stroke: 0.6pt, mark: ar)
  line(m(0, -5.7), m(0, 7.2), stroke: 0.6pt, mark: ar)
  for k in range(-7, 8) { if k != 0 { line(m(k, -0.12), m(k, 0.12), stroke: 0.5pt) } }
  for k in range(-5, 8) { if k != 0 { line(m(-0.12, k), m(0.12, k), stroke: 0.5pt) } }
  line(m(-6.3, -1.65), m(6.3, 4.65), stroke: thick)
  for (a, b) in ((1, 2), (3, 3)) { circle(m(a, b), radius: 3 * u, fill: black, stroke: none) }
  content(p(563, 198), tt($y$))
  content(p(846, 461), tt($x$))
  content(p(553, 472), tt($O$))
  content(p(768, 280), tt($y = 1/2 x + 3/2$))
})

// ───────── 图 3·13：p.126，y = 3x + 2 与 y = −3x + 2 ─────────
#let fig-3-13(width: 850 * k130) = px-canvas(850, 505, origin: (110, 905), width: width, (p, u) => {
  import cetz.draw: *
  // 左：y = 3x + 2，原点 (299, 1195)
  let ml = (a, b) => p(299 + 33 * a, 1195 - 33 * b)
  line(p(120, 1193), p(510, 1193), stroke: 0.6pt, mark: ar)
  line(ml(0, -6.2), ml(0, 7.9), stroke: 0.6pt, mark: ar)
  for k in range(-5, 7) { if k != 0 { line(ml(k, -0.12), ml(k, 0.12), stroke: 0.5pt) } }
  for k in range(-6, 8) { if k != 0 { line(ml(-0.12, k), ml(0.12, k), stroke: 0.5pt) } }
  line(ml(-2.0, -4), ml(1.45, 6.35), stroke: thick)
  content(p(297, 925), tt($y$))
  content(p(520, 1193), tt($x$))
  content(p(309, 1205), tt($O$))
  content(p(370, 968), tt($y = 3x + 2$))
  // 右：y = −3x + 2，原点 (735, 1195)
  let mr = (a, b) => p(735 + 33 * a, 1195 - 33 * b)
  line(p(552, 1197), p(920, 1195), stroke: 0.6pt, mark: ar)
  line(mr(0, -6.0), mr(0, 7.5), stroke: 0.6pt, mark: ar)
  for k in range(-5, 7) { if k != 0 { line(mr(k, -0.12), mr(k, 0.12), stroke: 0.5pt) } }
  for k in range(-6, 8) { if k != 0 { line(mr(-0.12, k), mr(0.12, k), stroke: 0.5pt) } }
  line(mr(-1.2, 5.6), mr(2.12, -4.25), stroke: thick)
  content(p(735, 938), tt($y$))
  content(p(945, 1195), tt($x$))
  content(p(727, 1207), tt($O$))
  content(p(668, 985), tt($y = -3x + 2$))
})

// ───────── 图 3·14：p.130，y = ½x + 3/2 过 A(1, 2)、B(−1, 1) ─────────
#let fig-3-14(width: 650 * k130) = px-canvas(650, 500, origin: (200, 900), width: width, (p, u) => {
  import cetz.draw: *
  let m = (a, b) => p(540 + 66 * a, 1192 - 66 * b)
  line(p(222, 1193), p(803, 1190), stroke: 0.6pt, mark: ar)
  line(m(0, -3), m(0, 3.7), stroke: 0.6pt, mark: ar)
  for k in range(-4, 4) { if k != 0 { line(m(k, -0.06), m(k, 0.06), stroke: 0.5pt) } }
  for k in range(-3, 4) { if k != 0 { line(m(-0.06, k), m(0.06, k), stroke: 0.5pt) } }
  line(m(-3.9, -0.45), m(2.7, 2.85), stroke: thick)
  for (a, b) in ((1, 2), (-1, 1)) { circle(m(a, b), radius: 3 * u, fill: black, stroke: none) }
  content(p(539, 921), tt($y$))
  content(p(822, 1190), tt($x$))
  content(p(535, 1200), tt($O$))
  content(p(607, 1209), tt[1])
  content(p(553, 1127), tt[1])
  content(p(610, 1077), tt($A$))
  content(p(470, 1112), tt($B$))
  content(p(738, 969), tt($y = 1/2 x + 3/2$))
})
