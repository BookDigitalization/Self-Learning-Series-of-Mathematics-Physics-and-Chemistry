// 图 3·28 物体的浮沉（原书 p.72）
// 线条图：水箱中三个区域（下沉、悬浮、上浮），带受力箭头的立方体。沿用原扫描裁剪（已涂去所有文字标注），文字用 CeTZ 补回。
// 坐标是 fig3-28.png 的像素坐标（2090×907）；原页显示图 (350,1415) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-28(width: 13cm) = px-canvas(2090, 907, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-28.png", width: 2090 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, weight: "medium", body))
  lab(522, 175, [最大浮力 < 重量])
  lab(1108, 175, [最大浮力 = 重量])
  lab(1786, 143, [浮力 = 重量])
  lab(1822, 226, [物体浮在液面])
  lab(416, 426, [物体下沉])
  lab(1066, 422, [物体悬浮])
  lab(1818, 522, [最大浮力 > 重量])
  lab(1737, 654, [物体上浮])
})
