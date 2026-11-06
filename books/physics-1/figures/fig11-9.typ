// 图 11·9 恒力作功（原书 p.338）、图 11·10 F-s 图线（原书 p.338）
// 示意图/坐标图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 11·10 中矩形内的斜线按等距斜线重绘。
#import "/common/series.typ": *

#let fig-11-9(width: 8cm) = px-canvas(560, 180, origin: (340, 190), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  line(p(345, 290), p(885, 290), stroke: 1.4pt)
  line(p(478, 290), p(478, 213), p(393, 213), p(393, 290), stroke: 1.2pt)
  line(p(760, 290), p(760, 213), p(675, 213), p(675, 290), stroke: dash)
  line(p(478, 252), p(555, 252), stroke: 1pt, mark: arr)
  line(p(760, 252), p(830, 252), stroke: dash, mark: arr)
  lab(535, 225, $F$)
  lab(805, 225, $F$)
  line(p(478, 335), p(590, 335), stroke: 0.7pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(630, 335), p(760, 335), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(478, 320), p(478, 350), stroke: 0.8pt)
  line(p(760, 320), p(760, 350), stroke: 0.8pt)
  lab(610, 335, $s_0$)
})

#let fig-11-10(width: 6.4cm) = px-canvas(440, 290, origin: (900, 115), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let (x0, y0, x1) = (930, 360, 1162)
  let ytop = 187
  // 斜线
  let h = y0 - ytop
  let d = 20
  let t = -h
  while t < x1 - x0 {
    let s0 = calc.max(0, -t / h)
    let s1 = calc.min(1, (x1 - x0 - t) / h)
    if s1 > s0 {
      line(p(x0 + t + s0 * h, y0 - s0 * h), p(x0 + t + s1 * h, y0 - s1 * h), stroke: 0.5pt)
    }
    t += d
  }
  // 坐标轴
  line(p(x0, y0), p(x0, 128), stroke: 1pt, mark: arr)
  line(p(x0, y0), p(1310, y0), stroke: 1pt, mark: arr)
  // 图线 MN 与 s₀ 垂线
  line(p(x0, ytop), p(1295, ytop), stroke: 1pt)
  line(p(x1, ytop), p(x1, y0), stroke: 1pt)
  // 刻度
  for (v, y) in ((8, 187), (6, 231), (4, 274), (2, 318)) {
    lab(912, y, str(v))
  }
  for (v, x) in (("0", 930), ("0.5", 988), ("1", 1050), ("1.5", 1110), ("2", 1162)) {
    lab(x, 384, v)
  }
  lab(1005, 132, $F$)
  lab(1040, 132, [（牛顿）])
  lab(1300, 383, $s$)
  lab(1330, 383, [（米）])
  lab(942, 170, $M$)
  lab(1168, 166, $N'$)
  lab(1300, 178, $N$)
  lab(1000, 272, $W$)
  lab(1068, 272, $F s_0$)
  lab(1186, 340, $s_0$)
})
