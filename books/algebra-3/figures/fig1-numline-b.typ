// 图 1·13–1·18 及习题 1·5(1) 第 2 题两幅示意图：数轴上表示不等式的解
// （原书 p.24 图 1·13；p.27 习题 1·5(1) 里两幅；p.28 图 1·14、图 1·15；p.38 图 1·16；p.39 图 1·17、图 1·18）。
// 坐标取自 300 dpi 裁图的像素位置（y 向下），按原图大致比例描；原图里粗线、折线的位置已逐图核对。
#import "/common/series.typ": *

// 画法元件：_axis 数轴；_thick 轴上加粗的解集；_hook 从边界点竖直向上再折向一侧的折线（可带箭头）；
// _pt 空心圈；_t 标注文字。
#let _w = 0.6pt
#let _mk = (end: "stealth", fill: black, scale: 0.55)
#let _axis(p, ay, x0, x1, arrow: true) = {
  import cetz.draw: *
  line(p(x0, ay), p(x1, ay), stroke: _w, mark: if arrow { _mk } else { none })
}
#let _thick(p, ay, a, b) = {
  import cetz.draw: *
  line(p(a, ay), p(b, ay), stroke: 1.6pt)
}
#let _pt(p, ay, x, u) = {
  import cetz.draw: *
  circle(p(x, ay), radius: 8 * u, fill: white, stroke: _w)
}
#let _hook(p, ay, xb, yt, xe, arrow: true) = {
  import cetz.draw: *
  line(p(xb, ay), p(xb, yt), p(xe, yt), stroke: _w, mark: if arrow { _mk } else { none })
}
#let _t(p, x, y, body, size: 8pt) = {
  import cetz.draw: *
  content(p(x, y), text(font: fonts.song, size: size, body))
}

// 图 1·13：x < 3 或者 x > 4
#let fig-1-13() = px-canvas(1000, 200, width: 8cm, (p, u) => {
  let ay = 150
  _axis(p, ay, 50, 910)
  _thick(p, ay, 50, 398)
  _thick(p, ay, 565, 895)
  _hook(p, ay, 398, 100, 60)
  _hook(p, ay, 565, 100, 905)
  _pt(p, ay, 398, u)
  _pt(p, ay, 565, u)
  _t(p, 398, 190, [3])
  _t(p, 565, 190, [4])
  _t(p, 945, ay, $x$)
})

// 图 1·14：x < α 或者 x > β（α < β）
#let fig-1-14() = px-canvas(1250, 200, width: 9cm, (p, u) => {
  let ay = 130
  _axis(p, ay, 60, 1165)
  _thick(p, ay, 60, 398)
  _thick(p, ay, 815, 1150)
  _hook(p, ay, 398, 78, 60)
  _hook(p, ay, 815, 88, 1160)
  _pt(p, ay, 398, u)
  _pt(p, ay, 815, u)
  _t(p, 398, 170, $alpha$)
  _t(p, 815, 170, $beta$)
  _t(p, 1210, ay, $x$)
})

// 两端带相向箭头的折线（图 1·15、习题插图）：从 a 到 b 的“夹在中间”记号
#let _between(p, ay, a, b, yt) = {
  import cetz.draw: *
  line(p(a, ay), p(a, yt), p(b, yt), p(b, ay), stroke: _w)
  let l = b - a
  line(p(a + 0.1 * l, yt), p(a + 0.34 * l, yt), stroke: _w, mark: _mk)
  line(p(b - 0.1 * l, yt), p(b - 0.34 * l, yt), stroke: _w, mark: _mk)
}

// 图 1·15：α < x < β
#let fig-1-15() = px-canvas(1130, 160, width: 8.5cm, (p, u) => {
  let ay = 100
  _axis(p, ay, 45, 1090)
  _thick(p, ay, 315, 738)
  _between(p, ay, 315, 738, 50)
  _pt(p, ay, 315, u)
  _pt(p, ay, 738, u)
  _t(p, 315, 135, $alpha$)
  _t(p, 738, 135, $beta$)
  _t(p, 1118, ay, $x$)
})

