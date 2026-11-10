// §4·5 的图：图 4·8、图 4·9（p.110）、图 4·10、图 4·11（p.111）、图 4·12（p.112）。
// 坐标取自 150 dpi 页面图（扫描原生像素，y 向下），放大裁图加网格读出。
// 图 4·11 的“6 公斤”、图 4·12 的“北东南西”照原图（公斤、方位名照原书）。
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig4-common.typ": *

// ───────── 图 4·8：力的平行四边形（p.110）─────────
#let fig-4-8(width: 265 * k) = px-canvas(265, 125, origin: (80, 535), width: width, (p, u) => {
  import cetz.draw: *
  let (o, m1, m2, m) = ((91, 650), (281, 647), (135, 551), (328, 546))
  line(p(..m2), p(..m), stroke: dash)
  line(p(..m), p(..m1), stroke: dash)
  line(p(..o), p(..m1), stroke: vw, mark: ar)
  line(p(..o), p(..m2), stroke: vw, mark: ar)
  line(p(..o), p(..m), stroke: vw, mark: ar)
  content(p(124, 543), tt($M_2$))
  content(p(337, 543), tt($M$))
  content(p(297, 652), tt($M_1$))
  content(p(83, 653), tt($O$))
  content(p(192, 597), tt($bold(italic(F))$))
  content(p(200, 638), tt($bold(italic(F))_1$))
  content(p(106, 599), tt($bold(italic(F))_2$))
})

// ───────── 图 4·9：复数加法的几何解释（p.110）─────────
#let fig-4-9(width: 255 * k) = px-canvas(255, 215, origin: (405, 825), width: width, (p, u) => {
  import cetz.draw: *
  let o = (441, 986)
  let (m1, m2, m, n1, n2, n, s) = ((563, 947), (490, 903), (611, 865), (563, 986), (490, 986), (611, 986), (611, 947))
  line(p(441, 1030), p(441, 838), stroke: axw, mark: ar)
  line(p(411, 986), p(652, 986), stroke: axw, mark: ar)
  line(p(..m2), p(..n2), stroke: dash)
  line(p(..m1), p(..n1), stroke: dash)
  line(p(..m), p(..n), stroke: (paint: black, thickness: 1.2pt, dash: "dashed"))
  line(p(..m1), p(..s), stroke: dash)
  line(p(..m2), p(..m), stroke: 1.3pt)
  line(p(..m1), p(..m), stroke: 0.8pt)
  line(p(..o), p(..m1), stroke: vw, mark: ar)
  line(p(..o), p(..m2), stroke: vw, mark: ar)
  line(p(..o), p(..m), stroke: vw, mark: ar)
  content(p(613, 855), tt($M$))
  content(p(485, 894), tt($M_2$))
  content(p(553, 938), tt($M_1$))
  content(p(618, 950), tt($S$))
  content(p(490, 998), tt($N_2$))
  content(p(563, 998), tt($N_1$))
  content(p(611, 997), tt($N$))
  content(p(433, 997), tt($O$))
  content(p(655, 987), tt($x$))
  content(p(441, 832), tt($y$))
})

// ───────── 图 4·10：复数减法的几何解释（p.111）─────────
#let fig-4-10(width: 240 * k) = px-canvas(240, 225, origin: (472, 300), width: width, (p, u) => {
  import cetz.draw: *
  let o = (525, 463)
  let (m1, m2, m) = ((647, 367), (622, 441), (550, 390))
  line(p(524, 522), p(524, 318), stroke: axw, mark: ar)
  line(p(477, 464), p(699, 464), stroke: axw, mark: ar)
  line(p(..m), p(..m1), stroke: 1.2pt)
  line(p(..m2), p(..m1), stroke: 0.8pt)
  line(p(..o), p(..m1), stroke: vw, mark: ar)
  line(p(..o), p(..m2), stroke: vw, mark: ar)
  line(p(..o), p(..m), stroke: vw, mark: ar)
  content(p(642, 357), anchor: "west", tt($M_1(a_1, b_1)$))
  content(p(628, 444), anchor: "west", tt($M_2(a_2, b_2)$))
  content(p(541, 384), tt($M$))
  content(p(517, 473), tt($O$))
  content(p(707, 463), tt($x$))
  content(p(524, 309), tt($y$))
})

// ───────── 图 4·11：两个 6 公斤的力成 120° 角（p.111）─────────
#let fig-4-11(width: 270 * k) = px-canvas(270, 160, origin: (105, 655), width: width, (p, u) => {
  import cetz.draw: *
  let o = (200, 797)
  let (m1, m2, m) = ((348, 797), (126, 673), (274, 674))
  line(p(..m2), p(..m), stroke: vw)
  line(p(..m), p(..m1), stroke: 1.2pt)
  line(p(..o), p(..m1), stroke: vw, mark: ar)
  line(p(..o), p(..m2), stroke: vw, mark: ar)
  line(p(..o), p(..m), stroke: vw, mark: ar)
  arc(p(..o), start: 0deg, stop: 120deg, radius: 24, anchor: "origin", stroke: 0.8pt)
  content(p(237, 777), tt($120°$))
  content(p(268, 807), tt[6 公斤])
  content(p(174, 731), angle: -62deg, tt[6 公斤])
  content(p(129, 665), tt($M_2$))
  content(p(273, 663), tt($M$))
  content(p(360, 796), tt($M_1$))
  content(p(199, 807), tt($O$))
})

// ───────── 图 4·12：北 45° 东、南 60° 东的两个力（p.112）─────────
#let fig-4-12(width: 285 * k) = px-canvas(285, 250, origin: (95, 632), width: width, (p, u) => {
  import cetz.draw: *
  let o = (158.3, 770.7)
  let (f1, f2, r) = ((222, 706), (267, 833), (330, 771))
  line(p(158.3, 862), p(158.3, 651), stroke: axw, mark: ar)
  line(p(113, 770.7), p(360, 770.7), stroke: axw, mark: ar)
  line(p(..f1), p(..r), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  line(p(..f2), p(..r), stroke: dash)
  line(p(..o), p(..f1), stroke: vw, mark: ar)
  line(p(..o), p(..f2), stroke: vw, mark: ar)
  line(p(..o), p(..r), stroke: 0.9pt, mark: ar)
  arc(p(..o), start: dirang(f1.at(0) - 158.3, f1.at(1) - 770.7), stop: 90deg, radius: 18, anchor: "origin", stroke: 0.7pt)
  arc(p(..o), start: -90deg, stop: dirang(f2.at(0) - 158.3, f2.at(1) - 770.7), radius: 18, anchor: "origin", stroke: 0.7pt)
  content(p(173, 743), tt($45°$))
  content(p(173, 797), tt($60°$))
  content(p(212, 697), tt($bold(italic(f))_1$))
  content(p(263, 842), tt($bold(italic(f))_2$))
  content(p(158, 640), tt[北])
  content(p(158, 873), tt[南])
  content(p(104, 771), tt[西])
  content(p(372, 772), tt[东])
  content(p(143, 657), tt($y$))
  content(p(355, 781), tt($x$))
  content(p(148, 781), tt($O$))
})
