// 第 2 章电路图用的元件符号（CeTZ）。
// 这些函数只能在 px-canvas 的 (p, u) => { import cetz.draw: *; … } 里调用；p 是像素坐标换算函数，
// 坐标、尺寸都按各图自己的像素坐标（长度单位与 p 一致）。
#import "/common/series.typ": *
#import cetz.draw: *

#let lw = 1.1pt

// 接点（实心圆点）
#let jdot(p, x, y, r: 4) = circle(p(x, y), radius: r, fill: black, stroke: none)

// 电灯：圆内画叉
#let lamp(p, x, y, r: 16, stroke: lw) = {
  circle(p(x, y), radius: r, fill: white, stroke: stroke)
  let d = r * 0.7071
  line(p(x - d, y - d), p(x + d, y + d), stroke: stroke)
  line(p(x - d, y + d), p(x + d, y - d), stroke: stroke)
}

// 电池（水平放置）：左边细长线为正极，右边粗短线为负极；(x, y) 为这一对线的中点，h 为长线的半高
#let cell(p, x, y, h: 15, gap: 7) = {
  line(p(x - gap / 2, y - h), p(x - gap / 2, y + h), stroke: lw)
  line(p(x + gap / 2, y - h * 0.5), p(x + gap / 2, y + h * 0.5), stroke: 2.4pt)
}

// 电池组：n 个电池串联，(x, y) 为最左端长线的位置
#let battery(p, x, y, n: 3, h: 15, pitch: 14, gap: 7) = {
  for i in range(n) {
    cell(p, x + gap / 2 + i * pitch, y, h: h, gap: gap)
  }
}

// 圆形仪表：圆内一个斜体字母
#let meter(p, x, y, letter, r: 14, size: 8pt) = {
  circle(p(x, y), radius: r, fill: white, stroke: lw)
  content(p(x, y), anchor: "center", text(size: size, math.italic(letter)))
}

// 锯齿形电阻符号（水平）：从 (x, y) 向右长 len，n 个齿，齿高 a
#let zigzag(p, x, y, len, n: 5, a: 7) = {
  let pts = ((x, y),)
  let step = len / (n * 2 + 1)
  pts.push((x + step * 0.5, y))
  for i in range(n * 2) {
    pts.push((x + step * (i + 1), y + if calc.even(i) { -a } else { a }))
  }
  pts.push((x + len - step * 0.5, y))
  pts.push((x + len, y))
  line(..pts.map(q => p(q.at(0), q.at(1))), stroke: lw)
}

// 电键（水平导线上，闸刀向右上斜）：左接点 (x1, y)，右接点 (x2, y)，刀尖抬起高度 dy
#let key-sw(p, x1, x2, y, dy: 16) = {
  line(p(x1, y), p(x2, y - dy), stroke: lw)
}
