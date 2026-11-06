// 图 8·14 电梯里磅秤上的人（原书 p.225）
// 写实插画沿用原扫描裁剪（fig8-14.png，已涂去 +a、a、m、？）；文字用 CeTZ 补回，
// 电梯右壁被涂白处用线补回。
// 坐标是 fig8-14.png 的像素坐标（598×896）：(显示图 x-470)×2.1314，(y-1440)×2.1314。
#import "/common/series.typ": *

#let fig-8-14(width: 4cm) = px-canvas(598, 896, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-14.png", width: 598 * u))
  line(p(447, 412), p(447, 512), stroke: 0.8pt)
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  m(484, 465, $+a$)
  m(548, 740, $a$)
  m(313, 575, $m$)
  m(377, 784, text(size: 11pt)[?])
})
