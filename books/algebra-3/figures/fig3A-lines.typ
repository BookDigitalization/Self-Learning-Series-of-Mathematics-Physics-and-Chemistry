#import "/common/series.typ": *
// 第 3 章 A 段（§3·1）的插图：图 3·1–3·9。
// 坐标取自 200 dpi 网格图（render-pages.py --dpi 200 --grid 100）。网格图在看图工具里缩小显示，
// 下面所有坐标都是“显示图上的坐标”，在 d(x, y) 里统一乘 1.04 换成页面真实像素（y 向下）。
// 点位、刻度间距、箭头、角弧位置均按显示图读出，未做更精的量度；
// 图 3·7、3·8 里的三条直线按原图端点画（原图手画，斜率并不严格是 1/2、1、2），不按解析式。

#let S = 1.04
#let kpx = 0.0088cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let num(k) = if k < 0 [−#calc.abs(k)] else [#k]
#let lw = 1.0pt // 直线、曲线
#let aw = 0.6pt // 坐标轴
#let dashed = (paint: black, thickness: 0.5pt, dash: "dashed")

// 画布：显示图坐标框 (x0, y0)–(x1, y1)；draw 是 (d, u) => { import cetz.draw: *; … }
#let cv(x0, y0, x1, y1, draw) = px-canvas(
  (x1 - x0) * S, (y1 - y0) * S, origin: (x0 * S, y0 * S), width: (x1 - x0) * S * kpx,
  (p, u) => draw((x, y) => p(x * S, y * S), u * S))
// 注意：上面把 u 也乘了 S，使 radius: r * u 里的 r 可以直接写“显示图像素”。

// ───────── 图 3·1：p.110，火车速度的数轴 ─────────
#let fig-3-1(width: 1070 * kpx) = cv(270, 1740, 1380, 1880, (d, u) => {
  import cetz.draw: *
  line(d(330, 1829), d(1330, 1829), stroke: aw, mark: ar)
  for (x, k) in ((478, -60), (585, -40), (695, -20), (806, 0), (908, 20), (1020, 40), (1130, 60)) {
    line(d(x, 1823), d(x, 1835), stroke: 0.5pt)
    content(d(x, 1851), tt(num(k)))
  }
  content(d(298, 1825), tt[西])
  content(d(1356, 1836), tt[东])
  // 速度箭头：自 0 向西，长 40 公里/小时
  line(d(806, 1795), d(582, 1795), stroke: 0.6pt, mark: ar)
  line(d(806, 1786), d(806, 1810), stroke: 0.6pt)
  content(d(670, 1757), tt[$v = -40$ 公里/小时])
})

