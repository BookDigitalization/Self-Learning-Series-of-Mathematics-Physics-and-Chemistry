// 习题 4·3 第 4 题附图（验证玻意耳-马略特定律的简单装置，原书 p.120）。
// 写实插画，沿用原扫描裁剪（ex4-3-4.png，已涂去字母 A、B 和 h）；字母用 CeTZ 补回。
// 坐标取 200 dpi 页面像素，图片左上角在 (30, 893)，宽 242 像素。
#import "/common/series.typ": *

#let fig-ex-4-3-4(width: 3.4cm) = px-canvas(242, 432, origin: (30, 893), width: width, (p, u) => {
  import cetz.draw: *
  content(p(30, 893), anchor: "north-west", image("ex4-3-4.png", width: 242 * u))
  let it = s => text(size: 9pt, style: "italic", s)
  content(p(224, 928), it[A])
  content(p(152, 1151), it[B])
  content(p(259, 1246), it[h])
})
