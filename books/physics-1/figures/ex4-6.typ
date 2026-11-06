// 习题 4·5 第 3、5 题附图（原书 p.104）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标。
#import "/common/series.typ": *

// 第 3 题：飞机的路程图线，原点 (430,1553)，画布原点 (360,1070)
#let fig-ex-5-3(width: 6.4cm) = px-canvas(420, 560, origin: (360, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (430, 1553)
  line(p(ox, oy), p(ox, 1125), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(705, oy), stroke: 0.9pt, mark: mk)
  for s in (100, 200, 300) {
    let y = oy - s * 1.23
    line(p(ox, y), p(ox + 7, y), stroke: 0.6pt)
    lab(ox - 24, y, str(s))
  }
  for t in (1, 2) {
    let x = ox + t * 103.5
    line(p(x, oy), p(x, oy - 6), stroke: 0.6pt)
    lab(x, oy + 20, str(t))
  }
  lab(ox - 8, oy + 20, [0])
  lab(455, 1093, [$s$（公里）])
  lab(722, oy + 24, [$t$（小时）])
  line(p(ox, oy), p(590, 1175), stroke: 1.3pt)
})

// 第 5 题：火车的路程图线，原点 (962,1537)，画布原点 (900,1090)
#let fig-ex-5-5(width: 6.4cm) = px-canvas(420, 520, origin: (900, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (962, 1537)
  line(p(ox, oy), p(ox, 1150), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(1280, oy), stroke: 0.9pt, mark: mk)
  for s in (20, 40, 60, 80) {
    let y = oy - s * 4.0
    line(p(ox, y), p(ox + 7, y), stroke: 0.6pt)
    lab(ox - 22, y, str(s))
  }
  for t in (1, 2, 3) {
    let x = ox + t * 80.5
    line(p(x, oy), p(x, oy - 6), stroke: 0.6pt)
    lab(x, oy + 22, str(t))
  }
  lab(ox - 10, oy + 20, [0])
  lab(995, 1117, [$s$（公里）])
  lab(1268, oy + 24, [$t$（小时）])
  line(p(ox, oy), p(1078, 1255), p(1120, 1255), p(1215, 1163), stroke: 1.3pt)
  lab(1078, 1237, $A$)
  lab(1125, 1274, $B$)
  lab(1213, 1148, $C$)
})
