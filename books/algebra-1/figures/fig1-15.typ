// 图 1·15–1·18 火车行驶的数轴示意图（原书 p.46 图 1·15；p.47 图 1·16、图 1·17；p.48 图 1·18）
// 坐标取自各图局部放大图（200 dpi 页面像素 ÷ 局部原点，y 向下）；四幅图版式相同，共用 numline。
// 原图中“車、時”等为繁体，这里照现行字形写作“车、时”。
#import "/common/series.typ": *

// ys: (轴, 时间线, 上标签, 下标签) 的 y；xs: 四个刻度的 x；dir: "right" 箭头向右，"left" 向左
#let numline(w, h, x0, x1, ys, xs, top, bot, dir, west, east, extra: ()) = px-canvas(w, h, width: 11cm, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 7.5pt, body))
  let (ay, ly, ty, by) = ys
  // 数轴
  line(p(x0, ay), p(x1, ay), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.45))
  for x in xs { circle(p(x, ay), radius: 1.6 * u, fill: white, stroke: 0.5pt) }
  // 时间线：每段一个箭头，两端竖线
  for x in xs { line(p(x, ly - 6), p(x, ly + 6), stroke: 0.5pt) }
  for i in range(3) {
    let (a, b) = if dir == "right" { (xs.at(i), xs.at(i + 1)) } else { (xs.at(i + 1), xs.at(i)) }
    line(p(a, ly), p(b, ly), stroke: 0.5pt, mark: (end: "stealth", fill: black, scale: 0.3))
  }
  for (i, s) in top.enumerate() { t(xs.at(i), ty, s) }
  for (i, s) in bot.enumerate() { t(xs.at(i), by, s) }
  t(west.at(0), west.at(1), [西])
  t(east.at(0), east.at(1), [东])
  for (x, y, s) in extra { t(x, y, s) }
})

#let fig-1-15() = numline(840, 100, 48, 747, (63, 45, 27, 83),
  (167, 309, 452, 599),
  ([中午], [午后 1 小时], [午后 2 小时], [午后 3 小时]),
  ([甲车站], [+40], [+80], [+120 公里]),
  "right", (32, 63), (790, 70))

#let fig-1-16() = numline(840, 105, 105, 778, (71, 53, 32, 88),
  (206, 346, 489, 633),
  ([午后 3 小时], [午后 2 小时], [午后 1 小时], [中午]),
  ([−120 公里], [−80], [−40], [甲车站]),
  "left", (85, 71), (812, 71))

#let fig-1-17() = numline(840, 175, 110, 780, (110, 90, 67, 127),
  (226, 368, 510, 653),
  ([午前 3 小时], [午前 2 小时], [午前 1 小时], [中午]),
  ([−120 公里], [−80], [−40], [甲车站]),
  "right", (93, 112), (812, 112), extra: ((233, 162, [火车]),))

#let fig-1-18() = numline(840, 115, 38, 743, (81, 63, 43, 97),
  (162, 304, 447, 590),
  ([中午], [午前 1 小时], [午前 2 小时], [午前 3 小时]),
  ([甲车站], [+40], [+80], [+120 公里]),
  "left", (23, 81), (775, 85))
