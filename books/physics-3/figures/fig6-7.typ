// 图 6·7 感应耦合（原书 p.312）与 图 6·8 调幅原理（原书 p.314）。CeTZ 重绘，坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-7(width: 5.6cm) = px-canvas(330, 400, origin: (140, 1185), width: width, (p, u) => {
  import cetz.draw: *
  antenna(p, 398, 1190, h: 94)
  txt(p, 432, 1207, $A$)
  // 开放电路 L1
  coil(p, 398, 1284, 1440, n: 6, w: 14, side: 1)
  wire(p, (398, 1440), (398, 1550))
  ground(p, 398, 1553)
  txt(p, 425, 1537, $B$)
  txt(p, 432, 1358, $L_1$)
  // 闭合电路 C L2
  wire(p, (165, 1252), (378, 1252), (378, 1290))
  coil(p, 378, 1290, 1440, n: 6, w: 14, side: -1)
  wire(p, (378, 1440), (378, 1462), (165, 1462), (165, 1342))
  wire(p, (165, 1252), (165, 1318))
  cap(p, 165, 1330, len: 30, gap: 10)
  txt(p, 200, 1348, $C$)
  txt(p, 336, 1357, $L_2$)
})

#let fig-6-8(width: 5cm) = px-canvas(290, 510, origin: (130, 190), width: width, (p, u) => {
  import cetz.draw: *
  antenna(p, 300, 192, h: 168)
  // 话筒 M 和扬声器（声源）
  rect(p(292, 349), p(305, 367), stroke: sw, fill: white)
  wire(p, (305, 358), (312, 358))
  line(p(312, 349), p(325, 342), p(325, 374), p(312, 367), close: true, stroke: sw, fill: white)
  arc(p(333, 358), start: -40deg, stop: 40deg, radius: 12, stroke: sw)
  arc(p(342, 358), start: -45deg, stop: 45deg, radius: 18, stroke: sw)
  txt(p, 270, 362, $M$)
  txt(p, 378, 362, $S$)
  wire(p, (300, 360), (300, 460))
  // 线圈
  coil(p, 300, 460, 530, n: 3, w: 14, side: 1)
  txt(p, 335, 490, $L_1$)
  coil(p, 280, 460, 530, n: 3, w: 14, side: -1)
  txt(p, 235, 490, $L_2$)
  wire(p, (300, 530), (300, 655))
  ground(p, 300, 658)
  // 振荡器
  rect(p(147, 425), p(196, 555), stroke: sw)
  content(p(171, 490), text(size: 9pt)[振\ 荡\ 器])
  wire(p, (196, 440), (280, 440), (280, 460))
  wire(p, (196, 540), (280, 540), (280, 530))
})
