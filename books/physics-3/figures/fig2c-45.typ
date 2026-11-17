// 图 2·45 伏打电池中的化学反应（原书 p.155）；图 2·48–2·51 蓄电池图（p.159–161）
// 坐标：2·45、2·50、2·51 为各页 250 dpi 局部截图的像素坐标；2·48、2·49 为 110 dpi 预览图坐标（y 向下）。
#import "/common/series.typ": *
#import "fig2c-sym.typ": *
#import "fig2c-43.typ": hatch, h-plus, so4, h2so4

#let K = 2.2

#let fig-2-45(width: 7.6cm) = px-canvas(840, 725, width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 75, 785, 215, 688, 272, k: K)
  rect(p(122, 150), p(185, 590), fill: hatch, stroke: lw)
  rect(p(665, 150), p(738, 590), fill: white, stroke: lw)
  bezier(p(150, 148), p(700, 148), p(250, -15), p(600, -15), stroke: lw)
  line(p(395, 30), p(430, 30), stroke: lw, mark: arr)
  lab(p, 432, 64, $I$)
  lab(p, 118, 108, $-$, size: 11pt)
  lab(p, 725, 108, $+$, size: 11pt)
  lab(p, 218, 190, $"Zn"$, size: 8pt)
  lab(p, 640, 198, $"Cu"$, size: 8pt)
  ion(p, 415, 395, h-plus, r: 57)
  ion(p, 247, 462, $"Zn"^(+ +)$, r: 55)
  ion(p, 432, 545, so4, r: 55)
  ion(p, 600, 470, h-plus, r: 57)
  line(p(475, 385), p(568, 385), stroke: 1.8pt, mark: arr)
  line(p(370, 465), p(505, 465), stroke: 1.8pt, mark: arr)
  line(p(372, 546), p(292, 546), stroke: 1.8pt, mark: arr)
  line(p(230, 565), p(230, 625), stroke: 1.2pt, mark: arr)
  line(p(605, 628), p(605, 570), stroke: 1.2pt, mark: arr)
  lab(p, 232, 658, $"ZnSO"_4$, bg: true, size: 8pt)
  lab(p, 605, 658, $"H"_2$, bg: true, size: 8pt)
})

#let fig-2-48(width: 4.4cm) = px-canvas(215, 230, origin: (150, 485), width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 195, 345, 612, 702, 627)
  plate(p, 216, 229, 608, 680)
  plate(p, 307, 322, 608, 680)
  wire(p, (223, 608), (223, 560), (158, 560), (158, 507), (251, 507))
  wire(p, (314, 608), (314, 560), (378, 560), (378, 507), (289, 507))
  lamp(p, 270, 507, r: 19)
  lab(p, 242, 612, $"Pb"$, size: 7.5pt)
  lab(p, 292, 612, $"Pb"$, size: 7.5pt)
  lab(p, 267, 687, $"H"_2"SO"_4$, bg: true, size: 7.5pt)
})

#let fig-2-49(width: 7.4cm) = px-canvas(345, 280, origin: (480, 445), width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 494, 802, 525, 706, 544)
  plate(p, 529, 549, 533, 655)
  plate(p, 757, 777, 533, 655)
  wire(p, (539, 533), (539, 508), (495, 508), (495, 470), (598, 470))
  line(p(517, 470), p(535, 470), stroke: lw, mark: arr)
  cell(p, 606, 470)
  line(p(612, 470), p(657, 470), stroke: (thickness: 0.7pt, dash: "dashed"))
  cell(p, 664, 470)
  wire(p, (670, 470), (697, 470))
  meter-needle(p, 715, 470, r: 18)
  wire(p, (733, 470), (806, 470), (806, 510), (767, 510), (767, 533))
  line(p(750, 470), p(770, 470), stroke: lw, mark: arr)
  lab(p, 627, 453, $B$)
  lab(p, 767, 455, $I$)
  lab(p, 563, 535, $K$)
  lab(p, 750, 536, $A$)
  lab(p, 539, 612, $-$, size: 11pt, bg: true)
  lab(p, 767, 612, $+$, size: 11pt, bg: true)
  line(p(632, 603), p(588, 603), stroke: 1.8pt, mark: arr)
  lab(p, 650, 603, h-plus, bg: true, size: 8pt)
  lab(p, 650, 623, so4, bg: true, size: 8pt)
  line(p(682, 626), p(722, 626), stroke: 1.8pt, mark: arr)
  lab(p, 540, 682, $"Pb"$, bg: true)
  lab(p, 655, 685, $"H"_2"SO"_4$, bg: true)
  lab(p, 770, 682, $"Pb"$, bg: true)
})

