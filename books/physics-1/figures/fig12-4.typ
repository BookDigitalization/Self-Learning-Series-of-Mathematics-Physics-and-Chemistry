// 图 12·4 夯打木桩（原书 p.388）
// 写实插画，保留原扫描裁剪的二值化 PNG（夯框内的 m、G 字样与图一起留在位图里）；
// 图上方的力 F 的字母原在图外，用 CeTZ 风格的文字补上。
#import "/common/series.typ": *

#let fig-12-4(width: 5.2cm) = box(width: width, {
  image("fig12-4.png", width: width)
  place(top + left, dx: width * 0.405 - 0.3em, dy: -1.1em, text(size: 8pt, $F$))
})
