// 图 15·21 麦格努斯效应（原书 p.510–511）
// 流线、箭头沿用原扫描裁剪（fig15-21.png，已涂去 (a)(b)(c)(d)(甲)(乙)）；标注用文字补回。
// 坐标是 fig15-21.png 的像素坐标（1632×1781，y 向下）。
#import "/common/series.typ": *

#let fig-15-21(width: 8.6cm) = px-canvas(1632, 1781, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-21.png", width: 1632 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 11pt, body))
  lab(1527, 150, [（$a$）])
  lab(1527, 630, [（$b$）])
  lab(1515, 1155, [（$c$）])
  lab(1503, 1700, [（$d$）])
  lab(148, 808, [（甲）])
  lab(1133, 827, [（乙）])
})
