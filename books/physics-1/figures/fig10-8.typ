// 图 10·8 定滑轮提重物（原书 p.305）
// 写实插画沿用原扫描裁剪（fig10-8.png，已涂去字母）；F、G 用文字补回。
// 坐标是 fig10-8.png 的像素坐标（747×1397）；由原页显示图坐标换算：(x-995)×2.1314, (y-160)×2.1314。
#import "/common/series.typ": *

#let fig-10-8(width: 5cm) = px-canvas(747, 1397, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-8.png", width: 747 * u))
  let d(x, y) = ((x - 995) * 2.1314, (y - 160) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(1224, 426, $F$)
  lab(1097, 789, $G$)
})
