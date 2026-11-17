// 物理第三册第 3 章下篇（c3b）图的公用小函数：电路元件符号、电流方向符号等。
// 坐标都是 px-canvas 里的页面像素坐标（y 向下），p 是 px-canvas 给的换算函数。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.5)
#let lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))
#let labw(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", padding: 1pt, fill: white, text(size: size, body))

// 折线（点用页面坐标）
#let pl(p, ..pts, st: 0.9pt) = cetz.draw.line(..pts.pos().map(q => p(..q)), stroke: st)
// 带箭头的直线
#let ar(p, a, b, st: 0.9pt, scale: 0.5) = cetz.draw.line(p(..a), p(..b), stroke: st, mark: (end: "stealth", fill: black, scale: scale))
// 结点（实心圆点）
#let node(p, x, y, r: 3.5) = cetz.draw.circle(p(x, y), radius: r, fill: black, stroke: none)

// 水平电阻符号（锯齿）：x0→x1，高度 y，两端各留引线
#let zig(p, x0, x1, y, n: 6, amp: 7, lead: 0.17, st: 0.9pt) = {
  let a = x0 + (x1 - x0) * lead
  let b = x1 - (x1 - x0) * lead
  let pts = ((x0, y), (a, y))
  for i in range(1, 2 * n) {
    pts.push((a + (b - a) * i / (2 * n), y + if calc.rem(i, 2) == 1 { -amp } else { amp }))
  }
  pts += ((b, y), (x1, y))
  cetz.draw.line(..pts.map(q => p(..q)), stroke: st)
}

// 电流垂直纸面的符号：out = ⊙（流向读者），in = ⊕，x = ⊗
#let isym(p, x, y, kind, r: 10, filled: false) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, fill: white, stroke: 0.9pt)
  if kind == "out" {
    circle(p(x, y), radius: if filled { r * 0.42 } else { r * 0.2 }, fill: black, stroke: none)
  } else if kind == "in" {
    line(p(x - r * 0.7, y), p(x + r * 0.7, y), stroke: 0.9pt)
    line(p(x, y - r * 0.7), p(x, y + r * 0.7), stroke: 0.9pt)
  } else {
    line(p(x - r * 0.7, y - r * 0.7), p(x + r * 0.7, y + r * 0.7), stroke: 0.9pt)
    line(p(x - r * 0.7, y + r * 0.7), p(x + r * 0.7, y - r * 0.7), stroke: 0.9pt)
  }
}

// 点状磁极块（用浅灰填充表示扫描里的点纹）
#let magnet(p, x0, y0, x1, y1) = cetz.draw.rect(p(x0, y0), p(x1, y1), fill: luma(215), stroke: 1pt)

// 电池符号（水平，长板在左，中心 x,y）
#let battery(p, x, y, flip: false) = {
  import cetz.draw: *
  let s = if flip { -1 } else { 1 }
  line(p(x - 6 * s, y - 11), p(x - 6 * s, y + 11), stroke: 0.9pt)
  line(p(x + 6 * s, y - 6), p(x + 6 * s, y + 6), stroke: 2pt)
}
