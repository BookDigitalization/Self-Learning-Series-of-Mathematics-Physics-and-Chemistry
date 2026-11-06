// 图 1·2 自然界里一些长度的实例（原书 p.3）
// 数轴、刻度、指示线、文字标注用 CeTZ 重绘；写实小图标沿用原扫描裁剪（fig1-2-*.png）。
// 坐标是原书 p.3 的页面像素坐标（render-pages.py --dpi 200 的显示图，宽 1568）。
#import "/common/series.typ": *

// TODO: 原扫描里各刻度的指数很模糊，下面的写法按"-10 到 10、步长 2"的规律定，其中
//   · 第 2、3 个刻度（扫描上像 10^-6、10^-6，推断为 -8、-6）
//   · 第 6 个刻度（扫描上只有"0"，推断为 10^0）
//   用 #unclear 标出，其余 -2、2、6、8 也是由规律推断，待对照纸质书核实。
#let fig-1-2(width: 12.5cm) = px-canvas(1180, 555, origin: (320, 495), width: width, (p, u) => {
  import cetz.draw: *
  let label(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor,
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  let icon(file, w, cx, cy) = content(p(cx, cy), image(file, width: w * u))

  // 数轴：左端加粗，右端箭头
  let ax = 808
  line(p(333, ax), p(1368, ax), stroke: 1.1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(333, ax), p(362, ax), stroke: 2.4pt)

  // 11 个刻度：10^-10 … 10^10，步长 2
  let flag(body) = box(fill: rgb("#ffe58f"), inset: (x: 1pt, y: 2pt), body)  // 同 #unclear，但公式里 highlight 不起作用
  let exps = (
    $10^(-10)$, flag($10^(-8)$), flag($10^(-6)$), $10^(-4)$, $10^(-2)$,
    flag($10^0$), $10^2$, $10^4$, $10^6$, $10^8$, $10^(10)$,
  )
  for (k, e) in exps.enumerate() {
    let x = 383 + 89.6 * k
    line(p(x, ax), p(x, ax - 7), stroke: 0.6pt)
    content(p(x + 6, 834), anchor: "center", text(size: 8pt, e))
  }

  // 各实例：标注文字、图标、指向数轴的竖线
  label(385, 617, [原子直径])
  icon("fig1-2-atom.png", 79, 382.5, 696.5)
  line(p(381, 738), p(381, 782), stroke: 1.6pt)

  label(636, 614, [人发直径])
  icon("fig1-2-hair.png", 70, 635, 701.5)
  line(p(622, 752), p(622, 780), stroke: 0.8pt)

  label(820, 601, [人高])
  icon("fig1-2-human.png", 47, 826.5, 679)
  line(p(825, 740), p(825, 780), stroke: 1pt)

  label(1000, 547, align(center)[珠穆朗 \ 玛峰高])
  icon("fig1-2-everest.png", 110, 997, 660.5)
  line(p(992, 735), p(992, 778), stroke: 1pt)

  label(1125, 604, [地球半径])
  icon("fig1-2-earth.png", 87, 1116.5, 666)
  line(p(1120, 735), p(1120, 780), stroke: 1pt)

  label(1295, 590, align(center)[地球轨 \ 道半径])
  icon("fig1-2-orbit.png", 117, 1296.5, 670)
  line(p(1298, 738), p(1298, 773), stroke: 0.8pt)

  // 光的波长：指在数轴下方
  line(p(473, 858), p(473, 898), stroke: 1pt)
  icon("fig1-2-wave.png", 123, 476.5, 914)
  label(475, 940, [光的波长])
})
