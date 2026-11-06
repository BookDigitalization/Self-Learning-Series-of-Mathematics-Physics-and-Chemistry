// 图 10·18、图 10·19 滑轮组（原书 p.313）
// 写实插画沿用原扫描裁剪（已涂去字母和滑轮编号）；F、G、编号 1 2 3、分图标号用文字补回。
// 图 10·18：fig10-18.png（1003×1397），由原页显示图坐标换算：(x-360)×2.1314, (y-395)×2.1314。
// 图 10·19：fig10-19.png（1241×1518），换算：(x-830)×2.1314, (y-338)×2.1314。
#import "/common/series.typ": *

#let fig-10-18(width: 8cm) = px-canvas(1003, 1480, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-18.png", width: 1003 * u))
  let d(x, y) = ((x - 360) * 2.1314, (y - 395) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(393, 623, $F$); lab(788, 642, $F$)
  lab(472, 1020, $G$); lab(731, 1015, $G$)
  lab(458, 1076, [（$a$）]); lab(712, 1066, [（$b$）])
})

#let fig-10-19(width: 9cm) = px-canvas(1241, 1610, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-19.png", width: 1241 * u))
  let d(x, y) = ((x - 830) * 2.1314, (y - 338) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(1025, 501, $F$); lab(990, 598, $1$); lab(960, 693, $2$); lab(924, 806, $3$); lab(973, 1006, $G$)
  lab(1318, 868, $F$); lab(1217, 578, $3$); lab(1257, 682, $2$); lab(1288, 773, $1$); lab(1273, 1016, $G$)
  lab(924, 1076, [（$a$）]); lab(1228, 1080, [（$b$）])
})
