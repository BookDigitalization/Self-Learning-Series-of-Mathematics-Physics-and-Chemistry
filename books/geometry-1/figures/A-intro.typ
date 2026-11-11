// 绪论插图（图 1–图 10）。原书 p.1–7，读坐标时的页面渲染 200 dpi。
// 写实插画（床、汽车、车间、田野、陶罐、木料、铅桶、球、玻璃杯、火柴盒、墨水、铅笔）保留原扫描裁剪的二值化 PNG，
// 图中文字全部涂去后用 CeTZ 真文字补上；几何图（图 4、图 9 的线与弧、图 10）用 CeTZ 重绘。
#import "/books/geometry-1/figures/A-lib.typ": *

// 图 1（p.1）：床、汽车
#let fig-A-i1(width: 740 * k) = px-canvas(740, 240, origin: (160, 930), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i1-bed.png", (170, 970, 465, 1125))
  A-img(p, u, "A-i1-car.png", (505, 935, 890, 1130))
  A-t(p, (343, 1147), [床])
  A-t(p, (693, 1150), [汽车])
})

// 图 2（p.2）：车间、田野（左右两幅）
#let fig-A-i2(width: 710 * k) = px-canvas(710, 385, origin: (110, 290), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i2-shop.png", (120, 295, 450, 665))
  A-img(p, u, "A-i2-field.png", (480, 295, 815, 670))
})

// 图 3（p.3）：黑陶罐
#let fig-A-i3(width: 490 * k) = px-canvas(490, 260, origin: (240, 990), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i3-pots.png", (245, 995, 725, 1245))
})

// 方格组成的平行四边形：顶点 o，两边向量 e1（n 格）、e2（m 格）
#let A-grid(p, o, e1, e2, n, m) = {
  import cetz.draw: *
  let q(i, j) = p(o.at(0) + e1.at(0) * i / n + e2.at(0) * j / m, o.at(1) + e1.at(1) * i / n + e2.at(1) * j / m)
  for i in range(n + 1) { line(q(i, 0), q(i, m), stroke: lw) }
  for j in range(m + 1) { line(q(0, j), q(n, j), stroke: lw) }
}

// 图 4（p.4）：勾股定理（3:4:5）
#let fig-A-i4(width: 545 * k) = px-canvas(545, 575, origin: (245, 385), width: width, (p, u) => {
  import cetz.draw: *
  let (a, b, c) = ((380, 688), (644, 688), (549, 561))
  A-grid(p, a, (169, -127), (-127, -169), 4, 4)   // 直角边 4 上的正方形
  A-grid(p, c, (95, 127), (127, -95), 3, 3)       // 直角边 3 上的正方形
  A-grid(p, a, (264, 0), (0, 265), 5, 5)          // 斜边 5 上的正方形
  rtmark(p, c, a, b, s: 10)
  A-t(p, (480, 627), [4])
  A-t(p, (584, 627), [3])
  A-t(p, (522, 675), [5])
})

// 图 5（p.5）：圆形木料、铅桶
#let fig-A-i5(width: 470 * k) = px-canvas(470, 250, origin: (230, 145), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i5-log.png", (327, 150, 470, 390))
  A-img(p, u, "A-i5-bucket.png", (490, 150, 650, 390))
  A-t(p, (278, 260), [圆形木料])
  line(p(312, 262), p(331, 266), stroke: lt)
  A-t(p, (676, 262), [铅桶])
  line(p(660, 260), p(641, 258), stroke: lt)
})

// 图 6（p.5）：皮球、木球
#let fig-A-i6(width: 420 * k) = px-canvas(420, 210, origin: (270, 535), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i6-ball.png", (275, 540, 460, 705))
  A-img(p, u, "A-i6-wood.png", (500, 540, 680, 705))
  A-t(p, (360, 723), [皮球])
  A-t(p, (590, 723), [木球])
})

// 图 7（p.5）：玻璃杯里的水和油
#let fig-A-i7(width: 265 * k) = px-canvas(265, 270, origin: (615, 920), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i7-glass.png", (620, 925, 780, 1185))
  A-t(p, (793, 1012), [油])
  line(p(781, 1017), p(762, 1025), stroke: lw)
  A-t(p, (806, 1043), [分界面])
  line(p(777, 1046), p(757, 1051), stroke: lw)
  A-t(p, (790, 1082), [水])
  line(p(776, 1080), p(755, 1090), stroke: lw)
})

// 图 8（p.6）：火柴盒的棱和顶点、一滴墨水
#let fig-A-i8(width: 720 * k) = px-canvas(720, 170, origin: (130, 295), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-i8-box.png", (138, 305, 478, 458))
  A-t(p, (202, 322), [棱])
  A-t(p, (160, 410), [顶点])
  poly(p, ((607, 302), (842, 301), (774, 440), (546, 437)), close: true)
  A-img(p, u, "A-i8-ink.png", (640, 330, 762, 422))
  A-t(p, (749, 338), [墨水])
  line(p(745, 346), p(735, 356), stroke: lt)
})

// 图 9（p.6）：两线相交、两弧相交、笔尖所画的点
#let fig-A-i9(width: 620 * k) = px-canvas(620, 205, origin: (200, 695), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (253, 744), (405, 853))
  seg(p, (213, 874), (402, 787))
  A-t(p, (345, 829), [点])
  arc(p(530, 850), start: 21deg, stop: 201deg, radius: 78, anchor: "origin", stroke: lw)
  arc(p(613, 842), start: -17deg, stop: 184deg, radius: 80, anchor: "origin", stroke: lw)
  A-t(p, (568, 800), [点])
  A-img(p, u, "A-i9-pencil.png", (728, 700, 764, 866))
  seg(p, (743, 869), (790, 882))
  A-t(p, (780, 866), [点])
})

// 图 10（p.7）：几个平面图形
#let fig-A-i10(width: 710 * k) = px-canvas(710, 140, origin: (150, 235), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((182, 244), (841, 246), (820, 364), (164, 362)), close: true)
  seg(p, (207, 267), (307, 337))
  seg(p, (204, 334), (316, 287))
  poly(p, ((420, 273), (321, 337), (429, 337)))
  seg(p, (450, 280), (571, 280))
  seg(p, (450, 337), (571, 337))
  poly(p, ((600, 339), (677, 273), (711, 339)), close: true)
  // 画斜线的椭圆（水平线填充）
  let (cx, cy, ea, eb, ph) = (775, 308, 53, 34, 50deg)
  let pt(t) = (
    cx + ea * calc.cos(t) * calc.cos(ph) + eb * calc.sin(t) * calc.sin(ph),
    cy - ea * calc.cos(t) * calc.sin(ph) + eb * calc.sin(t) * calc.cos(ph),
  )
  let pts = range(0, 121).map(i => pt(i * 3deg))
  line(..pts.map(t => p(..t)), close: true, stroke: lw)
  let y = 264.0
  while y < 354 {
    let xs = ()
    for i in range(120) {
      let (a, b) = (pts.at(i), pts.at(i + 1))
      if (a.at(1) - y) * (b.at(1) - y) < 0 {
        xs.push(a.at(0) + (b.at(0) - a.at(0)) * (y - a.at(1)) / (b.at(1) - a.at(1)))
      }
    }
    if xs.len() >= 2 { line(p(calc.min(..xs), y), p(calc.max(..xs), y), stroke: lt) }
    y += 4.5
  }
})
