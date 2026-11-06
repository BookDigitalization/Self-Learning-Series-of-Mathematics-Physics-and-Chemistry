// 习题 3·2 第 1 题附图（原书 p.58）
// 写实插画（水壶），沿用原扫描裁剪（已涂去 A、B、C、D），字母用 CeTZ 补回。
// 坐标是 ex3-2-1.png 的像素坐标（939×641）；原页显示图 (880,1520) 起，×2.1314。
#import "/common/series.typ": *

#let fig-ex-3-2-1(width: 4.4cm) = px-canvas(939, 641, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-2-1.png", width: 939 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(175, 288, $A$)
  lab(124, 473, $B$)
  lab(396, 495, $C$)
  lab(561, 388, $D$)
})
