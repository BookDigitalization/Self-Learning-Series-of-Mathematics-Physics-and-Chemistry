// 图 13·16 例 6 物体的运动轨迹（原书 p.434）
// 坐标图，按表中数据重绘：横轴 x（米），刻度 60、120、…、360；纵轴 y（米），刻度 60、120；点 O A B C D E F G H I。
// 坐标是页面显示图（宽 1568）上的像素坐标；点位按表中数据换算（x 1.45 像素/米，y 1.5 像素/米）。
// 原图点的位置与表中数据大体吻合；虚线（过 A、D 的水平线，各点垂线）为目测。
#import "/common/series.typ": *

#let fig-13-16(width: 9.6cm) = px-canvas(700, 330, origin: (500, 715), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let dsh = (thickness: 0.7pt, dash: "dashed")
  let (ox, oy) = (570, 1008)
  let px(x) = ox + 1.45 * x
  let py(y) = oy - 1.5 * y
  line(p(ox, oy), p(ox, 733), stroke: 1.6pt, mark: arr)
  line(p(ox, oy), p(1135, oy), stroke: 1.6pt, mark: arr)
  lab(618, 740, [$y$（米）])
  lab(1170, 1010, [$x$（米）])
  lab(556, 1013, $O$)
  for (k, v) in ((60, 60), (120, 120), (180, 180), (240, 240), (300, 300), (360, 360)) {
    line(p(px(k), oy), p(px(k), oy - 5), stroke: 0.7pt)
    lab(px(k), 1015, str(v))
  }
  for v in (60, 120) {
    line(p(ox, py(v)), p(ox + 6, py(v)), stroke: 0.7pt)
    lab(550, py(v), str(v))
  }
  // 点
  let pts = ((42.43, 37.43), (84.86, 64.86), (127.29, 82.29), (169.72, 89.72), (212.15, 87.15),
    (254.58, 74.58), (297.01, 52.01), (339.44, 19.44), (360, 0))
  let names = ("A", "B", "C", "D", "E", "F", "G", "H", "I")
  // 轨迹：y = x − g x²/(v0² cos²θ)·… 按 y = x·tg45° − g x²/(2 v0² cos²45°) = x − x²/360
  line(..range(0, 74).map(k => {
    let x = k * 5.0
    p(px(x), py(x - x * x / 360))
  }), stroke: 1.4pt)
  for (i, (x, y)) in pts.enumerate() {
    line(p(px(x), py(y)), p(px(x), oy), stroke: (if i == 3 { (thickness: 1.4pt, dash: "dashed") } else { dsh }))
    circle(p(px(x), py(y)), radius: 2.5 * u, fill: black, stroke: none)
    let off = if i == 8 { (-12, -22) } else { (0, -16) }
    lab(px(x) + off.at(0), py(y) + off.at(1), text(size: 9pt, eval("$" + names.at(i) + "$")))
  }
  line(p(ox, py(37.43)), p(px(42.43), py(37.43)), stroke: dsh)
  line(p(ox, py(89.72)), p(px(169.72), py(89.72)), stroke: dsh)
  // 初速度
  line(p(ox, oy), p(642, 912), stroke: 1.4pt, mark: arr)
  lab(620, 897, $v_0$)
})
