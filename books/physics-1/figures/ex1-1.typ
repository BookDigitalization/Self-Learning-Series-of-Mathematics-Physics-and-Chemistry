// 习题 1·1 第 4 题附图（手指夹尺）、第 5 题附图（铅笔上绕铜丝）
// 手、直尺、铅笔是写实插画，沿用原扫描裁剪（ex1-1-4.png、ex1-1-5.png，已涂去直尺上的数字）；数字用 CeTZ 补回。
// 坐标是各 PNG 的像素坐标（y 向下）。
#import "/common/series.typ": *

#let fig-ex-1-1-4(width: 4cm) = px-canvas(800, 588, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex1-1-4.png", width: 800 * u))
  for (n, x, y) in (("0", 50, 188), ("1", 178, 185), ("21", 650, 186)) {
    content(p(x, y), anchor: "center", text(size: 8pt, n))
  }
})

#let fig-ex-1-1-5(width: 6.8cm) = px-canvas(1372, 485, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex1-1-5.png", width: 1372 * u))
  for (n, x, y) in ((0, 207, 397), (1, 355, 397), (2, 485, 398), (3, 630, 395), (4, 757, 400), (5, 895, 395), (6, 1033, 398), (7, 1172, 398)) {
    content(p(x, y), anchor: "center", text(size: 9pt, str(n)))
  }
})
