// §4·4 的图：图 4·4（p.99）、图 4·5（p.100）、图 4·6（p.100）、图 4·7（p.101）。
// 坐标取自 150 dpi 页面图（扫描原生像素，y 向下），放大裁图加网格读出。
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig4-common.typ": *

// ───────── 图 4·4：复数 a + bi 对应的向量 OM（p.99）─────────
#let fig-4-4(width: 240 * k) = px-canvas(240, 190, origin: (485, 510), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (538, 664)
  let (mx, my) = (621, 584)
  line(p(ox, 690), p(ox, 528), stroke: axw, mark: ar)
  line(p(491, oy), p(702, oy), stroke: axw, mark: ar)
  line(p(ox, oy), p(mx, my), stroke: vw, mark: ar)
  line(p(mx, my), p(mx, oy), stroke: dash)
  arc(p(ox, oy), start: 0deg, stop: dirang(mx - ox, my - oy), radius: 28, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(713, 663), tt($x$))
  content(p(538, 516), tt($y$))
  content(p(529, 674), tt($O$))
  content(p(630, 632), tt($b$))
  content(p(585, 674), tt($a$))
  content(p(570, 654), tt($theta$))
  content(p(573, 617), tt($r$))
  content(p(624, 581), anchor: "west", tt($M: a + b i$))
})

// ───────── 图 4·5：作出与 −2 + i、−√3 i 对应的向量（p.100）─────────
#let fig-4-5(width: 245 * k) = px-canvas(245, 250, origin: (75, 252), width: width, (p, u) => {
  import cetz.draw: *
  let ox = 192.7
  let oy = 385
  let ux = 48.5
  let uy = 48.5
  line(p(ox, 497), p(ox, 261), stroke: axw, mark: ar)
  line(p(77, oy), p(316, oy), stroke: axw, mark: ar)
  for n in (-2, -1, 1, 2) {
    line(p(ox + n * ux, oy), p(ox + n * ux, oy - 4), stroke: 0.6pt)
    content(p(ox + n * ux + (if n < 0 { -2 } else { 0 }), oy + 9), tt($#n$))
    line(p(ox, oy - n * uy), p(ox + 4, oy - n * uy), stroke: 0.6pt)
    content(p(ox - 5, oy - n * uy), anchor: "east", tt($#n$))
  }
  // M1 = −2 + i，M2 = 0 − √3 i
  line(p(ox, oy), p(ox - 2 * ux, oy - uy), stroke: vw, mark: ar)
  line(p(ox, oy), p(ox, oy + calc.sqrt(3) * uy), stroke: vw, mark: ar)
  content(p(91, 327), anchor: "west", tt($M_1: -2 + i$))
  content(p(204, 475), anchor: "west", tt($M_2: -sqrt(3) i$))
  content(p(185, 394), tt($O$))
  content(p(319, 386), tt($x$))
  content(p(194, 253), tt($y$))
})

// ───────── 图 4·6：复数的模数 r（p.100）─────────
#let fig-4-6(width: 235 * k) = px-canvas(235, 205, origin: (440, 590), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (487.7, 735.7)
  let (mx, my) = (570.7, 651)
  line(p(ox, 787), p(ox, 601), stroke: axw, mark: ar)
  line(p(443, oy), p(652, oy), stroke: axw, mark: ar)
  line(p(ox, oy), p(mx, my), stroke: vw, mark: ar)
  line(p(mx, my), p(mx, oy), stroke: 0.9pt)
  arc(p(ox, oy), start: 0deg, stop: dirang(mx - ox, my - oy), radius: 28, anchor: "origin", stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(662, 735), tt($x$))
  content(p(488, 589), tt($y$))
  content(p(478, 747), tt($O$))
  content(p(579, 698), tt($b$))
  content(p(529, 747), tt($a$))
  content(p(521, 727), tt($theta$))
  content(p(519, 689), tt($r$))
  content(p(576, 653), anchor: "west", tt($M: a + b i$))
})

// ───────── 图 4·7：|z| = 4 与 |z| < 4（p.101）─────────
#let fig-4-7(width: 310 * k) = px-canvas(310, 300, origin: (405, 400), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (549.4, 553.6)
  let g = 28
  circle(p(ox, oy), radius: 111.5, stroke: 1.6pt)
  line(p(ox, 697), p(ox, 411), stroke: axw, mark: ar)
  line(p(412, oy), p(690, oy), stroke: axw, mark: ar)
  for n in (-4, -3, -2, -1, 1, 2, 3, 4) {
    line(p(ox + n * g, oy), p(ox + n * g, oy - 4), stroke: 0.6pt)
    line(p(ox, oy - n * g), p(ox + 4, oy - n * g), stroke: 0.6pt)
  }
  let xl = ((-4, 427), (-3, 471), (-2, 498), (-1, 521), (1, 577), (2, 607), (3, 634), (4, 668))
  for (n, x) in xl { content(p(x, 565), tt($#n$)) }
  let yl = ((4, 433), (3, 470), (2, 498), (1, 526), (-1, 583), (-2, 611), (-3, 640), (-4, 667))
  for (n, y) in yl { content(p(546, y), anchor: "east", tt($#n$)) }
  content(p(657, 469), tt($lr(|z|) = 4$))
  line(p(648, 475), p(644, 496), stroke: 0.6pt)
  content(p(600, 507), tt($lr(|z|) < 4$))
  content(p(540, 564), tt($O$))
  content(p(699, 552), tt($x$))
  content(p(549, 403), tt($y$))
})
