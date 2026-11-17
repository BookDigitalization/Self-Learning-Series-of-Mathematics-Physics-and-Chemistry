// 图 4·10（原书 p.147）筒内的混合物受到很快压缩，温度升高，使筒底的棉花燃烧起来。
// 写实插画，沿用原扫描裁剪（fig4-10.png，已涂去“活塞”“棉花”及其引线）；标注文字与引线用 CeTZ 补回。
// 坐标取 200 dpi 页面像素，图片左上角在 (772, 156)，宽 112 像素。
#import "/common/series.typ": *

#let fig-4-10(width: 3.6cm) = px-canvas(190, 440, origin: (772, 156), width: width, (p, u) => {
  import cetz.draw: *
  content(p(772, 156), anchor: "north-west", image("fig4-10.png", width: 112 * u))
  content(p(857, 393), anchor: "west", text(size: 8.5pt, weight: "bold")[活塞])
  line(p(838, 390), p(855, 393), stroke: 0.6pt)
  content(p(860, 500), anchor: "west", text(size: 8.5pt, weight: "bold")[棉花])
  line(p(838, 504), p(858, 500), stroke: 0.6pt)
})
