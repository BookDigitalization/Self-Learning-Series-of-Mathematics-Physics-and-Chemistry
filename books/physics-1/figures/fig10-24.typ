// 图 10·24、图 10·25、图 10·26（原书 p.317）
// 图 10·24、10·26 沿用原扫描裁剪（已涂去字母），字母用文字补回；图 10·25 用 CeTZ 重绘。
// 图 10·24：fig10-24.png（460×1397），由原页显示图坐标换算：(x-425)×2.1314, (y-690)×2.1314。
// 图 10·26：fig10-26.png（406×1231），换算：(x-1200)×2.1314, (y-718)×2.1314。
// 图 10·25 坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-24(width: 3.6cm) = px-canvas(460, 1397, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-24.png", width: 460 * u))
  let d(x, y) = ((x - 425) * 2.1314, (y - 690) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(513, 878, $B$); lab(526, 988, $A$); lab(437, 1128, $F$)
  lab(591, 1118, $C$); lab(617, 1301, $G$)
})

#let fig-10-26(width: 3cm) = px-canvas(406, 1300, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-26.png", width: 406 * u))
  let d(x, y) = ((x - 1200) * 2.1314, (y - 718) * 2.1314)
  content(p(..d(1326, 1002)), anchor: "center", text(size: 9pt, $F$))
  content(p(203, 1265), anchor: "center", text(size: 9pt)[$G = 75$ 公斤])
})

#let fig-10-25(width: 5.6cm) = px-canvas(430, 620, origin: (735, 725), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (thickness: 0.7pt, dash: "dashed")
  // 天花板
  line(p(905, 738), p(1140, 738), stroke: 0.8pt)
  for x in range(907, 1140, step: 11) { line(p(x, 738), p(x + 8, 728), stroke: 0.5pt) }
  // 杠杆 B、A、C
  line(p(848, 905), p(1018, 905), stroke: 1.6pt)
  line(p(765, 1078), p(937, 1078), stroke: 1.6pt)
  line(p(937, 1190), p(1112, 1190), stroke: 1.6pt)
  // 连接
  line(p(848, 905), p(848, 1078), stroke: dash)
  line(p(1018, 905), p(1018, 1190), stroke: dash)
  line(p(937, 1078), p(937, 1190), stroke: dash)
  line(p(1110, 738), p(1110, 1190), stroke: dash)
  // 力
  line(p(932, 905), p(932, 768), stroke: 1pt, mark: arr)
  line(p(848, 905), p(848, 962), stroke: 1pt, mark: arr)
  line(p(848, 1078), p(848, 1024), stroke: 1pt, mark: arr)
  line(p(1018, 905), p(1018, 962), stroke: 1pt, mark: arr)
  line(p(1022, 1190), p(1022, 1115), stroke: 1pt, mark: arr)
  line(p(765, 1078), p(765, 1114), stroke: 1pt, mark: arr)
  line(p(937, 1078), p(937, 1112), stroke: 1pt, mark: arr)
  line(p(937, 1190), p(937, 1152), stroke: 1pt, mark: arr)
  line(p(1112, 1190), p(1112, 1150), stroke: 1pt, mark: arr)
  line(p(1020, 1190), p(1020, 1330), stroke: 1pt, mark: arr)
  lab(907, 818, $4 F$); lab(815, 938, $2 F$); lab(1045, 938, $2 F$)
  lab(820, 1053, $2 F$); lab(1050, 1112, $2 F$)
  lab(985, 880, $B$); lab(900, 1060, $A$); lab(1065, 1170, $C$)
  lab(745, 1128, $F$); lab(953, 1105, $F$); lab(915, 1168, $F$); lab(1130, 1166, $F$)
  lab(1045, 1308, $G$)
})
