// 复习题三第 8 题附图：电磁替续器（原书 p.220）
// 写实/半示意的线路图，沿用原扫描裁剪（rev3b-8.png，已涂去 P、B、K、M、“电动机”、电池的 −、+，用文字补回）。
// 坐标是 PNG 像素坐标（1363×567）。
#import "fig3b-lib.typ": *

#let fig-rev-3b-8(width: 9.4cm) = px-canvas(1363, 567, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev3b-8.png", width: 1363 * u))
  lab(p, 325, 42, $P$)
  lab(p, 62, 218, $B$)
  lab(p, 405, 235, $M$)
  lab(p, 550, 165, $K$)
  lab(p, 1165, 85, [电动机], size: 8.5pt)
  lab(p, 530, 432, [−], size: 10pt)
  lab(p, 618, 437, [+], size: 10pt)
})
