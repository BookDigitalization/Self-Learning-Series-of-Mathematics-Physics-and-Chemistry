// 图 3·12 水塔（原书 p.58）
// 写实插画，沿用原扫描裁剪（已涂去塔底的 A），字母用 CeTZ 补回。
// 坐标是 fig3-12.png 的像素坐标（1003×1408）；原页显示图 (110,485) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-12(width: 4.4cm) = px-canvas(1003, 1408, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-12.png", width: 1003 * u))
  content(p(537, 1300), anchor: "center", text(size: 10pt, $A$))
})
