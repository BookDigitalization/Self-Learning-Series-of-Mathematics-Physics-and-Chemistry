// 图 7·11 测定水、酒精和乙醚的饱和汽压的装置（原书 p.238）
// 玻璃管、水银槽是写实插画，沿用原扫描裁剪（fig7-11.png，已涂去 h₁、h₂、h₃）；标注用 CeTZ 补回。
// 坐标是 fig7-11.png 的像素坐标（460×1160，y 向下）。
#import "/common/series.typ": *

#let fig-7-11(width: 4.2cm) = px-canvas(460, 1160, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-11.png", width: 460 * u))
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  tx(214, 216, [$h_1$])
  tx(304, 216, [$h_2$])
  tx(412, 474, [$h_3$])
})
