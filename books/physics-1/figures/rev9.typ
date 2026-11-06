// 复习题九附图（原书 p.293–294）。CeTZ 重绘，坐标取自页面显示图。
#import "/common/series.typ": *

#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))
#let _hatch-v(p, x0, y0, y1, dir: -1, step: 24) = {
  for y in range(y0, y1, step: step) { cetz.draw.line(p(x0, y + 12), p(x0 + dir * 14, y), stroke: 0.5pt) }
}

// 第 3 题
#let fig-rev-9-3(width: 4.6cm) = px-canvas(260, 520, origin: (560, 90), width: width, (p, u) => {
  import cetz.draw: *
  line(p(630, 98), p(612, 590), stroke: 1.2pt)
  _hatch-v(p, 625, 110, 590, dir: -1)
  line(p(630, 130), p(775, 350), stroke: 1.2pt)
  line(p(612, 565), p(775, 352), stroke: 2.4pt)
  line(p(620, 565), p(775, 360), stroke: 0.8pt, )
  circle(p(775, 352), radius: 4 * u, fill: black)
  line(p(775, 352), p(775, 485), stroke: 1pt)
  rect(p(735, 485), p(800, 548), stroke: 1pt)
  arc(p(630, 130), start: 270deg, delta: 33deg, radius: 90 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(612, 565), start: 90deg, delta: -36deg, radius: 90 * u, stroke: 0.6pt, anchor: "origin")
  _lab(p, 605, 135, $A$); _lab(p, 793, 348, $D$); _lab(p, 630, 575, $O$); _lab(p, 770, 518, $G$)
  _lab(p, 648, 215, $30°$, size: 7pt); _lab(p, 648, 468, $30°$, size: 7pt)
})

// 第 5 题
#let fig-rev-9-5(width: 5.2cm) = px-canvas(300, 560, origin: (960, 70), width: width, (p, u) => {
  import cetz.draw: *
  line(p(1015, 88), p(1015, 588), stroke: 1.2pt)
  _hatch-v(p, 1010, 100, 588, dir: -1)
  line(p(1015, 183), p(1180, 183), stroke: 1.2pt)
  line(p(1022, 488), p(1185, 190), stroke: 2.2pt)
  line(p(1030, 492), p(1193, 194), stroke: 0.8pt)
  circle(p(1065, 290), radius: 47 * u, stroke: 1pt)
  line(p(1018, 290), p(1065, 290), stroke: 0.7pt)
  arc(p(1022, 488), start: 90deg, delta: -29deg, radius: 80 * u, stroke: 0.6pt, anchor: "origin")
  _lab(p, 990, 185, $C$); _lab(p, 1198, 182, $B$); _lab(p, 1000, 495, $A$)
  _lab(p, 1050, 268, $F$); _lab(p, 1082, 290, $G$); _lab(p, 1035, 408, $theta$)
})

// 第 8 题
#let fig-rev-9-8(width: 5cm) = px-canvas(400, 700, origin: (360, 120), width: width, (p, u) => {
  import cetz.draw: *
  line(p(480, 145), p(535, 128), stroke: 1pt)
  for x in range(485, 535, step: 12) { line(p(x, 145), p(x + 8, 130), stroke: 0.5pt) }
  line(p(490, 145), p(583, 340), stroke: 1.4pt)
  line(p(583, 340), p(705, 340), stroke: 2pt)
  line(p(705, 310), p(705, 370), stroke: 1.2pt)
  for y in range(312, 370, step: 12) { line(p(705, y + 8), p(715, y), stroke: 0.5pt) }
  line(p(470, 338), p(583, 338), stroke: (thickness: 0.7pt, dash: "dashed"))
  line(p(583, 340), p(512, 472), stroke: 1.4pt)
  line(p(405, 472), p(512, 472), stroke: 2pt)
  line(p(400, 445), p(400, 505), stroke: 1.2pt)
  for y in range(448, 505, step: 12) { line(p(400, y + 8), p(390, y), stroke: 0.5pt) }
  line(p(512, 472), p(512, 608), stroke: 1.6pt)
  rect(p(482, 608), p(548, 670), stroke: 1.2pt)
  arc(p(583, 340), start: 120deg, delta: 60deg, radius: 40 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(583, 340), start: 180deg, delta: 60deg, radius: 40 * u, stroke: 0.6pt, anchor: "origin")
  _lab(p, 462, 172, $A$); _lab(p, 596, 360, $C$); _lab(p, 727, 335, $B$); _lab(p, 378, 475, $D$); _lab(p, 530, 485, $E$)
  _lab(p, 512, 640, $G$); _lab(p, 522, 320, $60°$, size: 7pt); _lab(p, 522, 357, $60°$, size: 7pt)
})

// 第 10 题
#let fig-rev-9-10(width: 7cm) = px-canvas(450, 300, origin: (850, 400), width: width, (p, u) => {
  import cetz.draw: *
  line(p(862, 438), p(862, 655), stroke: 1.6pt)
  line(p(862, 655), p(872, 672), p(1248, 672), p(1260, 655), stroke: 1.6pt)
  line(p(1258, 470), p(1258, 655), stroke: 1.6pt)
  for (y, a, b) in ((537, 870, 1020), (548, 1040, 1250), (565, 870, 1255), (585, 880, 960), (600, 1000, 1100), (610, 1180, 1250), (640, 880, 920), (642, 1030, 1080), (640, 1170, 1230)) {
    line(p(a, y), p(b, y), stroke: (thickness: 0.8pt, dash: "dashed"))
  }
  line(p(1250, 432), p(890, 630), stroke: 4pt)
  line(p(1250, 432), p(890, 630), stroke: 2pt + white)
  circle(p(1250, 432), radius: 5 * u, fill: white, stroke: 1pt)
  _lab(p, 1275, 425, $O$)
})
