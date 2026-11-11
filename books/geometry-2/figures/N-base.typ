// 段 N 图的共用小工具（几何第二册 p.258–272，第 4 章复习题四、第 5 章 §5·1）。页面渲染 dpi：120。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆上的点：圆心 c、半径 r、数学角 deg（逆时针，页面 y 向下已处理）
#let cpt(c, r, deg) = (c.at(0) + r * calc.cos(deg * 1deg), c.at(1) - r * calc.sin(deg * 1deg))
#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 虚线圆弧 / 实线圆弧（数学角，逆时针）
#let darc(p, c, r, a0, a1) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: dsh)
}
#let carc(p, c, r, a0, a1, ..style) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: lw, ..style)
}
// 加粗线段
#let tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
// 水平细线阴影
#let hhatch = tiling(size: (3.2pt, 3.2pt))[
  #place(line(start: (0%, 50%), end: (100%, 50%), stroke: 0.4pt))
]
// 带箭头的细线（尺寸线）
#let adim(p, a, b, ..style) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw2, ..style)
}
// 白底文字标注（压在线上的字母，如半径上的 r）
#let wl(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), tt(body), frame: "rect", fill: white, stroke: none, padding: 1pt)
}
// 小号斜体文字（r、h 之类）
#let tsi(body) = text(font: fonts.song, size: 7pt, body)