#let fig-2-50(width: 7.4cm) = px-canvas(830, 600, width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 70, 800, 135, 588, 185, k: K)
  plate(p, 152, 200, 150, 480)
  plate(p, 680, 725, 150, 455)
  wire(p, (175, 150), (175, 62), (268, 62))
  zigzag(p, 268, 62, 205, n: 7, a: 13, k: 1)
  wire(p, (473, 62), (538, 62))
  meter-needle(p, 572, 68, r: 34)
  wire(p, (606, 68), (697, 68), (697, 150))
  line(p(697, 95), p(697, 128), stroke: lw, mark: arr)
  lab(p, 722, 108, $I$)
  lab(p, 225, 140, $K$)
  lab(p, 655, 142, $A$)
  lab(p, 175, 300, $-$, size: 11pt, bg: true)
  lab(p, 697, 300, $+$, size: 11pt, bg: true)
  for y in (165, 218, 262, 308, 362, 404, 437) {
    lab(p, 213, y, $+$, size: 8pt)
  }
  for y in (165, 215, 260, 350, 400, 435) {
    lab(p, 660, y, $-$, size: 8pt)
  }
  lab(p, 440, 290, h-plus, bg: true, size: 8pt)
  line(p(490, 290), p(552, 290), stroke: 1.8pt, mark: arr)
  lab(p, 410, 352, so4, bg: true, size: 8pt)
  line(p(372, 358), p(312, 358), stroke: 1.8pt, mark: arr)
  lab(p, 172, 490, $"Pb"$, bg: true)
  lab(p, 695, 490, $"PbO"_2$, bg: true)
  lab(p, 430, 520, h2so4, bg: true)
})

#let fig-2-51(width: 7.4cm) = px-canvas(810, 690, width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 40, 790, 215, 655, 282, k: K)
  plate(p, 120, 173, 247, 555)
  plate(p, 640, 690, 247, 555)
  wire(p, (147, 247), (147, 175), (40, 175), (40, 70), (222, 70))
  cell(p, 232, 70, k: 2.2)
  line(p(244, 70), p(374, 70), stroke: (thickness: 0.7pt, dash: "dashed"))
  cell(p, 385, 70, k: 2.2)
  wire(p, (400, 70), (524, 70))
  meter-needle(p, 558, 70, r: 36)
  wire(p, (594, 70), (780, 70), (780, 175), (665, 175), (665, 247))
  line(p(620, 70), p(668, 70), stroke: lw, mark: arr)
  lab(p, 685, 35, $I$)
  lab(p, 195, 240, $K$)
  lab(p, 620, 245, $A$)
  lab(p, 147, 405, $-$, size: 11pt, bg: true)
  lab(p, 665, 405, $+$, size: 11pt, bg: true)
  line(p(372, 385), p(300, 385), stroke: 1.8pt, mark: arr)
  lab(p, 410, 385, h-plus, bg: true, size: 8pt)
  lab(p, 410, 463, so4, bg: true, size: 8pt)
  line(p(495, 463), p(585, 463), stroke: 1.8pt, mark: arr)
  lab(p, 150, 595, $"PbSO"_4$, bg: true)
  lab(p, 440, 595, h2so4, bg: true)
  lab(p, 655, 595, $"PbSO"_4$, bg: true)
})
