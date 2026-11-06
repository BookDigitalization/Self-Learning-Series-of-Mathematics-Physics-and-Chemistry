// 图 11·15 恒力作用下物体速度的变化（原书 p.346）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 原图路程标注为大写 S，按正文用小写 s。
#import "/common/series.typ": *

#let fig-11-15(width: 10cm) = px-canvas(700, 200, origin: (500, 1680), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  // 地面
  line(p(510, 1826), p(1160, 1826), stroke: 1pt)
  for k in range(0, 54) {
    let x = 515 + k * 12
    line(p(x + 9, 1826), p(x, 1838), stroke: 0.5pt)
  }
  // 初位置（实线）与末位置（虚线）
  line(p(546, 1826), p(546, 1788), p(630, 1788), p(630, 1826), stroke: 1.2pt)
  line(p(958, 1826), p(958, 1755), p(1040, 1755), p(1040, 1826), stroke: dash)
  lab(582, 1810, $m$)
  line(p(630, 1815), p(722, 1815), stroke: 1.2pt, mark: arr)
  line(p(1042, 1810), p(1135, 1810), stroke: dash, mark: arr)
  lab(738, 1812, $F$)
  lab(1153, 1808, $F$)
  line(p(580, 1782), p(615, 1782), stroke: 1pt, mark: arr)
  lab(590, 1771, $v_1$)
  line(p(970, 1716), p(1050, 1716), stroke: 1pt, mark: arr)
  lab(1010, 1700, $v_2$)
  // 路程
  line(p(630, 1868), p(815, 1868), stroke: 0.7pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(860, 1868), p(1040, 1868), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(630, 1850), p(630, 1885), stroke: 0.8pt)
  line(p(1040, 1850), p(1040, 1885), stroke: 0.8pt)
  lab(838, 1868, $s$)
})
