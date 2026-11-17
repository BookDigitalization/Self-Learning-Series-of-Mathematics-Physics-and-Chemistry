// 图 8·29 奥托内燃机压强-体积图（原书 p.317，CeTZ 重绘）
// 坐标为 200 dpi 原书页面像素坐标；画布左上角在页面 (500, 520)。
#import "/common/series.typ": *

#let fig-8-29(width: 7cm) = px-canvas(410, 360, origin: (500, 520), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.7pt
  set-style(stroke: lw)
  let tx(pt, body, anchor: "center") = content(pt, anchor: anchor, text(size: 9pt, body))
  let arr(a, b) = line(p(..a), p(..b), mark: (end: ">", fill: black, scale: 0.6), stroke: 0.4pt)
  line(p(524, 857), p(524, 545), mark: (end: ">", fill: black, scale: 0.6))
  line(p(524, 857), p(888, 855), mark: (end: ">", fill: black, scale: 0.6))
  tx(p(524, 534), $P$)
  tx(p(906, 855), $V$)
  tx(p(524, 868), $O$, anchor: "north-east")
  let A = (562, 818)
  let B = (755, 818)
  let C = (565, 690)
  let D = (565, 595)
  let E = (755, 770)
  let thick = 1.6pt
  line(p(..A), p(..B), stroke: thick)
  line(p(..C), p(..D), stroke: thick)
  line(p(..E), p(..B), stroke: thick)
  bezier(p(..D), p(..E), p(582, 700), p(680, 760), stroke: thick)
  bezier(p(..B), p(..C), p(660, 808), p(590, 760), stroke: thick)
  arr((600, 818), (625, 818))
  arr((720, 818), (695, 818))
  arr((565, 640), (565, 655))
  arr((755, 780), (755, 795))
  arr((645, 728), (665, 738))
  arr((665, 783), (645, 768))
  tx(p(552, 817), $A$, anchor: "east")
  tx(p(766, 820), $B$, anchor: "west")
  tx(p(553, 690), $C$, anchor: "east")
  tx(p(553, 592), $D$, anchor: "east")
  tx(p(766, 770), $E$, anchor: "west")
})
