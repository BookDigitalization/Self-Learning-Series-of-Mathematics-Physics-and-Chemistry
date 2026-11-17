// 图 8·34（原书 p.321）：写实图沿用原扫描裁剪的二值化位图（fig8b-34.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (295, 620)。
#import "/common/series.typ": *

#let fig-8-34(width: 9.7cm) = px-canvas(585, 310, origin: (295, 620), width: width, (p, u) => {
  import cetz.draw: *
  content(p(295, 620), anchor: "north-west", image("fig8b-34.png", width: 585 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(468, 653, [压缩空气冷却管])
  lab(349, 743.5, [压缩空气筒])
  lab(571, 740, [空气压缩机])
  lab(782.5, 663, [燃油箱])
  lab(779.5, 762, [喷油嘴])
  lab(839, 792, [排气管])
  lab(516.5, 806.5, [气缸])
  lab(592, 816, [活塞])
  lab(773, 913.5, [空气进口])
})
