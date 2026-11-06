// 图 1·18 钟、表、秒表（原书 p.16）
// 写实插画，沿用原扫描裁剪（fig1-18.png，已涂去下方的"钟""表""秒表"和秒表大表盘上的数字 1–29、"1/10"）；这些文字用 CeTZ 补回。
// 秒表左上方的小表盘数字、表（手表）盘上的细小字样、钟下部三个小窗里的字，原图只是一团模糊墨迹，无法辨认，仍留在位图里（见 checklist/figtext-ch1-2.md）。
// 坐标是 fig1-18.png 的像素坐标（1920×1184；画布加高到 1260 放下面的文字），换算：(x-380)×2.1314, (y-885)×2.1314。
#import "/common/series.typ": *

#let fig-1-18(width: 11.5cm) = px-canvas(1920, 1260, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-18.png", width: 1920 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(375, 1217, [钟])
  lab(1036, 1177, [表])
  lab(1594, 1162, [秒表])
  // 秒表大表盘上的数字（从上方 29、1 起顺时针，每隔一格标一个奇数）
  for (n, x, y) in ((29, 1520, 400), (1, 1632, 397), (3, 1727, 444), (5, 1797, 522), (7, 1820, 612), (9, 1819, 716),
    (11, 1759, 810), (13, 1678, 871), (15, 1582, 888), (17, 1486, 868), (19, 1405, 805), (21, 1356, 719),
    (23, 1344, 621), (25, 1375, 525), (27, 1436, 446)) {
    content(p(x, y), anchor: "center", text(size: 7.5pt, str(n)))
  }
  // 表盘中央的"1/10"（原图是 1 在左上、10 在右下，中间一道斜线）
  content(p(1570, 772), anchor: "center", text(size: 7.5pt, [1]))
  content(p(1612, 806), anchor: "center", text(size: 7.5pt, [10]))
  line(p(1564, 800), p(1604, 765), stroke: 0.5pt)
})
