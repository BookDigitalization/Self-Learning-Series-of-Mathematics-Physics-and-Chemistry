// 图 2·46 勒克朗谢电池（原书 p.157）、图 2·47 干电池（p.158）、图 2·52 实用蓄电池组（p.161）
// 写实插画，沿用原扫描裁剪（fig2c-46.png 600×776、fig2c-47.png 1150×1330、fig2c-52.png 940×1160，已涂去字母和正负号）；
// 标注用文字补回。坐标是各 PNG 的像素坐标。
#import "/common/series.typ": *

#let fig-2-46(width: 3.8cm) = px-canvas(600, 776, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2c-46.png", width: 600 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  lab(314, 58, $C$)
  lab(66, 118, $+$)
  lab(510, 102, $"Zn"$)
  lab(526, 264, $-$)
})

#let fig-2-47(width: 7cm) = px-canvas(1150, 1330, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2c-47.png", width: 1150 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  lab(242, 44, $+$)
  lab(448, 56, $-$)
  lab(786, 100, $+$)
  lab(1002, 122, $-$)
  lab(796, 682, $C$)
  lab(910, 868, $A$)
  lab(1074, 716, $"Zn"$)
})

#let fig-2-52(width: 5cm) = px-canvas(940, 1160, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2c-52.png", width: 940 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(210, 46, $+$)
  lab(774, 66, $-$)
})
