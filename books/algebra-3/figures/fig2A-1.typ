// 图 2·1（原书 p.79）：火车行驶距离的线段图；图 2·2–2·4（原书 p.86–87）：函数定义域在数轴上的表示。
// 坐标取自 130 dpi 页面像素（y 向下），按原图大致比例取，未用网格精量。
// 说明：原图 2·2、2·3 的数轴整条印得较重，这里与第 1 章一致：数轴细线，解的范围上加粗。
#import "/common/series.typ": *

#let tx(p, x, y, body) = cetz.draw.content(p(x, y), text(font: fonts.song, size: 8pt, body))
#let arr = (end: "stealth", fill: black, scale: 0.5)

// 图 2·1：s = 2 + (2/3) t 的三条线段（上：2 公里 + 2/3·t；中：总长；下：s，起点标“甲站”）
#let fig-2-1(width: 9cm) = px-canvas(440, 130, width: width, origin: (320, 630), (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = tx(p, x, y, body)
  let tick(x, y) = line(p(x, y - 5), p(x, y + 5), stroke: 0.6pt)
  // 上排：|←—2公里—→|←——2/3 t——→|
  let y1 = 660
  tick(337, y1); tick(517, y1); tick(737, y1)
  line(p(337, y1), p(517, y1), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5))
  line(p(517, y1), p(737, y1), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5))
  content(p(427, y1), box(fill: white, inset: (x: 2pt, y: 0pt), text(font: fonts.song, size: 8pt)[2 公里]))
  content(p(628, y1), box(fill: white, inset: (x: 2pt, y: 0pt), text(font: fonts.song, size: 8pt)[$2/3 space t$]))
  // 中排：总长，中间有小刻度
  let y2 = 690
  line(p(337, y2), p(737, y2), stroke: 0.8pt)
  tick(337, y2); tick(517, y2); tick(737, y2)
  // 下排：s
  let y3 = 722
  tick(337, y3); tick(737, y3)
  line(p(337, y3), p(737, y3), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5))
  content(p(527, y3), box(fill: white, inset: (x: 2pt, y: 0pt), text(font: fonts.song, size: 8pt)[$s$]))
  t(352, 740, [甲站])
})

// 数轴 + 加粗区间 + 带箭头的折线框
// 辅助：公共数轴
#let axis(p, y, a, b, xl) = {
  import cetz.draw: *
  line(p(a, y), p(b, y), stroke: 0.6pt, mark: arr)
  tx(p, xl, y, $x$)
}

// 图 2·2：区间 [−5, 5]（闭，实心点）
#let fig-2-2(width: 9cm) = px-canvas(680, 90, width: width, origin: (180, 190), (p, u) => {
  import cetz.draw: *
  let ay = 233
  line(p(332, ay), p(700, ay), stroke: 1.6pt)
  axis(p, ay, 228, 800, 820)
  // 上方折线框，两个箭头相向
  line(p(332, ay), p(332, 208), p(700, 208), p(700, ay), stroke: 0.6pt)
  line(p(450, 208), p(470, 208), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(580, 208), p(560, 208), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  for x in (332, 700) { circle(p(x, ay), radius: 4 * u, fill: black, stroke: 0.6pt) }
  tx(p, 332, 252, [−5])
  tx(p, 700, 252, [5])
})

// 图 2·3：x ≤ −5 或 x ≥ 5（实心点）
#let fig-2-3(width: 9cm) = px-canvas(730, 85, width: width, origin: (170, 715), (p, u) => {
  import cetz.draw: *
  let ay = 765
  line(p(185, ay), p(332, ay), stroke: 1.6pt)
  line(p(692, ay), p(855, ay), stroke: 1.6pt)
  axis(p, ay, 185, 860, 880)
  line(p(332, ay), p(332, 741), p(185, 741), stroke: 0.6pt, mark: arr)
  line(p(692, ay), p(692, 743), p(855, 743), stroke: 0.6pt, mark: arr)
  for x in (332, 692) { circle(p(x, ay), radius: 4 * u, fill: black, stroke: 0.6pt) }
  tx(p, 332, 783, [−5])
  tx(p, 692, 783, [5])
})

// 图 2·4：开区间 (−5, 5)（空心圈）
#let fig-2-4(width: 9cm) = px-canvas(650, 90, width: width, origin: (200, 1300), (p, u) => {
  import cetz.draw: *
  let ay = 1350
  line(p(320, ay), p(688, ay), stroke: 1.6pt)
  axis(p, ay, 215, 800, 828)
  line(p(320, ay), p(320, 1325), p(688, 1325), p(688, ay), stroke: 0.6pt)
  line(p(430, 1325), p(450, 1325), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(580, 1325), p(560, 1325), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  for x in (320, 688) { circle(p(x, ay), radius: 4 * u, fill: white, stroke: 0.6pt) }
  tx(p, 320, 1370, [−5])
  tx(p, 688, 1370, [5])
})
