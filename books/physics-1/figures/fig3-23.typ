// 图 3·23 测定大气压——托里拆利实验（原书 p.65）
// 写实插画，沿用原扫描裁剪（已涂去尺寸线上竖排的“76 厘米”），文字用 CeTZ 补回（竖排）。
// 坐标是 fig3-23.png 的像素坐标（747×1259）；原页显示图 (1020,1240) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-23(width: 4.6cm) = px-canvas(747, 1259, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-23.png", width: 747 * u))
  content(p(277, 705), anchor: "center", std.rotate(-90deg, text(font: fonts.hei, size: 8pt, [76 厘米])))
})