// ───────── 图 3·2：p.113，y = 2x ─────────
#let fig-3-2(width: 700 * kpx) = cv(500, 430, 1180, 1210, (d, u) => {
  import cetz.draw: *
  let m = (a, b) => d(780 + 48.4 * a, 860 - 48.5 * b)
  line(d(510, 862), d(1130, 860), stroke: aw, mark: ar)
  line(d(779, 1192), d(780, 485), stroke: aw, mark: ar)
  for k in range(-4, 5) {
    if k != 0 {
      line(m(k, -0.1), m(k, 0.1), stroke: 0.5pt)
      line(m(-0.1, k), m(0.1, k), stroke: 0.5pt)
      content(m(k, -0.55), tt(num(k)))
    }
  }
  for k in (1, 2, 3, 4) { content(m(-0.45, k), tt[#k]) }
  for k in (-1, -2, -3, -4) { content(m(0.55, k), tt(num(k))) }
  content(d(793, 877), tt[0])
  content(d(1148, 860), tt($x$))
  content(d(776, 445), tt($y$))
  line(d(635, 1155), d(930, 567), stroke: lw)
  for a in (-2, -1, 0, 1, 2) { circle(m(a, 2 * a), radius: 4.5 * u, fill: white, stroke: 0.5pt) }
})

// ───────── 图 3·3：p.113，y = −2x ─────────
#let fig-3-3(width: 700 * kpx) = cv(510, 1320, 1260, 2100, (d, u) => {
  import cetz.draw: *
  let m = (a, b) => d(820 + 49 * a, 1763 - 50 * b)
  line(d(518, 1767), d(1220, 1757), stroke: aw, mark: ar)
  line(d(814, 2075), d(814, 1380), stroke: aw, mark: ar)
  for k in range(-4, 5) {
    if k != 0 {
      line(m(k, -0.1), m(k, 0.1), stroke: 0.5pt)
      line(m(-0.1, k), m(0.1, k), stroke: 0.5pt)
      content(m(k, -0.55), tt(num(k)))
    }
  }
  for k in (1, 2, 3, 4) { content(m(0.45, k), tt[#k]) }
  for k in (-1, -2, -3, -4) { content(m(-0.55, k), tt(num(k))) }
  content(d(832, 1777), tt[0])
  content(d(1240, 1755), tt($x$))
  content(d(812, 1342), tt($y$))
  line(d(670, 1478), d(963, 2037), stroke: lw)
  for a in (-2, -1, 0, 1, 2) { circle(m(a, -2 * a), radius: 4.5 * u, fill: white, stroke: 0.5pt) }
})

// ───────── 图 3·4：p.114，证明用图（k > 0） ─────────
#let fig-3-4(width: 700 * kpx) = cv(480, 1250, 1180, 2040, (d, u) => {
  import cetz.draw: *
  line(d(520, 1708), d(1140, 1708), stroke: aw, mark: ar)
  line(d(800, 2010), d(800, 1335), stroke: aw, mark: ar)
  line(d(630, 1932), d(1032, 1408), stroke: lw)
  line(d(800, 1582), d(900, 1582), stroke: dashed)
  line(d(900, 1582), d(900, 1708), stroke: dashed)
  line(d(975, 1480), d(975, 1708), stroke: dashed)
  circle(d(900, 1582), radius: 2.5 * u, fill: black, stroke: none)
  circle(d(975, 1480), radius: 2.5 * u, fill: black, stroke: none)
  content(d(505, 1706), tt($X'$))
  content(d(1160, 1706), tt($X$))
  content(d(798, 1275), tt($Y$))
  content(d(802, 2025), tt($Y'$))
  content(d(783, 1580), tt($k$))
  content(d(921, 1590), tt($N$))
  content(d(1040, 1493), tt($M(x, y)$))
  content(d(918, 1692), tt($R$))
  content(d(988, 1686), tt($Q$))
  content(d(898, 1727), tt[1])
  content(d(975, 1727), tt($x$))
  content(d(815, 1722), tt($O$))
})

// ───────── 图 3·5：p.116，证明用图（点 V、P） ─────────
#let fig-3-5(width: 700 * kpx) = cv(450, 310, 1160, 1000, (d, u) => {
  import cetz.draw: *
  line(d(485, 683), d(1100, 683), stroke: aw, mark: ar)
  line(d(792, 960), d(789, 355), stroke: aw, mark: ar)
  line(d(652, 900), d(997, 375), stroke: lw)
  line(d(790, 552), d(878, 552), stroke: dashed)
  line(d(878, 552), d(878, 683), stroke: dashed)
  line(d(934, 495), d(934, 683), stroke: dashed)
  circle(d(878, 552), radius: 3 * u, fill: black, stroke: none)
  circle(d(934, 462), radius: 4 * u, fill: black, stroke: none)
  circle(d(934, 495), radius: 3 * u, fill: black, stroke: none)
  content(d(472, 683), tt($X'$))
  content(d(1122, 680), tt($X$))
  content(d(788, 322), tt($Y$))
  content(d(793, 988), tt($Y'$))
  content(d(775, 555), tt($k$))
  content(d(860, 530), tt($N$))
  content(d(918, 438), tt($V$))
  content(d(996, 497), tt($P(x, y)$))
  content(d(952, 667), tt($T$))
  content(d(878, 702), tt[1])
  content(d(803, 700), tt($O$))
})

// ───────── 图 3·6：p.117，y = ½x ─────────
#let fig-3-6(width: 740 * kpx) = cv(450, 360, 1200, 1030, (d, u) => {
  import cetz.draw: *
  let m = (a, b) => d(800 + 47.7 * a, 727 - 49 * b)
  line(d(465, 722), d(1160, 729), stroke: aw, mark: ar)
  line(d(800, 1015), d(800, 400), stroke: aw, mark: ar)
  for k in range(-4, 5) { if k != 0 { line(m(k, -0.1), m(k, 0.1), stroke: 0.5pt) } }
  for k in range(-4, 5) { if k != 0 { line(m(-0.1, k), m(0.1, k), stroke: 0.5pt) } }
  line(d(512, 868), d(1085, 583), stroke: lw)
  circle(d(990, 631), radius: 4.5 * u, fill: white, stroke: 0.5pt)
  content(d(1180, 730), tt($x$))
  content(d(803, 372), tt($y$))
  content(d(1148, 582), tt($y = 1/2 x$))
  content(d(813, 740), tt($O$))
})

// ───────── 图 3·7：p.119，y = ½x、y = x、y = 2x 的倾角 ─────────
#let fig-3-7(width: 760 * kpx) = cv(420, 330, 1290, 1100, (d, u) => {
  import cetz.draw: *
  line(d(435, 749), d(1170, 753), stroke: aw, mark: ar)
  line(d(819, 1092), d(814, 385), stroke: aw, mark: ar)
  line(d(685, 1070), d(942, 428), stroke: lw)
  line(d(553, 1017), d(1072, 492), stroke: lw)
  line(d(483, 897), d(1160, 600), stroke: lw)
  for (r, a) in ((85, 23.5), (119, 43), (156, 66)) {
    arc(d(815, 750), start: 0deg, stop: a * 1deg, radius: r * u, anchor: "origin", stroke: 0.5pt, mark: (end: "stealth", fill: black, scale: 0.35))
  }
  content(d(1190, 755), tt($x$))
  content(d(813, 352), tt($y$))
  content(d(828, 764), tt($O$))
  content(d(998, 416), tt($y = 2x$))
  content(d(1122, 482), tt($y = x$))
  content(d(1225, 612), tt($y = 1/2 x$))
  content(d(916, 735), tt($alpha_1$))
  content(d(932, 675), tt($alpha_2$))
  content(d(967, 650), tt($alpha_3$))
})

// ───────── 图 3·8：p.119，y = −½x、y = −x、y = −2x 的倾角 ─────────
#let fig-3-8(width: 780 * kpx) = cv(430, 1300, 1290, 2100, (d, u) => {
  import cetz.draw: *
  line(d(450, 1735), d(1185, 1735), stroke: aw, mark: ar)
  line(d(816, 2068), d(814, 1345), stroke: aw, mark: ar)
  line(d(680, 1403), d(937, 2035), stroke: lw)
  line(d(563, 1485), d(1060, 1980), stroke: lw)
  line(d(492, 1592), d(1130, 1870), stroke: lw)
  for (r, a) in ((127, 156), (85, 135), (58, 112)) {
    arc(d(815, 1735), start: 0deg, stop: a * 1deg, radius: r * u, anchor: "origin", stroke: 0.5pt, mark: (end: "stealth", fill: black, scale: 0.35))
  }
  content(d(1205, 1735), tt($x$))
  content(d(813, 1322), tt($y$))
  content(d(801, 1747), tt($O$))
  content(d(1200, 1886), tt($y = -1/2 x$))
  content(d(1122, 1988), tt($y = -x$))
  content(d(1003, 2037), tt($y = -2x$))
  content(d(920, 1632), tt($alpha_1$))
  content(d(886, 1655), tt($alpha_2$))
  content(d(866, 1685), tt($alpha_3$))
})

