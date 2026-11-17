// 图 4·1（原书 p.113）用来研究气体压强和体积关系的装置。
// 左边的支架装置是写实插画，沿用原扫描裁剪（fig4-1.png，已涂去字母 M、A、B、C，字母用 CeTZ 补回）；
// 右边 (a)(b)(c) 三个连通器是示意图，按原图简化重绘。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-4-1(width: 10.5cm) = px-canvas(540, 545, origin: (305, 168), width: width, (p, u) => {
  import cetz.draw: *
  let it = (s, sz: 9pt) => text(size: sz, style: "italic", s)
  let sm = s => text(size: 8pt, s)
  // 玻璃管：粗黑线上叠白线
  let tube(pts, w: 6pt) = {
    line(..pts.map(a => p(..a)), stroke: (thickness: w, paint: black, cap: "round", join: "round"))
    line(..pts.map(a => p(..a)), stroke: (thickness: w - 2.4pt, paint: white, cap: "round", join: "round"))
  }
  // 汞柱：黑色粗线
  let hg(x, y0, y1) = line(p(x, y0), p(x, y1), stroke: (thickness: 3.4pt, cap: "butt"))
  // 橡皮管接头：较粗的带边框矩形
  let rub(x, y0, y1) = rect(p(x - 6, y0), p(x + 6, y1), stroke: 0.9pt, fill: white)
  // U 形连通器的轮廓点
  let utube(xl, xr, yl, yr, yb) = {
    let r = (xr - xl) / 2
    let cx = (xl + xr) / 2
    let arc = range(0, 17).map(i => {
      let th = calc.pi * (1 - i / 16)
      (cx + r * calc.cos(th), yb + r * calc.sin(th))
    })
    ((xl, yl),) + arc + ((xr, yr),)
  }
  // 开关（阀门）旋钮
  let knob(x, y) = {
    circle(p(x, y), radius: 4, fill: white, stroke: 0.9pt)
    line(p(x + 4, y), p(x + 14, y - 3), stroke: 1.2pt)
    line(p(x + 4, y), p(x + 14, y + 4), stroke: 1.2pt)
  }
  // 左：写实装置
  content(p(305, 168), anchor: "north-west", image("fig4-1.png", width: 157 * u))
  content(p(433, 200), it[M])
  content(p(436, 268), it[B])
  content(p(345, 309), it[A])
  content(p(396, 517), it[C])
  content(p(447, 603), it[M])

  // (a)
  tube(utube(500, 538, 290, 309, 540))
  hg(500, 349, 387)
  hg(538, 349, 387)
  rub(500, 385, 405)
  rub(538, 385, 405)
  knob(500, 299)
  line(p(504, 346), p(538, 346), stroke: (thickness: 0.5pt, dash: "dashed"))
  content(p(484, 328), sm[5])
  content(p(484, 349), sm[10])
  content(p(484, 369), sm[15])
  content(p(478, 297), it[A])
  content(p(556, 328), it[B])
  content(p(521, 566), it[C])
  content(p(518, 618), it[(a)])

  // (b)
  tube(utube(611, 648, 372, 218, 543))
  hg(648, 266, 292)
  hg(611, 414, 470)
  rub(611, 468, 488)
  knob(611, 386)
  line(p(611, 413), p(682, 413), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(648, 267), p(682, 267), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(676, 267), p(676, 413), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  content(p(676, 340), angle: -90deg, box(fill: white, inset: 1pt, text(size: 8.5pt)[75 厘米]))
  content(p(597, 415), sm[5])
  content(p(597, 434), sm[10])
  content(p(597, 452), sm[15])
  content(p(590, 393), it[A])
  content(p(633, 240), it[B])
  content(p(667, 444), it[C])
  content(p(635, 618), it[(b)])

  // (c)
  tube(utube(722, 761, 192, 302, 505))
  hg(722, 268, 298)
  hg(761, 322, 378)
  rub(761, 378, 402)
  knob(722, 199)
  line(p(722, 266), p(792, 266), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(761, 320), p(792, 320), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(786, 266), p(786, 320), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  content(p(812, 293), angle: -90deg, text(size: 8.5pt)[25 厘米])
  content(p(706, 224), sm[5])
  content(p(706, 245), sm[10])
  content(p(706, 266), sm[15])
  content(p(736, 244), it[A])
  content(p(774, 349), it[B])
  content(p(706, 418), it[C])
  content(p(744, 618), it[(c)])
})
