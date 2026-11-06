// 图 9·25（原书 p.259）闸杆制动轮子；图 9·26（原书 p.260）直尺的力矩平衡。坐标取自页面显示图。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.4pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))

#let fig-9-25(width: 6.4cm) = px-canvas(520, 380, origin: (900, 900), width: width, (p, u) => {
  import cetz.draw: *
  // 闸杆
  rect(p(922, 997), p(1385, 1020), stroke: 1pt, fill: white)
  line(p(922, 1008), p(1385, 1008), stroke: 0.5pt)
  // 支点（右端）
  line(p(1385, 975), p(1385, 1045), stroke: 1.2pt)
  for y in range(980, 1045, step: 14) { line(p(1385, y), p(1398, y - 10), stroke: 0.6pt) }
  // 闸瓦
  rect(p(1130, 1020), p(1215, 1028), stroke: 1pt, fill: luma(200))
  // 轮子
  circle(p(1177, 1135), radius: 110 * u, stroke: 1pt)
  circle(p(1177, 1135), radius: 70 * u, stroke: 1pt)
  circle(p(1177, 1135), radius: 4 * u, fill: black)
  arc(p(1177, 1135), start: 20deg, delta: 140deg, radius: 32 * u, stroke: 1pt,
    anchor: "origin", mark: (end: "stealth", fill: black, scale: 0.4))
  _arrow(p, (958, 925), (958, 995), th: 1.6pt)
  _arrow(p, (1155, 1040), (1085, 1040))
  _lab(p, 975, 925, $P$); _lab(p, 1073, 1050, $F$); _lab(p, 1155, 1148, $O$)
})

#let fig-9-26(width: 8.4cm) = px-canvas(560, 250, origin: (770, 880), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(782, 917), p(1305, 938), stroke: 1pt)
  let nums = (6, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6)
  for (i, n) in nums.enumerate() {
    let x = 782 + i * (1305 - 782) / 12
    line(p(x, 917), p(x, 938), stroke: 0.5pt)
    _lab(p, x + 3, 897, str(n), size: 8pt)
  }
  // 支柱刀口
  line(p(1043, 938), p(1030, 962), p(1056, 962), close: true, stroke: 1pt, fill: black)
  // 悬挂的砝码
  line(p(872, 938), p(872, 1020), stroke: 1pt)
  rect(p(850, 1030), p(895, 1082), stroke: 1pt)
  rect(p(862, 1018), p(884, 1030), stroke: 1pt)
  line(p(1130, 938), p(1130, 1012), stroke: 1pt)
  rect(p(1098, 1030), p(1158, 1100), stroke: 1pt)
  rect(p(1114, 1012), p(1142, 1030), stroke: 1pt)
  _lab(p, 944, 1060, [300 克], size: 8pt)
  _lab(p, 1200, 1078, [600 克], size: 8pt)
})
