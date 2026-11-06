// 图 2·5 铁和木头到底谁重（原书 p.26）
// 天平、人物是写实插画，沿用原扫描裁剪（fig2-5.png，已涂去右上角思想泡里的"木""铁""?"）；这些文字用 CeTZ 补回。
// 坐标是 fig2-5.png 的像素坐标（875×741，y 向下）。
#import "/common/series.typ": *

#let fig-2-5(width: 5.6cm) = px-canvas(875, 741, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-5.png", width: 875 * u))
  content(p(618, 126), anchor: "center", text(font: fonts.hei, size: 8.5pt, weight: "medium", [木]))
  content(p(765, 130), anchor: "center", text(font: fonts.hei, size: 8.5pt, weight: "medium", [铁]))
  content(p(765, 325), anchor: "center", text(size: 11pt, [?]))
})
