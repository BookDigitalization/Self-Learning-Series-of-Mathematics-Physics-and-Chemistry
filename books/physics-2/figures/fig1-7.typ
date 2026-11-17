// 图 1·7 作布朗运动的小颗粒的位移图线
// 坐标是 fig1-7.png 的像素坐标（780×1026，400 dpi 裁剪）；来源页 原书 p.18。
#import "/common/series.typ": *

#let fig-1-7(width: 5.4cm) = px-canvas(780, 1026, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-7.png", width: 780 * u))

})
