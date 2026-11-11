// 段 E（第 1 章 §1·13、习题 1·13、本章提要、复习题一；第 2 章 §2·1–§2·3）插图的共用小工具。
// 坐标一律为原书页面像素（200 dpi，宽约 1000，y 向下），取自 build/pages/g1/p00NN.png 和 crop-view 的网格图。
#import "/common/geo.typ": *

#let k = 0.0152cm

// 居中的文字（页面坐标）
#let E-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
// 小数字标注（角 1、2…）
#let E-n(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tsm(body))
}
// 放置 PNG：box = (x0, y0, x1, y1) 为它在页面上的像素范围
#let E-img(p, u, path, box) = {
  import cetz.draw: *
  let (x0, y0, x1, y1) = box
  content(p(x0, y0), image(path, width: (x1 - x0) * u), anchor: "north-west")
}
// 圆弧：圆心 c（页面坐标）、半径 r（像素）、起止角（度，数学角：右 0°、上 90°、左 180°、下 270°）
#let E-arc(p, c, r, a0, a1, ..style) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: lw, ..style)
}
// 粗实线（原图里描粗的弧线）
#let E-arcb(p, c, r, a0, a1) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: lb)
}
// 双弧（相等角记号）
#let E-ang2(p, v, a, b, r, gap: 5) = {
  anglearc(p, v, a, b, r)
  anglearc(p, v, a, b, r + gap)
}
// 两直线交点（点 a1→a2 与 b1→b2 所在直线）
#let E-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 点 a + t (b - a)
#let E-at(a, b, t) = (a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1)))
// 阴影线（图 2·7 的纸片）
#let E-hv = tiling(size: (2.4pt, 4pt), line(start: (1.2pt, 0pt), end: (1.2pt, 4pt), stroke: 0.45pt))
#let E-hd = tiling(size: (3pt, 3pt), line(start: (0pt, 3pt), end: (3pt, 0pt), stroke: 0.45pt))
