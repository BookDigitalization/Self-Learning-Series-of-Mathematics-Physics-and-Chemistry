// 图 1·2 自然界里一些长度的实例（原书 p.3）
// 数轴、刻度、指示线、文字标注用 CeTZ 重绘；写实小图标沿用原扫描裁剪（fig1-2-*.png）。
// 坐标是原书 p.3 的页面像素坐标（render-pages.py --dpi 200 的显示图，宽 1568）。
#import "/common/series.typ": *

// 刻度标注：10^-10 … 10^10，每隔 10^2（指数步长 2）标一个，中间每个指数（10^1 步长）画一条小刻度。
// 扫描里这些指数很模糊，具体值由项目负责人确认：第 6 个刻度是 10^0，各标注按步长 2 排列。
// 光的波长按实际数量级放在 10^-7 处（两个标注 10^-8 与 10^-6 的正中，即一条小刻度上），
// 不是扫描里的位置（原图画在第 2 个标注下面）——这是对原图的更正。
#let fig-1-2(width: 12.5cm) = px-canvas(1180, 555, origin: (320, 495), width: width, (p, u) => {
  import cetz.draw: *
  let label(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor,
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  let icon(file, w, cx, cy) = content(p(cx, cy), image(file, width: w * u))

  // 数轴：左端加粗，右端箭头
  let ax = 808
  line(p(333, ax), p(1368, ax), stroke: 1.1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(333, ax), p(362, ax), stroke: 2.4pt)

  // 刻度：指数 e = -10 … 10，每个指数一条小刻度，偶数指数处标注
  let ex(e) = 383 + 44.8 * (e + 10)      // 指数 e 对应的 x
  for e in range(-10, 11) {
    line(p(ex(e), ax), p(ex(e), ax - if calc.even(e) { 14 } else { 8 }), stroke: 0.8pt)
    if calc.even(e) {
      content(p(ex(e) + 6, 834), anchor: "center", text(size: 8pt, $10^#e$))
    }
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

  // 光的波长：10^-7，指在数轴下方
  let wx = ex(-7)
  line(p(wx, 858), p(wx, 898), stroke: 1pt)
  icon("fig1-2-wave.png", 123, wx + 3.5, 914)
  label(wx + 2, 940, [光的波长])
})
