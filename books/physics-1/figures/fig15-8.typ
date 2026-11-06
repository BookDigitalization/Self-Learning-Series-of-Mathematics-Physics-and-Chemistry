// 图 15·8 水平管中水的流动与压强（原书 p.499）
// 写实插图，沿用原扫描裁剪（fig15-8.png，已涂去字母）；R A B C D H a b c f 用文字补回。
// 坐标是 fig15-8.png 的像素坐标（1866×747，y 向下）。H 处尺寸线被涂断，用 CeTZ 补一段。
#import "/common/series.typ": *

#let fig-15-8(width: 12.5cm) = px-canvas(1866, 747, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-8.png", width: 1866 * u))
  line(p(80, 388), p(80, 446), stroke: 1.6pt)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(507, 100, $R$)
  lab(725, 95, $A$)
  lab(1062, 92, $B$)
  lab(1380, 95, $C$)
  lab(1710, 498, $D$)
  lab(130, 418, $H$)
  lab(430, 612, $f$)
  lab(762, 616, $a$)
  lab(1112, 616, $b$)
  lab(1410, 616, $c$)
})
