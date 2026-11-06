// 习题 13·8 附图（原书 p.467）：第 2 题（三个齿轮 A、B、C，B 为轮轴型）、第 3 题（内啮合齿轮 A、B、C）
// 线条图，按原图重绘（齿轮用圆代替）；坐标是页面显示图（宽 1568）上的像素坐标，位置为目测。
// 第 3 题图上各半径的下标较模糊：A 记 R_1，B 记 R_2，C 记 R_3（与题文“A、C 的半径分别为 R_1、R_3”一致）。
#import "/common/series.typ": *

#let fig-ex-13-8-2(width: 7.6cm) = px-canvas(470, 330, origin: (470, 700), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  circle(p(550, 865), radius: 82 * u, stroke: 1.4pt)
  circle(p(655, 823), radius: 92 * u, stroke: 1.4pt)
  circle(p(655, 838), radius: 38 * u, stroke: 1.2pt)
  circle(p(815, 943), radius: 105 * u, stroke: 1.4pt)
  line(p(545, 860), p(487, 860), stroke: 1.2pt, mark: arr)
  line(p(655, 838), p(625, 815), stroke: 1.2pt, mark: arr)
  line(p(655, 838), p(745, 842), stroke: 1.2pt, mark: arr)
  line(p(815, 943), p(882, 1020), stroke: 1.2pt, mark: arr)
  lab(532, 770, $A$)
  lab(692, 718, $B$)
  lab(838, 812, $C$)
  lab(523, 832, $R_1$)
  lab(661, 828, $r$)
  lab(715, 830, $R_2$)
  lab(850, 945, $R_3$)
})

#let fig-ex-13-8-3(width: 7cm) = px-canvas(370, 290, origin: (1050, 770), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  circle(p(1200, 915), radius: 135 * u, stroke: 1.6pt)
  circle(p(1250, 850), radius: 40 * u, stroke: 1.4pt)
  circle(p(1150, 975), radius: 65 * u, stroke: 1.4pt)
  line(p(1250, 850), p(1225, 828), stroke: 1.2pt, mark: arr)
  line(p(1150, 975), p(1163, 912), stroke: 1.2pt, mark: arr)
  line(p(1200, 915), p(1330, 912), stroke: 1.2pt, mark: arr)
  lab(1275, 845, $A$)
  lab(1185, 852, $B$)
  lab(1113, 958, $C$)
  lab(1240, 825, $R_1$)
  lab(1178, 940, $R_3$)
  lab(1262, 930, $R_2$)
})
