// 图 8·35 狄塞耳内燃机 P-V 图（原书 p.322，CeTZ 重绘）
// 坐标为 200 dpi 原书页面像素坐标；画布左上角在页面 (140, 495)。
#import "/common/series.typ": *

#let fig-8-35(width: 6cm) = px-canvas(350, 315, origin: (140, 495), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.7pt
  set-style(stroke: lw)
  let tx(pt, body, anchor: "center") = content(pt, anchor: anchor, text(size: 9pt, body))
  let arr(a, b) = line(p(..a), p(..b), mark: (end: ">", fill: black, scale: 0.6), stroke: 0.4pt)
  line(p(157, 785), p(157, 520), mark: (end: ">", fill: black, scale: 0.6))
  line(p(157, 785), p(448, 785), mark: (end: ">", fill: black, scale: 0.6))
  tx(p(157, 507), $P$)
  tx(p(466, 786), $V$)
  tx(p(155, 790), $O$, anchor: "north-east")
  let A = (205, 745)
  let B = (420, 745)
  let C = (207, 568)
  let D = (297, 568)
  let E = (420, 718)
  let thick = 1.6pt
  line(p(..A), p(..B), stroke: thick)
  line(p(..C), p(..D), stroke: thick)
  line(p(..E), p(..B), stroke: thick)
  bezier(p(..D), p(..E), p(325, 630), p(395, 695), stroke: thick)
  bezier(p(..B), p(..C), p(330, 738), p(240, 660), stroke: thick)
  arr((235, 745), (260, 745))
  arr((330, 745), (305, 745))
  arr((250, 568), (270, 568))
  arr((420, 728), (420, 738))
  arr((350, 655), (362, 670))
  arr((285, 678), (272, 666))
  tx(p(195, 745), $A$, anchor: "east")
  tx(p(430, 748), $B$, anchor: "west")
  tx(p(200, 556), $C$, anchor: "south-east")
  tx(p(297, 556), $D$, anchor: "south")
  tx(p(430, 714), $E$, anchor: "west")
})
