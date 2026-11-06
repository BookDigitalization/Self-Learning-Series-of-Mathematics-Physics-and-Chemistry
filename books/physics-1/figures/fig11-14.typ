// 图 11·14 汽车关闭发动机后的滑行（原书 p.344）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 原图方框内的“m”字很小，按“m”录；斜线按等距斜线重绘。
#import "/common/series.typ": *

#let fig-11-14(width: 9.4cm) = px-canvas(680, 270, origin: (460, 1600), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  let hatch(x0, y0, x1, y1) = {
    let h = y1 - y0
    let t = -h
    while t < x1 - x0 {
      let s0 = calc.max(0, -t / h)
      let s1 = calc.min(1, (x1 - x0 - t) / h)
      if s1 > s0 {
        line(p(x0 + t + s0 * h, y1 - s0 * h), p(x0 + t + s1 * h, y1 - s1 * h), stroke: 0.4pt)
      }
      t += 14
    }
  }
  hatch(472, 1670, 620, 1765)
  rect(p(472, 1670), p(620, 1765), stroke: 1.2pt)
  hatch(965, 1670, 1117, 1765)
  rect(p(965, 1670), p(1117, 1765), stroke: dash)
  lab(545, 1718, $m$)
  lab(1040, 1718, $m$)
  // 速度
  line(p(500, 1636), p(590, 1636), stroke: 1.2pt, mark: arr)
  lab(537, 1618, $v$)
  // 阻力
  line(p(735, 1717), p(622, 1717), stroke: 1pt, mark: arr)
  lab(780, 1717, $f = m a$)
  // 路程
  line(p(618, 1818), p(790, 1818), stroke: 0.7pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(935, 1818), p(1117, 1818), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(618, 1798), p(618, 1845), stroke: 0.8pt)
  line(p(1117, 1798), p(1117, 1845), stroke: 0.8pt)
  lab(862, 1816, $s = display(v^2 / (2 a))$)
})
