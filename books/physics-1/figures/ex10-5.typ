// 习题 10·5 第 7 题附图（原书 p.325）
// 写实剖面图沿用原扫描裁剪（ex10-5.png，1120×971，已涂去 F、θ、A、B）；字母用文字补回。
// 换算：(x-895)×2.1314, (y-395)×2.1314。
#import "/common/series.typ": *

#let fig-ex-10-5-7(width: 4.6cm) = px-canvas(1120, 971, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex10-5.png", width: 1120 * u))
  let d(x, y) = ((x - 895) * 2.1314, (y - 395) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(1186, 433, $F$); lab(1173, 611, $theta$)
  lab(1063, 683, $A$); lab(1277, 688, $B$)
})
