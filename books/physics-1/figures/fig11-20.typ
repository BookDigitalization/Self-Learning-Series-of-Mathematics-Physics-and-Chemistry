// 图 11·20 自由落体重力的功、图 11·21 沿光滑斜面滑下重力的功（原书 p.357）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 11·21 中间虚线物体处的三个箭头（G、G₁、G₂ 方向）按原图重绘，原图未标字母。
#import "/common/series.typ": *

#let fig-11-20(width: 6cm) = px-canvas(300, 400, origin: (435, 445), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let st = (end: "stealth", fill: black, scale: 0.4)
  let sts = (start: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  // 上方物体（斜线）
  let (x0, y0, x1, y1) = (520, 455, 588, 520)
  let h = y1 - y0
  let t = -h
  while t < x1 - x0 {
    let s0 = calc.max(0, -t / h)
    let s1 = calc.min(1, (x1 - x0 - t) / h)
    if s1 > s0 {
      line(p(x0 + t + s0 * h, y1 - s0 * h), p(x0 + t + s1 * h, y1 - s1 * h), stroke: 0.4pt)
    }
    t += 11
  }
  rect(p(x0, y0), p(x1, y1), stroke: 1.1pt)
  lab(603, 463, $m$)
  rect(p(522, 660), p(590, 727), stroke: 1.1pt)
  line(p(588, 520), p(690, 520), stroke: dash)
  line(p(590, 727), p(640, 727), stroke: dash)
  // 地面
  line(p(445, 805), p(725, 805), stroke: 1pt)
  for k in range(0, 24) {
    let x = 450 + k * 12
    line(p(x + 9, 805), p(x, 817), stroke: 0.5pt)
  }
  // h₁、h₂
  line(p(680, 640), p(680, 520), stroke: 0.8pt, mark: st)
  line(p(680, 680), p(680, 805), stroke: 0.8pt, mark: sts)
  lab(681, 660, $h_1$)
  line(p(620, 752), p(620, 727), stroke: 0.8pt, mark: st)
  line(p(620, 785), p(620, 805), stroke: 0.8pt, mark: sts)
  lab(622, 768, $h_2$)
})

#let fig-11-21(width: 7.6cm) = px-canvas(500, 330, origin: (890, 520), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let st = (end: "stealth", fill: black, scale: 0.4)
  let sts = (start: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  let k = 0.575
  let L = calc.sqrt(1 + k * k)
  let (ux, uy) = (1 / L, -k / L)
  let (nx, ny) = (-k / L, -1 / L)
  let incl(x) = 820 - k * (x - 905)
  // 斜面和水平线
  line(p(905, 820), p(1342, 569), stroke: 1pt)
  line(p(905, 818), p(1318, 815), stroke: 1pt)
  let blk(bx, st) = {
    let by = incl(bx)
    let c(a, h) = p(bx + a * ux + h * nx, by + a * uy + h * ny)
    line(c(-32, 0), c(-32, 64), c(32, 64), c(32, 0), close: true, stroke: st)
  }
  blk(985, 1.1pt)
  blk(1140, dash)
  blk(1278, 1.1pt)
  lab(1305, 533, $m$)
  // 中间物体上的三个力
  let (cx, cy) = (1143, 668)
  line(p(cx, cy), p(1146, 775), stroke: 1pt, mark: st)
  line(p(cx, cy), p(1192, 748), stroke: 1pt, mark: st)
  line(p(cx, cy), p(1100, 685), stroke: 1pt, mark: st)
  // h₁、h₂
  line(p(1285, 650), p(1285, 690), stroke: 0.8pt, mark: sts)
  line(p(1285, 715), p(1285, 815), stroke: 0.8pt, mark: st)
  lab(1296, 701, $h_1$)
  line(p(995, 783), p(995, 816), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  lab(1018, 797, $h_2$)
  lab(968, 811, $alpha$)
})
