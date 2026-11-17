// 第 6 章电路图元件符号（局部函数）。坐标都用原书页面像素坐标（150 dpi），p 是 px-canvas 给的换算函数。
#import "/common/series.typ": *

#let sw = 0.75pt   // 导线粗细
#let wire(p, ..pts) = cetz.draw.line(..pts.pos().map(q => p(..q)), stroke: sw)
#let node(p, x, y, r: 3) = cetz.draw.circle(p(x, y), radius: r, fill: black, stroke: none)
#let txt(p, x, y, body, size: 9pt, anchor: "center") = cetz.draw.content(p(x, y), anchor: anchor, text(size: size, body))

// 电容器（两块极板）。dir "v"：导线竖直、极板水平；"h"：导线水平、极板竖直。(x, y) 为两板中心。
#let cap(p, x, y, dir: "v", len: 28, gap: 10) = {
  import cetz.draw: *
  if dir == "v" {
    line(p(x - len / 2, y - gap / 2), p(x + len / 2, y - gap / 2), stroke: 2.2pt)
    line(p(x - len / 2, y + gap / 2), p(x + len / 2, y + gap / 2), stroke: 2.2pt)
  } else {
    line(p(x - gap / 2, y - len / 2), p(x - gap / 2, y + len / 2), stroke: 2.2pt)
    line(p(x + gap / 2, y - len / 2), p(x + gap / 2, y + len / 2), stroke: 2.2pt)
  }
}
// 可变电容器：电容器加一支斜箭头
#let varcap(p, x, y, dir: "v", len: 30, gap: 10) = {
  import cetz.draw: *
  cap(p, x, y, dir: dir, len: len, gap: gap)
  line(p(x - len * 0.6, y + len * 0.5), p(x + len * 0.6, y - len * 0.5), stroke: 0.75pt, mark: (end: ">", fill: black, scale: 0.6))
}
// 电池组（竖直）：n 片，长短相间，长线在上。(x, y0) 为最上一片位置，间距 d。
#let battery(p, x, y0, n: 4, d: 13, long: 32, short: 18, first-long: true) = {
  import cetz.draw: *
  for i in range(n) {
    let isl = if first-long { calc.even(i) } else { not calc.even(i) }
    let w = if isl { long } else { short }
    line(p(x - w / 2, y0 + i * d), p(x + w / 2, y0 + i * d), stroke: if isl { 1.4pt } else { 2.4pt })
  }
}
// 横放电池：竖线长短相间，长线（正极）在右
#let battery-h(p, x0, y, n: 2, d: 9, long: 22, short: 12) = {
  import cetz.draw: *
  for i in range(n * 2) {
    let w = if calc.even(i) { short } else { long }
    line(p(x0 + i * d, y - w / 2), p(x0 + i * d, y + w / 2), stroke: if calc.even(i) { 2.4pt } else { 1.2pt })
  }
}
// 竖直线圈：轴在 x，自 ya 到 yb；线圈向 side（1 右，-1 左）鼓出，宽 w，n 匝
#let coil(p, x, ya, yb, n: 4, w: 16, side: 1) = {
  import cetz.draw: *
  let steps = 24
  let a = (yb - ya) / (n * 2 * calc.pi)
  let b = a * 2.1
  let pts = range(0, n * steps + 1).map(i => {
    let t = i / steps * 2 * calc.pi
    p(x + side * w * (1 - calc.cos(t)) / 2, ya + a * t - b * calc.sin(t))
  })
  line(..pts, stroke: sw)
}
// 竖放电阻（矩形）
#let res-v(p, x, y, h: 50, w: 14) = cetz.draw.rect(p(x - w / 2, y - h / 2), p(x + w / 2, y + h / 2), stroke: sw, fill: white)
#let res-h(p, x, y, w: 62, h: 16) = cetz.draw.rect(p(x - w / 2, y - h / 2), p(x + w / 2, y + h / 2), stroke: sw, fill: white)
// 天线：顶部一横加 V 形，x 为天线竖线，y 为顶端；下端连到 y + 36
#let antenna(p, x, y, h: 36) = {
  import cetz.draw: *
  line(p(x - 13, y), p(x + 13, y), stroke: sw)
  line(p(x - 13, y), p(x, y + 22), p(x + 13, y), stroke: sw)
  line(p(x, y + 22), p(x, y + h), stroke: sw)
}
// 接地符号：(x, y) 为最上一横的位置
#let ground(p, x, y) = {
  import cetz.draw: *
  line(p(x - 14, y), p(x + 14, y), stroke: sw)
  line(p(x - 9, y + 5), p(x + 9, y + 5), stroke: sw)
  line(p(x - 4, y + 10), p(x + 4, y + 10), stroke: sw)
}
// 二极管（矿石）：dir "r" 向右导通。(x, y) 为中心
#let diode(p, x, y, dir: "r", s: 11) = {
  import cetz.draw: *
  let sg = if dir == "r" { 1 } else { -1 }
  line(p(x - sg * s, y - s), p(x - sg * s, y + s), p(x + sg * s, y), close: true, fill: black, stroke: sw)
  line(p(x + sg * s, y - s), p(x + sg * s, y + s), stroke: 1.6pt)
}
// 电流计（圆圈内一根指针）
#let gmeter(p, x, y, r: 17, needle: true) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, stroke: sw, fill: white)
  if needle { line(p(x - 5, y + 8), p(x + 6, y - 9), stroke: sw, mark: (end: ">", fill: black, scale: 0.5)) }
}
// 听筒：右侧鼓出的一条圆弧，两端各一个小圆
#let phone(p, x, y, h: 44) = {
  import cetz.draw: *
  merge-path(stroke: sw, {
    bezier(p(x, y - h / 2), p(x, y + h / 2), p(x + 20, y - h / 3), p(x + 20, y + h / 3))
  })
  circle(p(x, y - h / 2 + 3), radius: 4, stroke: sw, fill: white)
  circle(p(x, y + h / 2 - 3), radius: 4, stroke: sw, fill: white)
}
// 两个竖线圈并排并画铁芯（变压器）：铁芯在两线圈之间 xc
#let core(p, xc, ya, yb, gap: 8) = {
  import cetz.draw: *
  line(p(xc - gap / 2, ya), p(xc - gap / 2, yb), stroke: sw)
  line(p(xc + gap / 2, ya), p(xc + gap / 2, yb), stroke: sw)
}
// 交流电源 ~：圆圈（原图只画两个端点与 ~，此处画端点和波纹）
#let acsrc(p, x, y) = {
  import cetz.draw: *
  circle(p(x, y), radius: 3, stroke: sw, fill: white)
}
// 带箭头的细线
#let arrow(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: 0.75pt, mark: (end: ">", fill: black, scale: 0.55))
// 坐标轴：竖轴自 (x, y1)（下端）到 (x, y2)（上端，带箭头），横轴自 (x, y0) 到 (x1, y0)（带箭头）
#let axes(p, x, y0, x1, ytop, ybot: none, lx: "t") = {
  import cetz.draw: *
  line(p(x, if ybot == none { y0 + 10 } else { ybot }), p(x, ytop), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
  line(p(x - 4, y0), p(x1, y0), stroke: sw, mark: (end: ">", fill: black, scale: 0.6))
}
// 波纹线：自 a 到 b，沿垂直方向叠加 n 个周期、振幅 amp 的正弦波
#let wavy(p, a, b, amp: 6, n: 4, arrow: false) = {
  import cetz.draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let len = calc.sqrt(dx * dx + dy * dy)
  let nx = -dy / len
  let ny = dx / len
  let pts = range(0, 81).map(i => {
    let s = i / 80
    let w = amp * calc.sin(2 * calc.pi * n * s)
    p(a.at(0) + dx * s + nx * w, a.at(1) + dy * s + ny * w)
  })
  line(..pts, stroke: 1pt, mark: if arrow { (end: ">", fill: black, scale: 0.6) } else { none })
}
