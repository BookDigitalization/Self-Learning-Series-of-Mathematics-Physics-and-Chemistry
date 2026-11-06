// 图 8·2 踢足球（原书 p.213）
// 写实插画沿用原扫描裁剪（fig8-2.png，已涂去两处标注，足球左上角被涂白处略有缺损）；标注用文字补回。
// 坐标是 fig8-2.png 的像素坐标（1152×683）：(显示图 x-880)×2.1314，(y-195)×2.1314。
#import "/common/series.typ": *

#let fig-8-2(width: 7cm) = px-canvas(1152, 683, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-2.png", width: 1152 * u))
  // 涂字时误涂掉的球轮廓（左上段），用圆弧补回
  arc(p(445, 435), start: 138deg, stop: 168deg, radius: 148 * u, anchor: "origin", stroke: 1.3pt)
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(213, 384, [脚踢足球的力])
  lab(900, 510, [球作用在脚上的力])
})
