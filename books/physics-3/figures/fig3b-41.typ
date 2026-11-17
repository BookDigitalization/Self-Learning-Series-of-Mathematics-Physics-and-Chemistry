// 图 3·41 平行电流周围的磁场（原书 p.202）
// 铁屑照片式的图，沿用原扫描裁剪（fig3b-41.png，已涂去 A、B、(a)、(b)，用文字补回；导线截面的 ＋、● 保留在位图里）。
// 坐标是 PNG 像素坐标（1616×543）。
#import "fig3b-lib.typ": *

#let fig-3-41(width: 10.5cm) = px-canvas(1616, 543, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3b-41.png", width: 1616 * u))
  lab(p, 245, 308, $B$)
  lab(p, 465, 308, $A$)
  lab(p, 357, 483, $(a)$)
  lab(p, 1145, 272, $B$)
  lab(p, 1378, 278, $A$)
  lab(p, 1255, 492, $(b)$)
})
