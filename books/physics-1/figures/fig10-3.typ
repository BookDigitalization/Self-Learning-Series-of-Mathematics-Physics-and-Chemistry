// 图 10·3 杠杆举重物（原书 p.298）
// 写实插画沿用原扫描裁剪（fig10-3.png，已涂去字母）；L₁、L₂、O、G 用文字补回。
// 坐标是 fig10-3.png 的像素坐标（1834×551）；由原页显示图坐标换算：(x-340)×2.1314, (y-1392)×2.1314。
#import "/common/series.typ": *

#let fig-10-3(width: 12cm) = px-canvas(1834, 551, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-3.png", width: 1834 * u))
  let d(x, y) = ((x - 340) * 2.1314, (y - 1392) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(474, 1410, $L_1$)
  lab(786, 1420, $L_2$)
  lab(586, 1497, $O$)
  lab(432, 1626, $G$)
  lab(962, 1557, $G$)
})
