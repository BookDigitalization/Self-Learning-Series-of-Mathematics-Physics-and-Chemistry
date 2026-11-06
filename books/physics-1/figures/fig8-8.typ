// 图 8·8 木板上叠放着甲、乙两物体（原书 p.219）
// 写实插画沿用原扫描裁剪（fig8-8.png，已涂去“甲”“乙”）；文字用 CeTZ 补回。
// 坐标是 fig8-8.png 的像素坐标（1557×804）：(显示图 x-560)×2.1314，(y-685)×2.1314。
#import "/common/series.typ": *

#let fig-8-8(width: 8.5cm) = px-canvas(1557, 804, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-8.png", width: 1557 * u))
  // 涂字后残留的小墨迹
  rect(p(590, 770), p(700, 804), fill: white, stroke: none)
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(582, 224, [甲])
  lab(575, 437, [乙])
})
