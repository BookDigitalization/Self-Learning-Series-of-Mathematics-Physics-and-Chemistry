// 图 10·34 举重螺旋（原书 p.323）、图 10·35 螺旋的应用（原书 p.323）、图 10·36 斧头劈木柴（原书 p.324）
// 图 10·34、10·35 是写实插画，沿用原扫描裁剪（已涂去字母、图下说明），文字用 CeTZ 补回。
// 图 10·34：fig10-34.png，由原页显示图坐标换算：(x-860)×2.1314, (y-180)×2.1314（尺寸见 px-canvas 参数 1092×1479）。
// 图 10·35：fig10-35.png（2239×727），换算：(x-350)×2.1314, (y-1495)×2.1314。
// 图 10·36 用 CeTZ 重绘，坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-34(width: 6.4cm) = px-canvas(1092, 1479, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-34.png", width: 1092 * u))
  let d(x, y) = ((x - 860) * 2.1314, (y - 180) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(1137, 206, $G$)
  lab(1314, 271, $F$)
  lab(1246, 415, $L$)
  lab(1017, 449, $h$)
})

#let fig-10-35(width: 13cm) = px-canvas(2239, 830, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-35.png", width: 2239 * u))
  let d(x, y) = ((x - 350) * 2.1314, (y - 1495) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(font: fonts.kai, size: 8.5pt, body))
  lab(460, 1620, [螺钉])
  lab(460, 1862, [螺栓和螺母])
  lab(745, 1862, [举重螺旋])
  lab(1150, 1862, [压榨螺旋])
})

#let fig-10-36(width: 5.6cm) = px-canvas(380, 380, origin: (1010, 390), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  // 斧头（单面劈）
  line(p(1120, 465), p(1203, 465), p(1118, 735), close: true, stroke: 1.4pt)
  line(p(1157, 410), p(1157, 463), stroke: 1pt, mark: arr)
  lab(1173, 418, $F$)
  // 力
  line(p(1335, 632), p(1172, 562), stroke: 1pt, mark: arr); lab(1230, 560, $N$)
  line(p(1337, 632), p(1337, 565), stroke: 1pt, mark: arr); lab(1362, 577, $N_1$)
  line(p(1335, 632), p(1180, 632), stroke: 1pt, mark: arr); lab(1237, 657, $N_2$)
  line(p(1030, 632), p(1120, 632), stroke: 1pt, mark: arr); lab(1062, 657, $N_2$)
  lab(1258, 617, $theta$); lab(1138, 633, $theta$)
})
