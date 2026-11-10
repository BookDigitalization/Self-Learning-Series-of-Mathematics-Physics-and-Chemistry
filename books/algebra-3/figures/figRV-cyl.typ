// 总复习题第 11 题的插图（原书 p.361，无编号）：圆柱，标注底面半径 r 和高 h。
// 坐标取自 200 dpi 带网格页面图（显示宽 1596，真实宽 1654，已乘 1.04 换算成真实像素，y 向下）：
// 上底椭圆中心 (1310, 409)，半轴 130×49；下底椭圆中心 (1310, 755)，半轴 130×50，后半虚线；
// 两条侧线 x=1180、1440；中轴虚线 x=1307；r 为中轴到右侧的水平虚线（上底），下底右侧另有一条短虚线。
// 未用网格精量。
#import "/common/series.typ": *

#let fig-ex-rv11(width: 3.6cm) = px-canvas(320, 500, origin: (1150, 340), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 1.3pt
  let cx = 1310
  let rx = 130
  let half(cy, ry, sgn) = range(0, 61).map(i => {
    let t = 180deg * i / 60
    p(cx - rx * calc.cos(t), cy + sgn * ry * calc.sin(t))
  })
  // 上底椭圆（前后两半都实线）
  line(..half(409, 49, 1), stroke: lw)
  line(..half(409, 49, -1), stroke: lw)
  // 下底椭圆：前半实线，后半虚线
  line(..half(755, 50, 1), stroke: lw)
  line(..half(755, 50, -1), stroke: (thickness: lw, dash: "dashed"))
  // 两条侧线
  line(p(1180, 409), p(1180, 755), stroke: lw)
  line(p(1440, 409), p(1440, 755), stroke: lw)
  // 中轴（高）与半径的虚线
  let dsh = (thickness: 0.6pt, dash: "dashed")
  line(p(1307, 409), p(1307, 751), stroke: dsh)
  line(p(1307, 409), p(1440, 409), stroke: dsh)
  line(p(1307, 751), p(1440, 751), stroke: dsh)
  content(p(1357, 392), text(font: fonts.song, size: 8pt, $r$))
  content(p(1325, 567), box(fill: white, inset: 1pt, text(font: fonts.song, size: 8pt, $h$)))
})
