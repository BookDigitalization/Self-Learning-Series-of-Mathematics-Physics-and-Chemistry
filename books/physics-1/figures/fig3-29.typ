// 图 3·29 比重计
// 写实插画，沿用原扫描裁剪（fig3-29.png）；管上的刻度数字 1.00 … 2.00 已涂去（刻度横线保留），用 CeTZ 文字补回。
// 1.70–2.00 四个数字在原图里挤在一起，位置按原图估计（见 checklist/figtext-ch3.md）。
// 坐标是 fig3-29.png 的像素坐标（448×1748，y 向下）。
#import "/common/series.typ": *

#let fig-3-29(width: 2.4cm) = px-canvas(448, 1748, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-29.png", width: 448 * u))
  let lab(y, body) = content(p(226, y), anchor: "center", text(size: 4.6pt, body))
  lab(121, [1.00])
  lab(226, [1.10])
  lab(345, [1.20])
  lab(436, [1.30])
  lab(520, [1.40])
  lab(590, [1.50])
  lab(660, [1.60])
  lab(708, [1.70])
  lab(752, [1.80])
  lab(797, [1.90])
  lab(832, [2.00])
})
