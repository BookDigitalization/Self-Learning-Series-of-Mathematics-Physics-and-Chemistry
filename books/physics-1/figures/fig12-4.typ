// 图 12·4 夯打木桩（原书 p.388）
// 写实插画，保留原扫描裁剪的二值化 PNG（fig12-4.png，已涂去夯框内的字母 m、G，用 CeTZ 补回；
// 框中间一条带竖纹的横带是原图的纹理，保留在位图里）；
// 图上方的力 F 的字母原在图外，用 CeTZ 风格的文字补上。
// 坐标是裁剪图的像素坐标（宽 938、高 775）。
#import "/common/series.typ": *

#let fig-12-4(width: 5.2cm) = box(width: width, {
  image("fig12-4.png", width: width)
  place(top + left, dx: width * 0.405 - 0.3em, dy: -1.1em, text(size: 8pt, $F$))
  place(top + left, dx: width * 425 / 938, dy: width * 163 / 938 * 1.0, place(center + horizon, text(size: 8pt, $m$)))
  place(top + left, dx: width * 348 / 938, dy: width * 293 / 938, place(center + horizon, text(size: 8pt, $G$)))
})
