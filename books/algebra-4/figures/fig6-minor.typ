#import "/common/series.typ": *
// 第 6 章 §6·3（p.209）：子行列式示意图（三个三阶行列式，分别划去 a1、a2、a3 所在的行和列），不编号（正文：“如下图所示”）。
// 坐标取自 200 dpi 页面的真实像素（y 向下）：三个行列式的竖线 x = (165, 367)、(433, 635)、(700, 903)，y 955–1168；
// 元素列 x：(210, 267, 320)、(478, 533, 588)、(745, 800, 855)；行 y = 1000、1063、1125；
// 虚线：横线分别在第 1、2、3 行（x 范围 140–400、400–670、665–930），竖线（第 1 列）x = 207、476、743。
#let k = 0.0145cm
#let tt(body) = text(size: 10.5pt, body)
#let dsh = (paint: black, thickness: 0.6pt, dash: "dashed")

#let fig-6-minor(width: 800 * k) = px-canvas(800, 250, origin: (135, 940), width: width, (p, u) => {
  import cetz.draw: *
  let ys = (1000, 1063, 1125)
  let names = (($a_1$, $b_1$, $c_1$), ($a_2$, $b_2$, $c_2$), ($a_3$, $b_3$, $c_3$))
  let panels = (
    (bars: (165, 367), xs: (210, 267, 320), h: (140, 400), v: 207, row: 0),
    (bars: (433, 635), xs: (478, 533, 588), h: (400, 670), v: 476, row: 1),
    (bars: (700, 903), xs: (745, 800, 855), h: (665, 930), v: 743, row: 2),
  )
  for pn in panels {
    for bx in pn.bars { line(p(bx, 955), p(bx, 1168), stroke: 0.7pt) }
    for (r, row) in names.enumerate() {
      for (c, nm) in row.enumerate() { content(p(pn.xs.at(c), ys.at(r)), tt(nm)) }
    }
    // 虚线在字母处断开（原图亦然）：横线避开该行三个元素，竖线避开第 1 列三个元素
    let hx = (pn.h.at(0), ..pn.xs.map(x => (x - 14, x + 14)).flatten(), pn.h.at(1))
    for i in range(0, hx.len(), step: 2) {
      line(p(hx.at(i), ys.at(pn.row)), p(hx.at(i + 1), ys.at(pn.row)), stroke: dsh)
    }
    let vy = (955, ..ys.map(y => (y - 13, y + 13)).flatten(), 1168)
    for i in range(0, vy.len(), step: 2) {
      line(p(pn.v, vy.at(i)), p(pn.v, vy.at(i + 1)), stroke: dsh)
    }
  }
})