// 习题 1·5(1) 第 2 题［解法举例］：(1) x < −4 或者 x > 2
#let fig-ex1-5-a() = px-canvas(1380, 170, width: 9.5cm, (p, u) => {
  let ay = 100
  _axis(p, ay, 90, 1325)
  _thick(p, ay, 90, 430)
  _thick(p, ay, 940, 1310)
  _hook(p, ay, 430, 45, 90)
  _hook(p, ay, 940, 45, 1330)
  _pt(p, ay, 430, u)
  _pt(p, ay, 940, u)
  _t(p, 430, 140, [−4])
  _t(p, 940, 140, [2])
  _t(p, 1360, ay, $x$)
})

// 习题 1·5(1) 第 2 题［解法举例］：(2) −3 < x < −1
#let fig-ex1-5-b() = px-canvas(1000, 160, width: 7cm, (p, u) => {
  let ay = 100
  _axis(p, ay, 60, 930)
  _thick(p, ay, 305, 640)
  _between(p, ay, 305, 640, 42)
  _pt(p, ay, 305, u)
  _pt(p, ay, 640, u)
  _t(p, 305, 135, [−3])
  _t(p, 640, 135, [−1])
  _t(p, 965, ay, $x$)
})

// 图 1·16：不等式 (1) x > 1 与不等式 (2) x < −1 或者 x > 2 的解（例 1）
#let fig-1-16() = px-canvas(1180, 290, width: 8.5cm, (p, u) => {
  import cetz.draw: *
  let ay = 215
  _axis(p, ay, 90, 1085, arrow: false)
  _thick(p, ay, 833, 1085)
  _hook(p, ay, 335, 130, 90)
  _hook(p, ay, 668, 130, 1135)
  _hook(p, ay, 833, 170, 1135)
  // (2) 压在上面一条折线上
  rect(p(935, 185), p(985, 155), fill: white, stroke: none)
  _t(p, 960, 170, [(2)])
  _pt(p, ay, 335, u)
  _pt(p, ay, 668, u)
  _pt(p, ay, 833, u)
  _t(p, 235, 95, [(2)])
  _t(p, 890, 95, [(1)])
  _t(p, 335, 255, [−1])
  _t(p, 668, 255, [1])
  _t(p, 833, 255, [2])
  _t(p, 1130, ay, $x$)
})

// 图 1·17：例 2，不等式 (1) x < 1 与 (2) −1 < x < 2 的解；公共部分 −1 < x < 1 在轴上加粗
#let fig-1-17() = px-canvas(1140, 240, width: 8.5cm, (p, u) => {
  import cetz.draw: *
  let ay = 180
  _axis(p, ay, 60, 1100)
  _thick(p, ay, 305, 645)
  _hook(p, ay, 645, 95, 60)
  line(p(305, ay), p(305, 130), p(810, 130), p(810, ay), stroke: _w)
  _pt(p, ay, 305, u)
  _pt(p, ay, 645, u)
  _pt(p, ay, 810, u)
  _t(p, 385, 55, [(1)])
  _t(p, 730, 95, [(2)])
  _t(p, 305, 220, [−1])
  _t(p, 645, 220, [1])
  _t(p, 810, 220, [2])
  _t(p, 1132, ay, $x$)
})

// 图 1·18：例 3，不等式 (1) −1 < x < 3 与 (2) x < −4 或者 x > 1 的解；公共部分 1 < x < 3 在轴上加粗
#let fig-1-18() = px-canvas(1230, 260, width: 9cm, (p, u) => {
  import cetz.draw: *
  let ay = 190
  _axis(p, ay, 60, 1165)
  _thick(p, ay, 728, 895)
  _hook(p, ay, 305, 148, 60)
  line(p(560, ay), p(560, 145), p(895, 145), p(895, ay), stroke: _w)
  _hook(p, ay, 728, 105, 1170)
  _pt(p, ay, 305, u)
  _pt(p, ay, 560, u)
  _pt(p, ay, 728, u)
  _pt(p, ay, 895, u)
  _t(p, 190, 110, [(2)])
  _t(p, 635, 105, [(1)])
  _t(p, 940, 70, [(2)])
  _t(p, 305, 235, [−4])
  _t(p, 560, 235, [−1])
  _t(p, 728, 235, [1])
  _t(p, 895, 235, [3])
  _t(p, 1205, ay, $x$)
})
