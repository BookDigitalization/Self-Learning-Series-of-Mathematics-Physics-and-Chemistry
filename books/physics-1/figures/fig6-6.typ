// 图 6·6 手扶拖拉机张紧皮带用的张紧轮（原书 p.171）
// 写实插画沿用原扫描裁剪（fig6-6.png，已涂去图中标注文字），标注用文字补回。
// 坐标是 fig6-6.png 的像素坐标（1599×1002）。原图标注较模糊，按图题“张紧皮带用的张紧轮”读作“张紧轮”，已核对。
#import "/common/series.typ": *

#let fig-6-6(width: 9cm) = px-canvas(1599, 1002, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig6-6.png", width: 1599 * u))
  content(p(865, 72), anchor: "center", text(size: 8pt)[张紧轮])
})
