// 图 1·14 量度形状不规则固体的体积（原书 p.10）
// 量筒是写实插画，沿用原扫描裁剪（fig1-14.png，已涂去"固体体积"文字）；该文字用 CeTZ 补回。
// 坐标是 fig1-14.png 的像素坐标（853×1525，y 向下）。
#import "/common/series.typ": *

#let fig-1-14(width: 7.4cm) = px-canvas(853, 1525, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-14.png", width: 853 * u))
  content(p(400, 462), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", [固体体积]))
})
