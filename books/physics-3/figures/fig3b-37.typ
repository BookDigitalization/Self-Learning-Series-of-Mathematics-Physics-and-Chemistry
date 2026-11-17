// 图 3·37 通电导体与磁力线成任意角度 θ（原书 p.198）
// CeTZ 重绘：斜向磁力线、竖直导体、H 分解为 H₁（水平）和 H₂（竖直）的平行四边形。
// 坐标是原页 130 dpi 渲染图的像素坐标，画布原点 (125, 480)。
#import "fig3b-lib.typ": *

#let fig-3-37(width: 5.4cm) = px-canvas(310, 510, origin: (125, 480), width: width, (p, u) => {
  import cetz.draw: *
  for k in range(8) {
    let y0 = 512 + 42 * k
    ar(p, (140, y0), (415, y0 + 138), st: 0.8pt)
  }
  // 导体
  rect(p(329, 563), p(346, 932), radius: 8, fill: white, stroke: 0.9pt)
  ar(p, (343, 513), (343, 558))
  lab(p, 354, 521, $I$, size: 8.5pt)
  ar(p, (338, 938), (338, 978))
  lab(p, 349, 972, $I$, size: 8.5pt)
  // H 及其分量
  line(p(181, 698), p(181, 767), p(314, 768), p(314, 698), stroke: (thickness: 0.6pt, dash: "dashed"))
  ar(p, (181, 698), (314, 698))
  ar(p, (181, 698), (181, 767))
  ar(p, (181, 698), (314, 768), st: 1.3pt)
  lab(p, 141, 667, $H$, size: 8.5pt)
  lab(p, 309, 681, $H_1$, size: 8.5pt)
  lab(p, 183, 782, $H_2$, size: 8.5pt)
  lab(p, 311, 784, $H$, size: 8.5pt)
  lab(p, 195, 727, $theta$, size: 8.5pt)
  // 角 θ
  arc(p(338, 820), start: 153.4deg, stop: 270deg, radius: 14 * u, anchor: "origin", stroke: 0.7pt)
  arc(p(338, 904), start: 270deg, stop: 333.4deg, radius: 14 * u, anchor: "origin", stroke: 0.7pt)
  lab(p, 319, 834, $theta$, size: 8.5pt)
  lab(p, 356, 896, $theta$, size: 8.5pt)
})
