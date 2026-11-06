// 图 2·1 力的图示（原书 p.21）
// 线条图，按原图重绘：粗箭头 AB 表示力，旁边平行的细线按 1 厘米 = 1 公斤分成 5 段，左上角是比例尺。
// 坐标是裁剪图（原页显示图 (370,1430) 起，×2.1314）的像素坐标。
#import "/common/series.typ": *

#let fig-2-1(width: 5.4cm) = px-canvas(747, 930, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  // 力 AB
  line(p(15, 885), p(610, 100), stroke: 1.8pt, mark: (end: "stealth", fill: black, scale: 0.6))
  content(p(25, 910), anchor: "center", text(size: 10pt, $A$))
  content(p(668, 62), anchor: "center", text(size: 10pt, $B$))
  // 平行的刻度线：5 段，每段 1 厘米
  let (ax, ay) = (80, 882)
  let (bx, by) = (665, 110)
  line(p(ax, ay), p(bx, by), stroke: 0.7pt)
  let len = calc.sqrt(calc.pow(bx - ax, 2) + calc.pow(by - ay, 2))
  let (dx, dy) = ((bx - ax) / len, (by - ay) / len)
  for k in range(0, 6) {
    let (cx, cy) = (ax + k * (bx - ax) / 5, ay + k * (by - ay) / 5)
    line(p(cx, cy), p(cx - dy * 14, cy + dx * 14), stroke: 0.7pt)
  }
  // 比例尺
  line(p(45, 268), p(235, 268), stroke: 0.9pt)
  line(p(45, 268), p(45, 250), stroke: 0.9pt)
  line(p(235, 268), p(235, 250), stroke: 0.9pt)
  lab(140, 205, [1 公斤])
  lab(140, 330, [（1 厘米）])
})
