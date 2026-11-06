// 图 10·12 第三类杠杆的实例（原书 p.307）与 图 10·13 用铁橇撬石（原书 p.307）
// 写实插画沿用原扫描裁剪（已涂去字母）；字母用文字补回。
// 图 10·12：fig10-12.png（2324×662），由原页显示图坐标换算：(x-325)×2.1314, (y-135)×2.1314。
// 图 10·13：fig10-13.png（949×1419），换算：(x-975)×2.1314, (y-705)×2.1314。
#import "/common/series.typ": *

#let fig-10-12(width: 14cm) = px-canvas(2324, 662, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-12.png", width: 2324 * u))
  let d(x, y) = ((x - 325) * 2.1314, (y - 135) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(419, 237, $B$); lab(527, 186, $O$); lab(341, 404, $A$)
  lab(861, 282, $A$); lab(799, 337, $B$); lab(701, 383, $O$)
  lab(1029, 148, $A$); lab(1134, 197, $B$); lab(1263, 317, $O$)
  // 右下角脚旁的字母看不清，疑为 F（见待核对清单）
  content(p(..d(1386, 344)), anchor: "center", unclear(text(size: 9pt, $F$)))
})

#let fig-10-13(width: 5.6cm) = px-canvas(949, 1419, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-13.png", width: 949 * u))
  let d(x, y) = ((x - 975) * 2.1314, (y - 705) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(1387, 722, $F$)
  lab(1291, 947, $L_2$)
  lab(1306, 1198, $O$)
  lab(1200, 1271, $L_1$)
  lab(1122, 1339, $G$)
})
