// 图 13·33 汽车通过凹圆弧桥中央（原书 p.457）
// 示意图，按原图重绘：凹形桥面（圆心在上方），汽车 m、速度 v、正压力 N_2、重力 G，半径 R。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-33(width: 6.8cm) = px-canvas(470, 420, origin: (420, 460), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let (cx, cy, r) = (655, 472, 285)
  line(..range(0, 31).map(k => {
    let t = -48 + k * 3.2
    p(cx + r * calc.sin(t * 1deg), cy + r * calc.cos(t * 1deg))
  }), stroke: 1.6pt)
  line(p(cx, cy), p(cx, 757), stroke: dsh)
  line(p(cx, cy), p(497, 712), stroke: 1.2pt)
  rect(p(633, 740), p(675, 756), stroke: 1pt)
  line(p(655, 740), p(655, 605), stroke: 1.6pt, mark: arr)
  line(p(655, 760), p(655, 850), stroke: 1.6pt, mark: arr)
  line(p(680, 742), p(718, 742), stroke: 1.4pt, mark: arr)
  lab(540, 607, $R$)
  lab(682, 607, $N_2$)
  lab(617, 718, $m$)
  lab(705, 722, $v$)
  lab(672, 862, $G$)
})
