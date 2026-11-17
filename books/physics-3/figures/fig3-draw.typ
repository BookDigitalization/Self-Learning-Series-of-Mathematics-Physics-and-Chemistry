// 第 3 章 CeTZ 重绘的插图：图 3·6、3·8、3·26，习题 3·3 第 1、2 题附图。
// 坐标均为原书扫描页上 220 dpi 裁剪图的像素坐标（原点在裁剪区左上角，y 向下）。
#import "/common/series.typ": *

// 图 3·6 没有独立的磁极（原书 p.173）；裁剪区 (455,800)–(800,1070)（110 dpi 页坐标），690×540
#let fig-3-6(width: 8.2cm) = px-canvas(690, 540, width: width, (p, u) => {
  import cetz.draw: *
  let w = 1pt
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, style: "italic", body))
  let bar(x0, y0, x1, y1, e0, e1) = {
    rect(p(x0, y0), p(x1, y1), stroke: w)
    rect(p(x0, y0), p(x0 + e0, y1), stroke: none, fill: luma(190))
    rect(p(x1 - e1, y0), p(x1, y1), stroke: none, fill: luma(190))
    rect(p(x0, y0), p(x1, y1), stroke: w)
  }
  // (a)
  bar(82, 122, 630, 157, 70, 65)
  lab(103, 95, [N]); lab(330, 97, [P]); lab(600, 92, [S])
  lab(345, 185, [(a)])
  // (b)
  bar(45, 265, 325, 298, 55, 55)
  bar(348, 262, 628, 298, 55, 55)
  lab(78, 242, [N]); lab(313, 243, [S]); lab(372, 242, [N]); lab(600, 240, [S])
  lab(335, 345, [(b)])
  // (c)
  for (x0, ln, ls) in ((12, (37, 395), (145, 410)), (178, (200, 410), (315, 410)), (350, (368, 408), (477, 410)),
    (520, (537, 408), (642, 410))) {
    let x1 = x0 + 133
    rect(p(x0, 432), p(x1, 468), stroke: w)
    line(p(x0, 432), p(x0 + 10, 422), p(x1 + 10, 422), p(x1 + 10, 458), p(x1, 468), stroke: w)
    line(p(x1, 432), p(x1 + 10, 422), stroke: w)
    lab(..ln, [N]); lab(..ls, [S])
  }
  lab(335, 505, [(c)])
})

// 图 3·8 放在磁场里的磁针（原书 p.178）；裁剪区 (130,125)–(360,480)，460×710
#let fig-3-8(width: 5.6cm) = px-canvas(460, 710, width: width, (p, u) => {
  import cetz.draw: *
  let it(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, weight: "bold", style: "italic", body))
  // 磁针：菱形，北极一半画上斜线
  line(p(70, 540), p(215, 335), p(388, 165), p(250, 372), close: true, stroke: 1pt)
  line(p(70, 540), p(230, 355), p(388, 165), stroke: 0.7pt)
  line(p(215, 335), p(250, 372), stroke: 0.7pt)
  let a = (215, 335); let b = (250, 372); let n = (388, 165)
  for t in range(1, 12) {
    let s = t / 12
    line(p(a.at(0) + (n.at(0) - a.at(0)) * s, a.at(1) + (n.at(1) - a.at(1)) * s),
      p(b.at(0) + (n.at(0) - b.at(0)) * s, b.at(1) + (n.at(1) - b.at(1)) * s), stroke: 0.5pt)
  }
  circle(p(230, 355), radius: 5 * u, fill: black)
  // H 方向（竖直轴线，向上）
  line(p(228, 570), p(228, 130), stroke: 1.2pt, mark: (end: ">", fill: black, scale: 0.8))
  it(228, 103, [H])
  // 北极、南极所受磁场力
  line(p(388, 165), p(388, 62), stroke: 1.2pt, mark: (end: ">", fill: black, scale: 0.8))
  it(392, 40, [$m H$])
  line(p(70, 540), p(70, 655), stroke: 1.2pt, mark: (end: ">", fill: black, scale: 0.8))
  it(80, 683, [$m H$])
  it(412, 165, [N])
  it(48, 548, [S])
  // 转动方向小箭头
  line(p(265, 440), p(325, 377), stroke: 1pt, mark: (end: ">", fill: black, scale: 0.7))
})

// 图 3·26 通用电报符号（原书 p.190）；裁剪区 (240,130)–(630,260)，780×260
#let fig-3-26(width: 8.6cm) = px-canvas(780, 260, width: width, (p, u) => {
  import cetz.draw: *
  rect(p(22, 12), p(752, 242), stroke: 1.6pt)
  let dash(x0, x1, y) = line(p(x0, y), p(x1, y), stroke: 1.6pt)
  let dot(x, y) = circle(p(x, y), radius: 3.6 * u, fill: black, stroke: none)
  let num(x, y, n) = content(p(x, y), anchor: "center", text(size: 9pt, weight: "bold", str(n)))
  let row1 = 100
  let row2 = 200
  num(118, 76, 1); dot(92, row1); dash(105, 145, row1)
  num(256, 76, 2); dot(225, row1); dot(248, row1); dash(255, 297, row1)
  num(400, 74, 3); for x in (358, 378, 398) { dot(x, row1) }; dash(412, 450, row1)
  num(537, 74, 4); for x in (487, 507, 527, 547) { dot(x, row1) }; dash(560, 598, row1)
  num(680, 72, 5); for x in (640, 660, 680, 700, 720) { dot(x, row1) }
  num(113, 180, 6); dash(55, 100, row2); for x in (112, 130, 148, 165) { dot(x, row2) }
  num(258, 177, 7); dash(205, 248, row2); for x in (258, 275, 292) { dot(x, row2) }
  num(400, 177, 8); dash(360, 398, row2); for x in (415, 430) { dot(x, row2) }
  num(527, 180, 9); dash(508, 545, row2); dot(558, row2)
  num(676, 178, 0); dash(655, 695, row2)
})

// 习题 3·3 第 1 题附图：软铁棒；第 2 题附图：蹄形软铁（原书 p.191）。裁剪区 (140,1050) 起，220 dpi
#let fig-ex-3-3-1(width: 5cm) = px-canvas(452, 62, width: width, (p, u) => {
  import cetz.draw: *
  rect(p(0, 0), p(452, 62), stroke: 1.1pt)
})
#let fig-ex-3-3-2(width: 4.8cm) = px-canvas(446, 218, width: width, (p, u) => {
  import cetz.draw: *
  let w = 1.1pt
  let arc-pts(c, r, n) = range(0, n + 1).map(i => {
    let a = 90deg - 180deg * i / n
    p(c.at(0) + r * calc.cos(a), c.at(1) - r * calc.sin(a))
  })
  // 外轮廓
  line(p(0, 0), p(334, 0), ..arc-pts((334, 109), 109, 24), p(0, 218), close: false, stroke: w)
  line(p(0, 0), p(0, 58), stroke: w)
  line(p(0, 160), p(0, 218), stroke: w)
  // 内轮廓
  line(p(0, 58), p(335, 58), ..arc-pts((335, 110), 51, 20), p(0, 162), stroke: w)
})
