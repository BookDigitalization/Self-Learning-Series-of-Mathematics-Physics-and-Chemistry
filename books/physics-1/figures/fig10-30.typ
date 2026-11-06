// 图 10·30 劈的应用（原书 p.321）
// 写实插画沿用原扫描裁剪（fig10-30.png，2231×587，已涂去“刀”“斧”二字和三条图下说明）；
// 文字用 CeTZ 补回。换算：(x-372)×2.1314, (y-935)×2.1314。
#import "/common/series.typ": *

#let fig-10-30(width: 13cm) = px-canvas(2231, 650, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-30.png", width: 2231 * u))
  let d(x, y) = ((x - 372) * 2.1314, (y - 935) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(font: fonts.kai, size: 8.5pt, body))
  lab(430, 1076, [刀])
  lab(518, 1156, [斧])
  lab(620, 1222, [利用劈来举起重物])
  lab(940, 1218, [利用劈来固定物体])
  lab(1240, 1221, [劈式压榨机])
})
