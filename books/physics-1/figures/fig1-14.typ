// 图 1·14 量度形状不规则固体的体积（原书 p.10）
// 量筒是写实插画，沿用原扫描裁剪（fig1-14.png，已涂去"固体体积"和刻度数字）；这些文字用 CeTZ 补回。
// 坐标是 fig1-14.png 的像素坐标（853×1525，y 向下）。
// 左筒 90、80，右筒 30、20 的刻度数字原图被铅锤小球挡住一部分，这里整个补回，被球挡住的部分黑压黑，看不出来。
#import "/common/series.typ": *

#let fig-1-14(width: 7.4cm) = px-canvas(853, 1525, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-14.png", width: 853 * u))
  content(p(400, 462), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", [固体体积]))
  let num(x, y, n) = content(p(x, y), anchor: "east", text(size: 8pt, str(n)))
  for (n, y) in ((100, 330), (90, 437), (80, 540), (70, 637), (60, 750), (50, 855), (40, 965), (30, 1070), (20, 1185), (10, 1305)) {
    num(250, y, n)
  }
  for (n, y) in ((100, 340), (90, 435), (80, 548), (70, 645), (60, 755), (50, 868), (40, 978), (30, 1082), (20, 1215), (10, 1318)) {
    num(706, y, n)
  }
})
