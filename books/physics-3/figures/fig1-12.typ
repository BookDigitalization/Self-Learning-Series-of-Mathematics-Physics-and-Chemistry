// 图 1·12 静电感应实验（二）（原书 p.26）
// 写实插画沿用原扫描裁剪的 fig1-12.png（1232×786），已涂去 +、−、A、B、C、R，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-1-12(width: 8cm) = px-canvas(1232, 786, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-12.png", width: 1232 * u))
  content(p(385, 208), anchor: "center", text(size: 11pt, [$+$]))
  content(p(525, 207), anchor: "center", text(size: 11pt, [$-$]))
  content(p(395, 435), anchor: "center", text(size: 9pt, [$A$]))
  content(p(540, 438), anchor: "center", text(size: 9pt, [$B$]))
  content(p(68, 495), anchor: "center", text(size: 9pt, [$C$]))
  content(p(810, 325), anchor: "center", text(size: 9pt, [$R$]))
  content(p(730, 310), anchor: "center", text(size: 6pt, [$+$]))
})
