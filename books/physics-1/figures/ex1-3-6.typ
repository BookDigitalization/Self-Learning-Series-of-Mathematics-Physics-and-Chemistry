// 习题 1·3 第 6 题附图（简易小量筒的制作）
// 铅笔、盒子、小量筒是写实插画，沿用原扫描裁剪（ex1-3-6.png，已涂去刻度数字）；刻度数字 1、2、3 用 CeTZ 补回。
// 原图最上面一个数字被扫描得像 9，按上下文（1、2、3）读作 3。
// 坐标是 ex1-3-6.png 的像素坐标（960×949，y 向下）。
#import "/common/series.typ": *

#let fig-ex-1-3-6(width: 4.6cm) = px-canvas(960, 949, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex1-3-6.png", width: 960 * u))
  for (n, y) in ((3, 347), (2, 490), (1, 632)) {
    content(p(870, y), anchor: "center", text(size: 8pt, str(n)))
  }
})
