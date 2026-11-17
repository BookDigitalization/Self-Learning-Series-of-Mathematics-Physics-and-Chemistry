// 习题 4·3 第 5 题附图（原书 p.242，CeTZ 重绘）
#import "fig4-lib.typ": *

#let fig-ex-4-3-5(width: 5.8cm) = px-canvas(600, 320, origin: (190, 1065), width: width, (p, u) => {
  import cetz.draw: *
  for y in (1082, 1128, 1172, 1218, 1265, 1310, 1357) {
    line(p(208, y), p(722, y), stroke: 0.9pt, mark: arrow-mark)
  }
  rect(p(392, 1107), p(548, 1332), stroke: 1.8pt)
  tx(p, 373, 1103, $a$); tx(p, 375, 1335, $b$); tx(p, 750, 1217, $H$)
})
