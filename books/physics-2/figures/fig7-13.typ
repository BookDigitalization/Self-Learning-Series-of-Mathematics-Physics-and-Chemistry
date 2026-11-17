// 图 7·13 研究饱和汽压和温度关系的装置（原书 p.241）
// 装置是写实插画，沿用原扫描裁剪（fig7-13.png，已涂去 h）；h 用 CeTZ 补回。
// 坐标是 fig7-13.png 的像素坐标（320×1080，y 向下）。
#import "/common/series.typ": *

#let fig-7-13(width: 3cm) = px-canvas(320, 1080, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-13.png", width: 320 * u))
  content(p(183, 251), anchor: "center", text(size: 8pt, [$h$]))
})
