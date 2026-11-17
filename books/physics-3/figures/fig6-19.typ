// 图 6·19 半波整流电路、图 6·20 半波整流的输入与输出波形（原书 p.323）、
// 图 6·21 全波整流电路、图 6·22 全波整流的输入和输出波形（原书 p.324）。
// CeTZ 重绘，坐标为 150 dpi 页面像素坐标（图 6·21、6·22 的原点见各画布的 origin）。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-19(width: 8.6cm) = px-canvas(450, 320, origin: (160, 540), width: width, (p, u) => {
  import cetz.draw: *
  // 初级与电源
  circle(p(182, 702), radius: 3.5, stroke: sw, fill: white)
  circle(p(182, 750), radius: 3.5, stroke: sw, fill: white)
  content(p(182, 726), text(size: 11pt)[$tilde$])
  wire(p, (182, 698), (182, 642), (257, 642), (257, 662))
  wire(p, (182, 754), (182, 807), (257, 807), (257, 785))
  coil(p, 257, 662, 785, n: 9, w: 22, side: -1)
  // 铁芯
  for x in (274, 280, 285) { wire(p, (x, 595), (x, 817)) }
  // 高压线圈
  wire(p, (307, 595), (307, 572), (551, 572), (551, 604))
  coil(p, 307, 595, 757, n: 9, w: 22, side: -1)
  txt(p, 285, 567, text(style: "italic")[$T$])
  txt(p, 365, 547, text(weight: "bold")[高压线圈], size: 8.5pt)
  txt(p, 327, 580, [−], size: 10pt)
  // 灯丝线圈
  coil(p, 307, 785, 825, n: 2, w: 14, side: -1)
  txt(p, 390, 847, text(weight: "bold")[灯丝线圈], size: 8.5pt)
  // 二极管
  circle(p(427, 690), radius: 42, stroke: 1.3pt)
  line(p(412, 671), p(442, 671), stroke: 2.4pt)
  line(p(410, 715), p(444, 715), stroke: 2.4pt)
  // 屏极回路
  wire(p, (307, 757), (370, 757), (370, 629), (427, 629), (427, 671))
  txt(p, 335, 746, [+], size: 10pt)
  txt(p, 447, 637, $A$)
  arrow(p, (385, 637), (408, 637))
  // 阴极回路
  wire(p, (410, 715), (410, 785), (307, 785))
  wire(p, (444, 715), (444, 826))
  node(p, 444, 826)
  txt(p, 462, 737, $K$)
  wire(p, (307, 825), (551, 825), (551, 767))
  arrow(p, (455, 775), (455, 797))
  arrow(p, (498, 814), (520, 814))
  // 负载电阻
  node(p, 551, 604)
  wire(p, (551, 604), (551, 665))
  res-v(p, 551, 690, h: 52, w: 20)
  wire(p, (551, 716), (551, 767))
  node(p, 551, 767)
  txt(p, 575, 604, $Q$); txt(p, 573, 694, $R$); txt(p, 568, 768, $P$)
  txt(p, 521, 760, $I$)
  arrow(p, (537, 775), (537, 748))
  arrow(p, (448, 582), (418, 582))
  arrow(p, (327, 635), (327, 655))
})

