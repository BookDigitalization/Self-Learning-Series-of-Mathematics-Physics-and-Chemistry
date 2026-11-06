// 图 10·4 杠杆匀速转过一个角度（原书 p.299）
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-4(width: 7.6cm) = px-canvas(530, 420, origin: (860, 185), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let piv = (1035, 285)
  // 原来的水平位置（细线）
  line(p(888, 283), p(1332, 283), stroke: 1pt)
  // 转过角度后的杠杆：短臂（向上）、长臂（向下），双线表示
  let bar(a, b, dash: false) = {
    let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
    let l = calc.sqrt(dx * dx + dy * dy)
    let (nx, ny) = (-dy / l * 4, dx / l * 4)
    line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), stroke: 0.8pt)
    line(p(a.at(0) - nx, a.at(1) - ny), p(b.at(0) - nx, b.at(1) - ny), stroke: 0.8pt)
    line(p(b.at(0) + nx, b.at(1) + ny), p(b.at(0) - nx, b.at(1) - ny), stroke: 0.8pt)
    if dash { line(p(..a), p(..b), stroke: (thickness: 0.5pt, dash: "dashed")) }
  }
  bar(piv, (917, 208), dash: true)
  bar(piv, (1285, 455), dash: true)
  // 支点
  line(p(1020, 328), p(1035, 288), p(1048, 328), close: true, stroke: 1pt, fill: black)
  // 力
  line(p(888, 283), p(888, 595), stroke: 1pt, mark: arr)
  lab(910, 580, $G$)
  line(p(915, 208), p(915, 525), stroke: 1pt, mark: arr)
  lab(937, 512, $G$)
  line(p(1328, 283), p(1328, 420), stroke: 1pt, mark: arr)
  lab(1349, 408, $F$)
  line(p(1285, 455), p(1285, 592), stroke: 1pt, mark: arr)
  lab(1308, 568, $F$)
  // 高度 h₁、h₂
  line(p(900, 208), p(900, 283), stroke: 0.5pt)
  lab(878, 242, $h_1$)
  line(p(1275, 283), p(1275, 455), stroke: (thickness: 0.5pt, dash: "dashed"))
  lab(1252, 360, $h_2$)
  // 臂长与角
  lab(1000, 215, $L_1$)
  lab(1148, 410, $L_2$)
  arc(p(..piv), start: -34deg, stop: 0deg, radius: 90 * u, stroke: 0.6pt, anchor: "origin")
  lab(1140, 310, $alpha$)
})
