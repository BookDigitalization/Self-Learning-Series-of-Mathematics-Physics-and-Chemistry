// 图 13·27 汽车过拱桥（原书 p.448）
// 示意图，按原图重绘：拱桥圆弧（圆心 O），上坡的汽车受 N_1、f、G，G 分解为 G_1、G_2；桥中央的汽车受 N_2、G。
// 汽车用小方块和两个轮子示意。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-27(width: 8cm) = px-canvas(500, 500, origin: (330, 700), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let o = (627, 1185)
  let r = 363
  // 桥面圆弧
  line(..range(0, 31).map(k => {
    let t = -42 + k * 3.0
    p(o.at(0) + r * calc.sin(t * 1deg), o.at(1) - r * calc.cos(t * 1deg))
  }), stroke: 1.2pt)
  // 汽车 1（上坡）
  let c1 = (446, 871)
  rect(p(418, 853), p(474, 880), stroke: 1pt)
  circle(p(430, 880), radius: 5 * u, stroke: 1pt)
  circle(p(458, 868), radius: 5 * u, stroke: 1pt)
  line(p(..c1), p(391, 776), stroke: 1.4pt, mark: arr)
  line(p(..c1), p(505, 836), stroke: 1.4pt, mark: arr)
  line(p(..c1), p(436, 985), stroke: 1.4pt, mark: arr)
  line(p(..c1), p(375, 912), stroke: 1.4pt, mark: arr)
  line(p(..c1), p(500, 950), stroke: 1.4pt, mark: arr)
  line(p(500, 950), p(..o), stroke: dsh)
  lab(392, 760, $N_1$)
  lab(510, 813, $f$)
  lab(430, 1012, $G$)
  lab(345, 883, $G_1$)
  lab(515, 950, $G_2$)
  // 汽车 2（桥中央）
  rect(p(588, 790), p(656, 820), stroke: 1pt)
  circle(p(604, 825), radius: 5 * u, stroke: 1pt)
  circle(p(640, 825), radius: 5 * u, stroke: 1pt)
  line(p(622, 790), p(622, 720), stroke: 1.4pt, mark: arr)
  line(p(622, 830), p(622, 920), stroke: 1.4pt, mark: arr)
  line(p(622, 920), p(622, 1180), stroke: dsh)
  lab(650, 738, $N_2$)
  lab(640, 917, $G$)
  lab(635, 1185, $O$)
})