#let fig-6-20(width: 8.4cm) = px-canvas(470, 420, origin: (640, 480), width: width, (p, u) => {
  import cetz.draw: *
  let hump(x0, x1, y0, amp, sign: -1) = range(0, 101).map(i => {
    let s = i / 100
    p(x0 + (x1 - x0) * s, y0 + sign * amp * calc.sin(calc.pi * s))
  })
  // (a)
  line(p(668, 640), p(668, 510), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  line(p(664, 634), p(1068, 634), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  line(..hump(668, 797, 634, 51), stroke: 1.2pt)
  line(..hump(797, 913, 634, 47, sign: 1), stroke: 1.2pt)
  line(..hump(913, 1030, 634, 51), stroke: 1.2pt)
  line(p(797, 634), p(797, 822), stroke: (thickness: 0.75pt, dash: "dashed"))
  line(p(913, 634), p(913, 822), stroke: (thickness: 0.75pt, dash: "dashed"))
  content(p(653, 498), anchor: "west", text(size: 8.5pt, weight: "bold")[#text(style: "italic")[V]屏极对阴极的电压])
  content(p(653, 692), anchor: "west", text(size: 8.5pt, weight: "bold")[#text(style: "italic")[I]电路中的电流])
  txt(p, 1078, 630, $t$, size: 9pt)
  txt(p, 853, 712, [($a$)])
  // (b)
  line(p(668, 822), p(668, 708), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  line(p(664, 822), p(1068, 822), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  line(..hump(668, 797, 822, 50), stroke: 1.2pt)
  line(..hump(913, 1040, 822, 50), stroke: 1.2pt)
  txt(p, 1078, 820, $t$, size: 9pt)
  txt(p, 857, 868, [($b$)])
})

#let fig-6-21(width: 9cm) = px-canvas(510, 370, origin: (130, 285), width: width, (p, u) => {
  import cetz.draw: *
  // 初级与电源
  circle(p(147, 502), radius: 3.5, stroke: sw, fill: white)
  circle(p(147, 545), radius: 3.5, stroke: sw, fill: white)
  content(p(147, 524), text(size: 11pt)[$tilde$])
  wire(p, (147, 498), (147, 440), (282, 440), (282, 457))
  wire(p, (147, 549), (147, 602), (282, 602), (282, 585))
  coil(p, 280, 457, 585, n: 8, w: 24, side: -1)
  // 铁芯
  for x in (299, 305, 311) { wire(p, (x, 372), (x, 625)) }
  // 次级线圈（中心抽头）
  coil(p, 327, 382, 515, n: 7, w: 24, side: -1)
  wire(p, (327, 382), (327, 355), (485, 355), (485, 422))
  wire(p, (327, 515), (327, 550), (397, 550), (397, 385), (447, 385), (447, 422))
  node(p, 337, 452, r: 3)
  wire(p, (337, 452), (373, 452), (373, 297), (595, 297), (595, 349))
  txt(p, 350, 340, $A_1$); txt(p, 361, 540, $A_2$)
  // 双二极管
  circle(p(464, 446), radius: 52, stroke: 1.5pt)
  line(p(438, 427), p(456, 427), stroke: 2.4pt)
  line(p(473, 427), p(493, 427), stroke: 2.4pt)
  bezier(p(450, 484), p(487, 484), p(458, 477), p(480, 477), stroke: 2.4pt)
  // 灯丝线圈
  coil(p, 322, 582, 627, n: 2, w: 14, side: 1)
  wire(p, (450, 484), (450, 595), (326, 595), (326, 582))
  wire(p, (326, 627), (595, 627), (595, 532))
  wire(p, (487, 484), (487, 627))
  node(p, 487, 627)
  // 负载电阻
  node(p, 595, 349); node(p, 596, 532)
  wire(p, (595, 349), (595, 397))
  res-v(p, 595, 430, h: 65, w: 20)
  wire(p, (595, 462), (595, 532))
  txt(p, 613, 347, $Q$); txt(p, 623, 429, $R$); txt(p, 613, 532, $P$)
  txt(p, 557, 430, $I$)
  arrow(p, (571, 440), (571, 415))
})

#let fig-6-22(width: 10.4cm) = px-canvas(640, 325, origin: (270, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let hump(x0, x1, y0, amp, sign: -1) = range(0, 101).map(i => {
    let s = i / 100
    p(x0 + (x1 - x0) * s, y0 + sign * amp * calc.sin(calc.pi * s))
  })
  let ax(x, y, x1, ytop, ybot) = {
    line(p(x, ybot), p(x, ytop), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
    line(p(x - 3, y), p(x1, y), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  }
  // V1、V2
  ax(318, 1178, 553, 1115, 1185)
  line(..hump(318, 390, 1178, 31), stroke: 1.2pt)
  line(..hump(390, 459, 1178, 33, sign: 1), stroke: 1.2pt)
  line(..hump(459, 531, 1178, 31), stroke: 1.2pt)
  txt(p, 300, 1102, text(weight: "bold", style: "italic")[$V_1$], size: 9pt)
  txt(p, 309, 1176, $O$, size: 9pt); txt(p, 567, 1176, $t$, size: 9pt)
  ax(318, 1272, 553, 1210, 1278)
  line(..hump(318, 390, 1272, 22, sign: 1), stroke: 1.2pt)
  line(..hump(390, 459, 1272, 35), stroke: 1.2pt)
  line(..hump(459, 531, 1272, 22, sign: 1), stroke: 1.2pt)
  txt(p, 300, 1202, text(weight: "bold", style: "italic")[$V_2$], size: 9pt)
  txt(p, 307, 1270, $O$, size: 9pt); txt(p, 567, 1268, $t$, size: 9pt)
  // I1、I2、I
  ax(613, 1178, 863, 1115, 1182)
  line(..hump(613, 684, 1178, 33), stroke: 1.2pt)
  line(..hump(755, 826, 1178, 33), stroke: 1.2pt)
  txt(p, 627, 1096, $I_1$, size: 9pt)
  txt(p, 603, 1176, $O$, size: 9pt); txt(p, 869, 1176, $t$, size: 9pt)
  ax(613, 1272, 863, 1210, 1278)
  line(..hump(684, 755, 1272, 37), stroke: 1.2pt)
  txt(p, 627, 1205, $I_2$, size: 9pt)
  txt(p, 600, 1270, $O$, size: 9pt); txt(p, 869, 1270, $t$, size: 9pt)
  ax(613, 1360, 863, 1295, 1365)
  line(..hump(613, 684, 1360, 33), stroke: 1.2pt)
  line(..hump(684, 755, 1360, 33), stroke: 1.2pt)
  line(..hump(755, 826, 1360, 33), stroke: 1.2pt)
  txt(p, 620, 1296, $I$, size: 9pt)
  line(p(620, 1303), p(627, 1325), stroke: 0.4pt)
  txt(p, 603, 1358, $O$, size: 9pt); txt(p, 870, 1362, $t$, size: 9pt)
  line(p(684, 1178), p(684, 1362), stroke: (thickness: 0.75pt, dash: "dashed"))
  line(p(755, 1178), p(755, 1362), stroke: (thickness: 0.75pt, dash: "dashed"))
})
