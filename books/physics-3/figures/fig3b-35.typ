// 图 3·35 电流、磁场和磁场力的方向图（原书 p.196）
// CeTZ 重绘，四幅小图：磁极块的点纹用浅灰填充代替。坐标是原页 130 dpi 渲染图的像素坐标，画布原点 (195, 795)。
#import "fig3b-lib.typ": *

#let fig-3-35(width: 10.4cm) = px-canvas(620, 360, origin: (195, 795), width: width, (p, u) => {
  import cetz.draw: *
  // x0：左磁极块左缘；t：上缘；dir：磁力线方向（1 向右，-1 向左）；cur：电流符号；fdir：磁场力方向；htop：H 标在上方
  let panel(x0, t, dir, left, right, cur, fdir, htop) = {
    let cy = t + 67
    let cx = x0 + 135
    magnet(p, x0, t, x0 + 45, t + 135)
    magnet(p, x0 + 220, t, x0 + 265, t + 135)
    for dy in (20, 45, 67, 90, 113) {
      let a = if dir == 1 { (x0 + 45, t + dy) } else { (x0 + 220, t + dy) }
      let b = if dir == 1 { (x0 + 220, t + dy) } else { (x0 + 45, t + dy) }
      ar(p, a, b, st: 0.8pt)
    }
    isym(p, cx, cy, cur, r: 13)
    if fdir == "up" {
      ar(p, (cx - 2, cy - 13), (cx - 2, cy - 52))
      lab(p, cx + 14, cy - 48, $F$, size: 8.5pt)
    } else {
      ar(p, (cx - 1, cy + 13), (cx - 1, cy + 52))
      lab(p, cx + 14, cy + 50, $F$, size: 8.5pt)
    }
    labw(p, cx, if htop { t + 20 } else { t + 113 }, $H$, size: 8.5pt)
    lab(p, x0 + 22, cy, left, size: 8.5pt)
    lab(p, x0 + 243, cy, right, size: 8.5pt)
  }
  panel(205, 805, 1, $N$, $S$, "out", "up", false)
  panel(533, 805, -1, $S$, $N$, "out", "down", true)
  panel(205, 1005, 1, $N$, $S$, "in", "down", true)
  panel(533, 1005, -1, $S$, $N$, "in", "up", false)
})
