// 图 4·1 物体的平动（原书 p.86）
// 线条图沿用原扫描裁剪（fig4-1.png，已涂去字母 A、A₁、A₂、B、B₁、B₂），字母用 CeTZ 文字补回。
// 坐标是 fig4-1.png 的像素坐标（708×1429）。
#import "/common/series.typ": *

#let fig-4-1(width: 4.6cm) = px-canvas(708, 1429, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig4-1.png", width: 708 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(640, 85, $B_2$)
  lab(215, 424, $A_2$)
  lab(515, 553, $B_1$)
  lab(47, 861, $A_1$)
  lab(528, 993, $B$)
  lab(117, 1293, $A$)
})
