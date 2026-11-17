// 复习题六第 10 题附图：无线电发报机示意图；来源 原书 p.350，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-ex-6-10(width: 6.2cm) = px-canvas(630, 440, origin: (460, 285), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  // 天线、开关 K
  antenna(p, 538, 300, hw: 35, h: 50)
  wire(p, (538, 350), (538, 385)); node(p, 538, 385, r: 4)
  line(p(540, 435), p(503, 393), stroke: 1.3pt)
  wire(p, (540, 435), (540, 483))
  lab(480, 387, $K$, size: 10pt)
  // L1
  coil-loops(p, 571, 367, 3, rx: 12, ry: 6.7)
  wire(p, (571, 337), (571, 367)); wire(p, (571, 407), (571, 432), (717, 432), (717, 371), (833, 371), (833, 423))
  wire(p, (571, 337), (992, 337), (992, 433))
  lab(603, 387, $L_1$, size: 10pt)
  // L2 与 L
  coil-loops(p, 540, 483, 7, rx: 13, ry: 8)
  coil-loops(p, 574, 483, 7, rx: 13, ry: 8)
  wire(p, (540, 595), (540, 670)); ground(p, 540, 670, hw: 20)
  wire(p, (574, 483), (574, 460), (790, 460))
  wire(p, (574, 595), (574, 621), (992, 621), (992, 531))
  lab(500, 540, $L_2$, size: 10pt); lab(611, 543, $L$, size: 10pt)
  // 电容
  wire(p, (717, 460), (717, 525)); cap-v(p, 717, 532, len: 38, gap: 11, st: 2.4pt); wire(p, (717, 540), (717, 621))
  node(p, 717, 460); node(p, 717, 621)
  // 电子管与甲电
  tube(p, 790, 400, 87, 123, plate-y: 0.19, grid-y: 0.49, cat-y: 0.80)
  wire(p, (833, 371), (833, 410))
  wire(p, (811, 510), (811, 621)); wire(p, (853, 510), (853, 621))
  wire(p, (811, 621), (821, 621)); wire(p, (837, 621), (853, 621), (992, 621))
  line(p(825, 610), p(825, 632), stroke: 1.2pt); line(p(833, 614), p(833, 628), stroke: 2.2pt)
  node(p, 811, 621, r: 4); node(p, 853, 621, r: 4)
  lab(830, 665, [甲电], size: 9pt)
  // 乙电
  line(p(977, 433), p(1007, 433), stroke: 1.2pt); line(p(984, 443), p(1000, 443), stroke: 2.4pt)
  line(p(992, 448), p(992, 519), stroke: (thickness: 1pt, dash: (4pt, 3pt)))
  line(p(977, 523), p(1007, 523), stroke: 1.2pt); line(p(984, 531), p(1000, 531), stroke: 2.4pt)
  lab(1043, 488, [乙电], size: 9pt)
})
