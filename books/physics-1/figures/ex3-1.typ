// 习题 3·1 第 1 题附图（原书 p.50）
// 写实插画，沿用原扫描裁剪（已涂去 A、B、C、D），字母用 CeTZ 补回。
// 坐标是 ex3-1-1.png 的像素坐标（491×864）；原页显示图 (1135,1025) 起，×2.1314。
#import "/common/series.typ": *

#let fig-ex-3-1-1(width: 2.6cm) = px-canvas(491, 864, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-1-1.png", width: 491 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(411, 124, $A$)
  lab(47, 352, $B$)
  lab(345, 529, $D$)
  lab(224, 782, $C$)
})
