// 图 4·2（原书 p.115）表明玻意耳-马略特定律的图线。
// 坐标图，按数据重绘：横轴 V（米³），纵轴 P（大气压）；坐标系取 200 dpi 页面像素，
// V = 1 在 x = 590、每单位 25.3 像素；P = 0 在 y = 1136、每单位 25 像素。
#import "/common/series.typ": *

#let fig-4-2(width: 6.2cm) = px-canvas(380, 370, origin: (545, 790), width: width, (p, u) => {
  import cetz.draw: *
  let gx = V => 590 + 25.3 * (V - 1)
  let gy = P => 1136 - 25 * P
  let X = V => p(gx(V), gy(0))
  // 坐标轴
  line(p(gx(0.45), gy(0)), p(gx(13.9), gy(0)), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(gx(1), gy(0)), p(gx(1), gy(13.5)), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(gx(14.5), gy(0) + 2), text(size: 9pt, style: "italic")[V])
  content(p(gx(1) - 16, gy(13.9)), text(size: 9pt, style: "italic")[P])
  content(p(gx(1) - 12, gy(0) + 10), text(size: 8pt)[0])
  // 刻度与数字
  for k in range(1, 13) {
    line(p(gx(1) - 4, gy(k)), p(gx(1), gy(k)), stroke: 0.6pt)
    content(p(gx(1) - 12, gy(k)), text(size: 8pt, str(k)))
    line(p(gx(k), gy(0)), p(gx(k), gy(0) - 4), stroke: 0.6pt)
    content(p(gx(k), gy(0) + 11), text(size: 8pt, str(k)))
  }
  // 各点的投影线
  let pts = ((1, 12), (1.5, 8), (2, 6), (3, 4), (4, 3), (6, 2), (8, 1.5), (12, 1))
  for (V, P) in pts {
    line(p(gx(1), gy(P)), p(gx(V), gy(P)), stroke: 0.5pt)
    line(p(gx(V), gy(P)), p(gx(V), gy(0)), stroke: 0.5pt)
  }
  // 曲线 P = 12 / V
  let curve = range(0, 101).map(i => {
    let V = 1 + (13.1 - 1) * i / 100
    p(gx(V), gy(12 / V))
  })
  line(..curve, stroke: 1.6pt)
  for (V, P) in pts {
    circle(p(gx(V), gy(P)), radius: 3.2, fill: black, stroke: none)
  }
  // 点名
  content(p(gx(1) + 12, gy(12) + 2), text(size: 9pt, style: "italic")[A])
  content(p(gx(2) + 12, gy(6) - 8), text(size: 9pt, style: "italic")[B])
  content(p(gx(4) + 11, gy(3) - 12), text(size: 9pt, style: "italic")[C])
  content(p(gx(8) + 2, gy(1.5) - 13), text(size: 9pt, style: "italic")[D])
})