// ───────── 图 3·9：p.120，倾角 α（左 k > 0，右 k < 0） ─────────
#let fig-3-9(width: 1200 * kpx) = cv(220, 1380, 1420, 2045, (d, u) => {
  import cetz.draw: *
  // 左图
  line(d(232, 1762), d(780, 1762), stroke: aw, mark: ar)
  line(d(487, 2030), d(487, 1432), stroke: aw, mark: ar)
  line(d(388, 1965), d(618, 1497), stroke: lw)
  line(d(572, 1591), d(572, 1762), stroke: dashed)
  arc(d(487, 1762), start: 0deg, stop: 63.8deg, radius: 45 * u, anchor: "origin", stroke: 0.5pt, mark: (end: "stealth", fill: black, scale: 0.35))
  content(d(800, 1760), tt($x$))
  content(d(490, 1405), tt($y$))
  content(d(502, 1775), tt($O$))
  content(d(633, 1594), tt($N(x, y)$))
  content(d(540, 1738), tt($alpha$))
  // 右图
  line(d(868, 1762), d(1385, 1762), stroke: aw, mark: ar)
  line(d(1085, 2040), d(1085, 1435), stroke: aw, mark: ar)
  line(d(960, 1510), d(1185, 1963), stroke: lw)
  line(d(993, 1578), d(993, 1762), stroke: dashed)
  arc(d(1085, 1762), start: 0deg, stop: 116.4deg, radius: 60 * u, anchor: "origin", stroke: 0.5pt, mark: (end: "stealth", fill: black, scale: 0.35))
  content(d(1397, 1760), tt($x$))
  content(d(1083, 1410), tt($y$))
  content(d(1068, 1775), tt($O$))
  content(d(930, 1585), tt($N(x, y)$))
  content(d(1137, 1703), tt($alpha$))
})
