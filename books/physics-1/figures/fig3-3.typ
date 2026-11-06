// 图 3·3 液压机工作原理示意图（原书 p.47）
// 写实插画，沿用原扫描裁剪（已涂去 A、B、C、D），字母用 CeTZ 补回。
// 坐标是 fig3-3.png 的像素坐标（1066×1013）；原页显示图 (900,1190) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-3(width: 6cm) = px-canvas(1066, 1013, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-3.png", width: 1066 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(266, 324, $B$)
  lab(650, 358, $A$)
  lab(188, 533, $D$)
  lab(639, 784, $C$)
})
