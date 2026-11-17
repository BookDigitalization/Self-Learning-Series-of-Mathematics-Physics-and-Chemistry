// 图 6·16 二极电子管的构造和符号（原书 p.321）、图 6·17 热电子从阴极飞出（原书 p.322）
// 图 6·16 左侧管子为写实插画，沿用原扫描裁剪（fig6-16.png，裁剪区 (738,1235)–(893,1565)，150 dpi 页面像素坐标）；
// 右侧符号和字用 CeTZ 重绘。图 6·17 CeTZ 重绘。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

// 二极管符号：中心 (cx, cy)，rx、ry 为泡壳半轴
#let diode-tube(p, cx, cy, rx: 50, ry: 90) = {
  import cetz.draw: *
  circle(p(cx, cy), radius: (rx, ry), stroke: 1.2pt)
  wire(p, (cx, cy - ry - 30), (cx, cy - ry + 25))
  line(p(cx - 18, cy - ry + 25), p(cx + 18, cy - ry + 25), stroke: 2.4pt)
  bezier(p(cx - 28, cy + ry - 28), p(cx + 28, cy + ry - 28), p(cx - 15, cy + ry - 42), p(cx + 15, cy + ry - 42), stroke: 2.4pt)
  line(p(cx - 28, cy + ry - 28), p(cx - 28, cy + ry + 45), stroke: sw, mark: (end: ">", fill: black, scale: 0.5))
  line(p(cx + 28, cy + ry - 28), p(cx + 28, cy + ry + 45), stroke: sw, mark: (end: ">", fill: black, scale: 0.5))
}

#let fig-6-16(width: 6.4cm) = px-canvas(360, 335, origin: (735, 1235), width: width, (p, u) => {
  import cetz.draw: *
  content(p(738, 1235), anchor: "north-west", image("fig6-16.png", width: 155 * u))
  txt(p, 915, 1305, [屏极], size: 9pt); txt(p, 915, 1377, [阴极], size: 9pt)
  line(p(942, 1308), p(1003, 1337), stroke: 0.5pt)
  line(p(942, 1383), p(1012, 1427), stroke: 0.5pt)
  diode-tube(p, 1033, 1375, rx: 52, ry: 88)
})

#let fig-6-17(width: 4.2cm) = px-canvas(215, 440, origin: (130, 185), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(230, 320), radius: 86, stroke: 1.3pt)
  wire(p, (237, 190), (237, 287))
  line(p(205, 287), p(268, 287), stroke: 2.4pt)
  for (x, y) in ((173, 326), (213, 323), (263, 328), (303, 338), (190, 352), (235, 349), (268, 357), (182, 372), (222, 372), (288, 372)) {
    circle(p(x, y), radius: 9, stroke: 0.7pt, fill: white)
    line(p(x - 5, y), p(x + 5, y), stroke: 0.7pt)
  }
  bezier(p(208, 392), p(272, 392), p(222, 378), p(258, 378), stroke: 2.4pt)
  wire(p, (208, 392), (208, 517), (233, 517))
  wire(p, (272, 392), (272, 517), (256, 517))
  line(p(233, 508), p(233, 526), stroke: 1.2pt)
  line(p(241, 503), p(241, 531), stroke: 2.2pt)
  line(p(248, 508), p(248, 526), stroke: 1.2pt)
  line(p(256, 503), p(256, 531), stroke: 2.2pt)
  txt(p, 212, 520, [−], size: 8pt); txt(p, 262, 520, [+], size: 8pt)
})
