// 图 6·6 由闭合电路变成开放电路（原书 p.312）。CeTZ 重绘；
// 坐标取自 250 dpi 的局部裁图（原点为裁图左上角，裁图左上角在 150 dpi 页面像素 (270,530)）。
#import "/common/series.typ": *

// 极板（斜线阴影的细条），(a,b) 两端
#let plate(p, a, b, w: 9) = {
  import cetz.draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let l = calc.sqrt(dx * dx + dy * dy)
  let nx = -dy / l * w / 2
  let ny = dx / l * w / 2
  line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), p(b.at(0) - nx, b.at(1) - ny), p(a.at(0) - nx, a.at(1) - ny), close: true, stroke: 0.8pt, fill: luma(200))
}
// 竖直线圈（n 匝），轴 x，自 ya 到 yb，向右鼓出
#let vcoil(p, x, ya, yb, n: 3, w: 24, side: 1) = {
  import cetz.draw: *
  let steps = 20
  let pts = range(0, n * steps + 1).map(i => {
    let t = i / steps
    let k = calc.floor(t)
    let f = t - k
    (x + side * w * calc.sin(calc.pi * f), ya + (yb - ya) * t / n)
  })
  line(..pts.map(q => p(..q)), stroke: 0.8pt)
}
// 自 (x0,y0) 到 (x1,y1) 的鼓出曲线，xm 为中间最远处的 x
#let bulge(p, x0, y0, x1, y1, xm, a: 60) = {
  import cetz.draw: *
  let xo = (8 * xm - x0 - x1) / 6
  bezier(p(x0, y0), p(x1, y1), p(xo, y0 - a), p(xo, y1 + a), stroke: 1.0pt)
}

#let fig-6v-6(width: 9cm) = px-canvas(1050, 650, origin: (0, 0), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  // ($a$) 闭合电路
  line(p(95, 232), p(240, 232), p(240, 258), stroke: 0.8pt)
  vcoil(p, 240, 258, 345, n: 3, w: 22)
  line(p(240, 345), p(240, 390), p(95, 390), p(95, 332), stroke: 0.8pt)
  line(p(95, 232), p(95, 287), stroke: 0.8pt)
  plate(p, (55, 287), (175, 287), w: 9)
  plate(p, (55, 332), (175, 332), w: 9)
  bezier(p(52, 296), p(52, 324), p(25, 298), p(25, 322), stroke: 0.8pt)
  // ($b$) 两极板张开
  plate(p, (440, 208), (500, 258), w: 10)
  plate(p, (440, 396), (500, 350), w: 10)
  vcoil(p, 560, 268, 332, n: 3, w: 24)
  for (xm, y0, y1) in ((325, 160, 450), (365, 185, 425), (405, 215, 395)) {
    bulge(p, 442, y0, 442, y1, xm, a: 50)
  }
  for (xm, y0, y1) in ((612, 195, 445), (580, 222, 420), (545, 250, 368)) {
    bulge(p, 505, y0, 505, y1, xm, a: 50)
  }
  circle(p(513, 305), radius: (27, 56), stroke: 1.0pt)
  // ($c$) 开放电路：两极板分开到两端
  line(p(830, 15), p(830, 148), stroke: 0.9pt)
  line(p(830, 148), p(830, 255), p(822, 255), p(822, 268), stroke: 0.8pt)
  vcoil(p, 830, 270, 332, n: 3, w: -20)
  line(p(830, 332), p(830, 455), stroke: 0.8pt)
  line(p(830, 455), p(830, 562), stroke: 0.9pt)
  plate(p, (793, 148), (868, 148), w: 10)
  plate(p, (793, 455), (868, 455), w: 10)
  for xm in (668, 735, 785) { bulge(p, 800, 152, 800, 452, xm, a: 70) }
  for xm in (870, 925, 1005) { bulge(p, 860, 152, 860, 452, xm, a: 70) }
  // 向外辐射的电场线
  for (dx, dy) in ((-125, -50), (-90, -90), (-45, -118), (45, -118), (90, -90), (125, -50)) {
    bezier(p(830 + dx / 8, 145), p(830 + dx, 145 + dy), p(830 + dx / 8, 145 + dy * 0.6), p(830 + dx * 0.55, 145 + dy), stroke: 0.9pt)
    bezier(p(830 + dx / 8, 458), p(830 + dx, 458 - dy), p(830 + dx / 8, 458 - dy * 0.6), p(830 + dx * 0.55, 458 - dy), stroke: 0.9pt)
  }
  // 标注
  lab(168, 580, $(a)$); lab(517, 580, $(b)$); lab(830, 600, $(c)$)
})
