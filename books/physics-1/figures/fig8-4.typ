// 图 8·4 两只弹簧秤互相拉（原书 p.214）
// 线条图沿用原扫描裁剪（fig8-4.png，已涂去“甲”“乙”）；两秤接钩上方原图有一个模糊小符号（像“O”），
// 留在位图里未处理，见 checklist/ch08.md。
// 坐标是 fig8-4.png 的像素坐标（1908×342）：(显示图 x-375)×2.1314，(y-105)×2.1314。
#import "/common/series.typ": *

#let fig-8-4(width: 13cm) = px-canvas(1908, 342, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-4.png", width: 1908 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(714, 36, [甲])
  lab(1311, 36, [乙])
})
