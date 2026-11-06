// 图 8·10 甲、乙两物体用绳子相连放在桌面上（原书 p.221）
// 线条图沿用原扫描裁剪（fig8-10.png，已涂去 甲、乙、A、B、F）；文字用 CeTZ 补回。
// 坐标是 fig8-10.png 的像素坐标（1578×757）：(显示图 x-500)×2.1314，(y-1060)×2.1314。
#import "/common/series.typ": *

#let fig-8-10(width: 10cm) = px-canvas(1578, 757, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-10.png", width: 1578 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(264, 85, [甲])
  lab(671, 85, [乙])
  content(p(386, 354), anchor: "center", text(size: 10pt, $A$))
  content(p(917, 354), anchor: "center", text(size: 10pt, $B$))
  content(p(1262, 213), anchor: "center", text(size: 10pt, $F$))
})
