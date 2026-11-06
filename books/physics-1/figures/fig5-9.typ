// 图 5·9 升降机运动的速度图线（原书 p.140）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (730, 120)。
// 速度图线：O→F 匀加速（0 到 6 秒，速度 0 到 3 米/秒），F→M 匀速（6 到 11 秒），M→K 匀减速（11 到 14 秒）。
#import "/common/series.typ": *

#let fig-5-9(width: 9cm) = px-canvas(680, 650, origin: (730, 120), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (x0, y0) = (790, 710)
  let ux = 35.75
  let uy = 135
  let px(t) = x0 + t * ux
  let py(v) = y0 - v * uy
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash = (thickness: 0.7pt, dash: "dash-dotted")
  let dsh = (thickness: 1.2pt, dash: "dashed")
  line(p(x0, y0), p(1385, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 140), stroke: 0.9pt, mark: mk)
  for t in (2, 4, 6, 8, 10, 12, 14) {
    line(p(px(t), y0), p(px(t), y0 - 7), stroke: 0.6pt)
    lab(px(t), y0 + 20, str(t))
  }
  for v in (1, 2, 3, 4) {
    line(p(x0, py(v)), p(x0 + 7, py(v)), stroke: 0.6pt)
    lab(x0 - 20, py(v), str(v))
  }
  lab(x0 - 12, y0 + 20, $0$)
  lab(860, 152, text(font: fonts.song, size: 8.5pt)[$v$（米/秒）])
  lab(1350, y0 + 22, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
  // 速度图线 O F M K
  line(p(px(0), py(0)), p(px(6), py(3)), p(px(11), py(3)), p(px(14), py(0)), stroke: 2pt)
  // 对应的虚线
  line(p(x0, py(3)), p(px(11), py(3)), stroke: dash)
  line(p(x0, py(2)), p(px(12), py(2)), stroke: dash)
  line(p(x0, py(1)), p(px(2), py(1)), stroke: dash)
  line(p(x0, py(0.5)), p(px(1), py(0.5)), stroke: dash)
  line(p(px(1), y0), p(px(1), py(0.5)), stroke: dash)
  line(p(px(2), y0), p(px(2), py(1)), stroke: dash)
  line(p(px(6), y0), p(px(6), py(3)), stroke: dsh)
  line(p(px(7), y0), p(px(7), py(3)), stroke: dsh)
  line(p(px(11), y0), p(px(11), py(3)), stroke: dsh)
  line(p(px(12), y0), p(px(12), py(2)), stroke: dsh)
  for (t, v) in ((1, 0.5), (2, 1), (6, 3), (7, 3), (11, 3), (12, 2)) {
    circle(p(px(t), py(v)), radius: 3, stroke: 0.7pt, fill: white)
  }
  // 点的字母
  lab(px(1) - 6, py(0.5) - 22, $B$)
  lab(px(2) - 8, py(1) - 20, $D$)
  lab(px(1) + 17, y0 - 20, $A$)
  lab(px(2) + 15, y0 - 20, $C$)
  lab(px(6) + 4, py(3) - 20, $F$)
  lab(px(7) + 10, py(3) - 20, $F'$)
  lab(px(11) + 8, py(3) - 20, $M$)
  lab(px(12) + 10, py(2) - 15, $J$)
  lab(px(6) + 14, y0 - 20, $E$)
  lab(px(7) + 14, y0 - 20, $E'$)
  lab(px(11) + 8, y0 - 20, $G$)
  lab(px(12) + 10, y0 - 20, $I$)
  lab(px(14) + 12, y0 - 22, $K$)
})
