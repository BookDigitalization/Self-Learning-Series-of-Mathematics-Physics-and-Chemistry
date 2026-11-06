// 图 3·11 比较容器底部的压力和压强（原书 p.57）
// 沿用原扫描裁剪（已涂去容器下方的 A、B），字母用 CeTZ 补回。
// 坐标是 fig3-11.png 的像素坐标（1290×608）；原页显示图 (580,420) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-11(width: 7.4cm) = px-canvas(1290, 608, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-11.png", width: 1290 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(364, 571, $A$)
  lab(1029, 558, $B$)
})
