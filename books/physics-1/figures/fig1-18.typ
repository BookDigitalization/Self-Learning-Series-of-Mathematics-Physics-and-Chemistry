// 图 1·18 钟、表、秒表（原书 p.16）
// 写实插画，沿用原扫描裁剪（fig1-18.png，已涂去下方的"表""秒表"）；钟、表、秒表三字用文字补回。
// 表盘上的数字是插画的一部分，留在位图里。
// 坐标是 fig1-18.png 的像素坐标（1920×1184；画布加高到 1260 放下面的文字），换算：(x-380)×2.1314, (y-885)×2.1314。
#import "/common/series.typ": *

#let fig-1-18(width: 11.5cm) = px-canvas(1920, 1260, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-18.png", width: 1920 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(375, 1217, [钟])
  lab(1036, 1177, [表])
  lab(1594, 1162, [秒表])
})
