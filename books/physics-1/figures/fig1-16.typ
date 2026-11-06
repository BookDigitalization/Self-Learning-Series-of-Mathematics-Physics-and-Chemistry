// 图 1·16 测定物体质量用的天平（原书 p.13）
// 天平是写实插画，沿用原扫描裁剪（fig1-16.png，已涂去字母）；字母 F D K G E、A B C D 用文字补回。
// 坐标是 fig1-16.png 的像素坐标（1941×1013，y 向下）；由原页显示图坐标换算：(x-440)×2.1314, (y-95)×2.1314。
#import "/common/series.typ": *

#let fig-1-16(width: 11cm) = px-canvas(1941, 1013, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-16.png", width: 1941 * u))
  let d(x, y) = ((x - 440) * 2.1314, (y - 95) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(727, 230, $F$)
  lab(727, 293, $D$)
  lab(752, 432, $K$)
  lab(646, 452, $G$)
  lab(698, 547, $E$)
  lab(1052, 245, $A$)
  lab(1207, 243, $C$)
  lab(1295, 245, $B$)
  lab(1203, 319, $D$)
})
