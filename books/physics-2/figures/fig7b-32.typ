// 图 7·32 露点湿度计（原书 p.277）
// 写实插画沿用原扫描裁剪（fig7b-32.png，已涂去文字标注，用真文字补回）。
// 坐标是 fig7b-32.png 的像素坐标（405×827，y 向下）。
#import "/common/series.typ": *

#let fig-7-32(width: 4.2cm) = px-canvas(405, 827, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-32.png", width: 405 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 30 * u, body))
  content(p(190, 52), anchor: "west", text(size: 28 * u)[温度计])
  lab(105, 198, [出气孔])
  lab(352, 162, [空气])
  lab(232, 463, [乙醚])
  lab(40, 462, [露])
})
