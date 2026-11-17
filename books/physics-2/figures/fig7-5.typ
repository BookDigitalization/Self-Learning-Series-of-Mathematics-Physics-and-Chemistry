// 图 7·5 复冰现象（原书 p.229）
// 冰块、钢丝、砝码是写实插画，沿用原扫描裁剪（fig7-5.png，已涂去“5 公斤”）；两处“5 公斤”用 CeTZ 补回。
// 坐标是 fig7-5.png 的像素坐标（690×440，y 向下）。
#import "/common/series.typ": *

#let fig-7-5(width: 6.6cm) = px-canvas(690, 440, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-5.png", width: 690 * u))
  content(p(294, 402), anchor: "center", text(size: 8pt, weight: "bold", [5 公斤]))
  content(p(410, 316), anchor: "center", text(size: 8pt, weight: "bold", [5 公斤]))
})
