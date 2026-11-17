// 图 7·12 在一定温度下，同一种液体的饱和汽压和体积无关（原书 p.240）
// 玻璃管、水银是写实插画，沿用原扫描裁剪（fig7-12.png，已涂去 S 和 h）；标注用 CeTZ 补回。
// 坐标是 fig7-12.png 的像素坐标（910×1230，y 向下）。
#import "/common/series.typ": *

#let fig-7-12(width: 7.2cm) = px-canvas(910, 1230, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-12.png", width: 910 * u))
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  tx(90, 112, [$S$])
  tx(372, 114, [$S$])
  tx(692, 110, [$S$])
  tx(216, 556, [$h$])
  tx(510, 396, [$h$])
  tx(826, 640, [$h$])
})
