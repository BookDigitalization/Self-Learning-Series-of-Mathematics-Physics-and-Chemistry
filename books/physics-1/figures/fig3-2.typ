// 图 3·2 密闭的连通器中液体传递压力和压强的作用（原书 p.46）
// 写实插画，沿用原扫描裁剪（已涂去 A、B、C），字母用 CeTZ 补回。
// 坐标是 fig3-2.png 的像素坐标（1334×907）；原页显示图 (540,1425) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-2(width: 10cm) = px-canvas(1334, 907, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-2.png", width: 1334 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(310, 326, $A$)
  lab(1058, 234, $B$)
  lab(1078, 586, $C$)
})
