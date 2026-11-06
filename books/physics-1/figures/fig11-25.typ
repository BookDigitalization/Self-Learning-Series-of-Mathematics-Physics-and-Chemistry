// 图 11·25 弹簧小球的能量转变（原书 p.362）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 弹簧锯齿数、小球涂色按原图大致重绘；原图 1 号位置的小球为空心带十字，这里画成空心圆。
#import "/common/series.typ": *

#let fig-11-25(width: 9cm) = px-canvas(780, 620, origin: (500, 860), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  // 墙
  line(p(525, 865), p(525, 1440), stroke: 3pt)
  for k in range(0, 48) {
    let y = 868 + k * 12
    line(p(525, y), p(512, y + 8), stroke: 0.5pt)
  }
  // 竖直虚线（位置 1）
  line(p(1035, 865), p(1035, 1445), stroke: (paint: black, thickness: 1.2pt, dash: "dashed"))
  // 弹簧和小球：(y, 小球中心 x, 编号, 圈数)
  let rows = ((925, 1035, "1", 38), (1013, 1160, "2", 30), (1103, 1035, "1", 38), (1192, 905, "3", 40), (1282, 1035, "1", 38), (1370, 1160, "2", 30))
  for (y, bx, lbl, n) in rows {
    let xa = 535
    let xb = bx - 22
    let pts = ((xa, y),)
    for k in range(0, n) {
      pts.push((xa + (k + 0.5) * (xb - xa) / n, y + 9 * (if calc.rem(k, 2) == 0 { -1 } else { 1 })))
    }
    pts.push((xb, y))
    line(..pts.map(q => p(..q)), stroke: 0.9pt)
    let dark = lbl != "1"
    circle(p(bx, y), radius: 20 * u, fill: if dark { luma(60) } else { white }, stroke: 1pt)
    lab(bx + 34, y, text(font: fonts.hei, weight: "medium", lbl))
  }
  // 速度
  line(p(1070, 1053), p(985, 1053), stroke: 1pt, mark: arr)
  lab(980, 1050, $v$)
  line(p(995, 1225), p(1085, 1225), stroke: 1pt, mark: arr)
  lab(1092, 1222, $v$)
})
