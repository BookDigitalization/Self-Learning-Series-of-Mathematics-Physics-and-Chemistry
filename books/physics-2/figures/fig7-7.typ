// 图 7·7 浇铸过程（原书 p.232）
// 铸型剖面和铸件是写实插画，沿用原扫描裁剪（fig7-7.png，已涂去数字 1、2 和字母 (a)–(d)）；标注用 CeTZ 补回。
// 坐标是 fig7-7.png 的像素坐标（1560×450，y 向下）。
#import "/common/series.typ": *

#let fig-7-7(width: 12.5cm) = px-canvas(1560, 450, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-7.png", width: 1560 * u))
  for (t, x, y) in (([1], 146, 36), ([2], 328, 40), ([1], 704, 36), ([2], 884, 40), ([1], 1084, 136), ([2], 1262, 50),) {
    content(p(x, y), anchor: "center", text(size: 8pt, weight: "bold", t))
  }
  for (t, x, y) in (([a], 234, 412), ([b], 792, 412), ([c], 1194, 414), ([d], 1404, 414),) {
    content(p(x, y), anchor: "center", text(size: 8pt, [（$#t$）]))
  }
})
