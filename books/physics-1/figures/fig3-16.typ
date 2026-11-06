// 图 3·16 简易自来水装置（原书 p.61）
// 写实插画，沿用原扫描裁剪（已涂去 水源、抽水站、滤水池、水塔、分水管、总水管），文字用 CeTZ 补回。
// 坐标是 fig3-16.png 的像素坐标（1920×591）；原页显示图 (365,985) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-16(width: 11cm) = px-canvas(1920, 591, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-16.png", width: 1920 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(899, 309, [滤水池])
  lab(1194, 411, [水塔])
  lab(1631, 337, [分水管])
  lab(458, 433, [抽水站])
  lab(1614, 437, [总水管])
  lab(100, 543, [水源])
})
