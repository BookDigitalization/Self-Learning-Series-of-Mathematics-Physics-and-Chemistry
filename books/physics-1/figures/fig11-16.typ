// 图 11·16 光滑斜面上上滑的物体（原书 p.349）
// 受力图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 原图中的 A（左下，扫描上像“4”）、B 及各矢量位置按原图摆放，见待核对清单。
#import "/common/series.typ": *

#let fig-11-16(width: 6.6cm) = px-canvas(400, 260, origin: (1010, 225), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.7pt, dash: "dashed")
  // 斜面三角形
  line(p(1040, 447), p(1375, 298), p(1375, 447), close: true, stroke: 1.2pt)
  // 斜面上的物体
  let k = 0.445
  let L = calc.sqrt(1 + k * k)
  let (ux, uy) = (1 / L, -k / L)
  let (nx, ny) = (-k / L, -1 / L)
  let blk(bx, by, st) = {
    let c(a, h) = p(bx + a * ux + h * nx, by + a * uy + h * ny)
    line(c(-24, 0), c(-24, 34), c(24, 34), c(24, 0), close: true, stroke: st)
  }
  blk(1075, 447 - k * 35, 1.1pt)
  blk(1255, 447 - k * 215, dash)
  // 初速
  line(p(1028, 385), p(1085, 362), stroke: 0.9pt, mark: arr)
  lab(1040, 357, $v_0$)
  // 中间位置的受力
  let (cx, cy) = (1255, 333)
  line(p(cx, cy), p(1222, 243), stroke: 1pt, mark: arr)
  line(p(cx, cy), p(1186, 352), stroke: 1pt, mark: arr)
  line(p(cx, cy), p(1250, 432), stroke: 1pt, mark: arr)
  line(p(cx, cy), p(1305, 410), stroke: 1pt, mark: arr)
  line(p(1268, 272), p(1312, 260), stroke: 0.9pt, mark: arr)
  lab(1243, 243, $N$)
  lab(1195, 340, $G_1$)
  lab(1268, 430, $G$)
  lab(1316, 410, $G_2$)
  lab(1283, 254, $v$)
  lab(1237, 380, $B$)
  lab(1035, 468, $A$)
  lab(1117, 432, $theta$)
})
