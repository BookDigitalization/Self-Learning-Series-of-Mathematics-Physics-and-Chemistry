// 图 3·27 阿基米德定律的证明（原书 p.70）
// 写实插画，沿用原扫描裁剪（已涂去三处网袋旁的 A），字母用 CeTZ 补回。
// 坐标是 fig3-27.png 的像素坐标；原页显示图 (330,1330) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-27(width: 13cm) = px-canvas(2132, 789, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-27.png", width: 2132 * u))
  let lab(x, y) = content(p(x, y), anchor: "center", text(size: 10pt, $A$))
  lab(213, 379)
  lab(970, 369)
  lab(1727, 362)
})
