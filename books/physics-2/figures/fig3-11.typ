// 图 3·11 推导线胀系数和体胀系数之间关系的辅助图（原书 p.92）
// CeTZ 重绘；坐标是放大 2.5 倍的原图局部（875×438）的像素坐标，y 向下。
#import "/common/series.typ": *

#let fig-3-11(width: 6.4cm) = px-canvas(875, 438, width: width, (p, u) => {
  import cetz.draw: *
  let st = 3.2 * u
  let solid(..pts) = line(..pts.pos().map(a => p(..a)), stroke: st)
  let dash(..pts) = line(..pts.pos().map(a => p(..a)), stroke: (thickness: 1.8 * u, dash: (4 * u, 4 * u)))
  let lab(x, y, body, a: 0) = content(p(x, y), anchor: "center", angle: a * 1deg, text(size: 9pt, body))
  // 小立方体：边长 1，0°C
  solid((62, 155), (248, 155), (248, 340), (62, 340), (62, 155))
  solid((62, 155), (128, 88), (318, 88), (248, 155))
  solid((318, 88), (318, 272), (248, 340))
  dash((128, 88), (128, 272))
  dash((128, 272), (318, 272))
  dash((128, 272), (62, 340))
  lab(36, 228, [1], a: 90)
  lab(178, 310, [1])
  lab(312, 322, [1])
  lab(160, 372, [0°C])
  // 大立方体：边长 1 + α，1°C
  solid((483, 112), (722, 112), (722, 350), (483, 350), (483, 112))
  solid((483, 112), (572, 32), (810, 32), (722, 112))
  solid((810, 32), (810, 268), (722, 350))
  dash((572, 32), (572, 268))
  dash((572, 268), (810, 268))
  dash((572, 268), (483, 350))
  lab(518, 208, $1 + alpha$, a: 90)
  lab(640, 318, $1 + alpha$)
  lab(780, 340, $1 + alpha$, a: 40)
  lab(618, 383, [1°C])
})
