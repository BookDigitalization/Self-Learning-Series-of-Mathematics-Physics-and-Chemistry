// 图 5·3 水和酒精混合液中的橄榄油滴（原书 p.155）
// 写实插画沿用原扫描裁剪（fig5-3.png，570×580，已涂去两处文字）；标注用真文字补回。
// 换算：(x-665)×2, (y-975)×2。
#import "/common/series.typ": *

#let fig-5-3(width: 5.4cm) = px-canvas(720, 580, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-3.png", width: 570 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "west", text(size: 8pt, body))
  lab(432, 96, [水和酒精])
  lab(432, 138, [的混合物])
  lab(430, 430, [橄榄油])
})
