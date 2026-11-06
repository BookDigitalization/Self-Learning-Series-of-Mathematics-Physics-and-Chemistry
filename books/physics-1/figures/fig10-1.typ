// 图 10·1 滑轮提重物（原书 p.296）
// 写实插画沿用原扫描裁剪（fig10-1.png，已涂去字母）；F、G 用文字补回。
// 坐标是 fig10-1.png 的像素坐标（1418×1578）；由原页显示图坐标换算：(x-495)×2.1314, (y-140)×2.1314。
#import "/common/series.typ": *

#let fig-10-1(width: 9cm) = px-canvas(1418, 1578, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-1.png", width: 1418 * u))
  let d(x, y) = ((x - 495) * 2.1314, (y - 140) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(724, 378, $F$)
  lab(1023, 342, $F$)
  lab(598, 695, $G$)
  lab(1024, 860, $G$)
})
