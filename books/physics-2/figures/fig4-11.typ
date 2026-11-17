// 图 4·11（原书 p.148）瓶内的压缩空气由于膨胀而冷却，使水汽变成雾。
// 写实插画，沿用原扫描裁剪（fig4-11.png，已涂去“水汽”“空气”）；标注文字用 CeTZ 补回。
// 坐标取 200 dpi 页面像素，图片左上角在 (335, 155)，宽 440 像素。
#import "/common/series.typ": *

#let fig-4-11(width: 8cm) = px-canvas(440, 257, origin: (335, 155), width: width, (p, u) => {
  import cetz.draw: *
  content(p(335, 155), anchor: "north-west", image("fig4-11.png", width: 440 * u))
  content(p(467, 256), text(size: 8.5pt)[水汽])
  content(p(650, 256), text(size: 8.5pt)[空气])
})
