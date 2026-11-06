// 图 15·5 显示流线的实验装置（原书 p.497）
// 写实插图，沿用原扫描裁剪（fig15-5.png，已涂去字母，圆盘上的 D 涂黑）；字母用文字补回。
// 坐标是 fig15-5.png 的像素坐标（1909×1610，y 向下）。
// 注：右图 S 的下标按字形读作左 S₂、右 S₁（原图如此）。
#import "/common/series.typ": *

#let fig-15-5(width: 11.5cm) = px-canvas(1909, 1610, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-5.png", width: 1909 * u))
  let lab(x, y, body, size: 11pt) = content(p(x, y), anchor: "center", text(size: size, body))
  lab(390, 212, $K$)
  lab(1036, 438, $A$)
  lab(713, 479, text(fill: white, $D$), size: 14pt)
  lab(540, 1116, $Z$)
  lab(715, 1550, [（$a$）], size: 12pt)
  lab(1652, 1548, [（$b$）], size: 12pt)
  lab(1578, 326, $M_1$)
  lab(1728, 326, $M_2$)
  lab(1436, 543, $K_1$)
  lab(1872, 540, $K_2$)
  lab(1607, 578, $d$)
  lab(1560, 960, $S_2$)
  lab(1772, 986, $S_1$)
})
