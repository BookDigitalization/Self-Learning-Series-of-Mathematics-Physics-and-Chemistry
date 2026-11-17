// 图 5·1 液面上一小块液体受力的分解（原书 p.154）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (185, 870)。
#import "/common/series.typ": *

#let fig-5-1(width: 4.6cm) = px-canvas(240, 215, origin: (185, 870), width: width, (p, u) => {
  import cetz.draw: *
  let surf = ((190, 905), (223, 907), (265, 917), (300, 938), (327, 957), (357, 965), (412, 967))
  let surf-y(x) = {
    let r = 967
    for i in range(surf.len() - 1) {
      let a = surf.at(i)
      let b = surf.at(i + 1)
      if x >= a.at(0) and x <= b.at(0) { r = a.at(1) + (b.at(1) - a.at(1)) * (x - a.at(0)) / (b.at(0) - a.at(0)) }
    }
    r
  }
  // 容器
  line(p(190, 877), p(190, 1068), p(412, 1068), p(412, 880), stroke: 1.4pt)
  // 液面
  line(..surf.map(q => p(..q)), stroke: 1.2pt)
  // 水平虚点线
  line(p(190, 937), p(412, 937), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  // 水纹
  for (i, y) in range(925, 1060, step: 17).enumerate() {
    for x in range(200 + calc.rem(i, 2) * 14, 400, step: 40) {
      if y > surf-y(x + 10) + 10 {
        line(p(x, y), p(x + 18, y + 1), stroke: 0.5pt)
      }
    }
  }
  // 力 F、分力 F1、F2
  let A = (265, 917)
  let ar = (end: "stealth", fill: black, scale: 0.5)
  line(p(..A), p(265, 1000), stroke: 0.9pt, mark: ar)
  line(p(..A), p(232, 984), stroke: 0.9pt, mark: ar)
  line(p(232, 984), p(265, 1000), stroke: 0.9pt)
  line(p(..A), p(300, 938), stroke: 0.9pt, mark: ar)
  line(p(300, 938), p(265, 1000), stroke: (thickness: 0.7pt, dash: "dashed"))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  lab(268, 897, $A$)
  lab(318, 922, $F_2$)
  lab(220, 1000, $F_1$)
  lab(265, 1014, $F$)
})
