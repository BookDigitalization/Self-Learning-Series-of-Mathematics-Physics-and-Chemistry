// 图 3·31 气球（左）和飞艇（右）
// 写实插画，沿用原扫描裁剪（fig3-31.png）；飞艇艇身上的商标字样“GOODYEAR”已涂去（中间的有翼标志保留），
// 用 CeTZ 斜排文字补回（字体、字宽是近似的）。
// 坐标是 fig3-31.png 的像素坐标（2090×1120，y 向下）。
#import "/common/series.typ": *

#let fig-3-31(width: 12cm) = px-canvas(2090, 1120, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-31.png", width: 2090 * u))
  let word(x, y, size, sx, body) = content(p(x, y), anchor: "center",
    std.rotate(-16deg, std.scale(x: sx, text(font: fonts.hei, size: size, weight: "bold", style: "italic", body))))
  word(1128, 598, 15pt, 62%, [GOOD])
  word(1488, 482, 21pt, 88%, [YEAR])
})
