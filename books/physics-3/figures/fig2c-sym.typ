// 第 2 章下篇（§2·8 起）电路图、电解池图用的元件符号（CeTZ）。
// 所有函数的第一个参数是 px-canvas 给的 p（像素坐标换算函数），其余坐标、尺寸按各图自己的像素坐标（y 向下）。
#import "/common/series.typ": *

#let lw = 0.9pt
#let arr = (end: "stealth", fill: black, scale: 0.45)

// 折线导线
#let wire(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(a => p(..a)), stroke: lw)
}

// 接点（实心圆点）
#let node(p, x, y, r: 4, k: 1) = {
  import cetz.draw: *
  circle(p(x, y), radius: r * k, fill: black, stroke: none)
}

// 文字标注（可选白底，用来遮住液体波纹线）
#let lab(p, x, y, body, size: 8.5pt, bg: false, anc: "center") = {
  import cetz.draw: *
  if bg {
    content(p(x, y), anchor: anc, frame: "rect", fill: white, stroke: none, padding: 1.5pt, text(size: size, body))
  } else {
    content(p(x, y), anchor: anc, text(size: size, body))
  }
}

// 电灯：圆内画叉
#let lamp(p, x, y, r: 14, k: 1) = {
  import cetz.draw: *
  let r = r * k
  circle(p(x, y), radius: r, fill: white, stroke: lw)
  let d = r * 0.7071
  line(p(x - d, y - d), p(x + d, y + d), stroke: lw)
  line(p(x - d, y + d), p(x + d, y - d), stroke: lw)
}

// 电池（水平放置）：左边细长线为正极，右边粗短线为负极（flip: true 时反过来）
#let cell(p, x, y, h: 13, gap: 7, flip: false, k: 1) = {
  import cetz.draw: *
  let (h, gap) = (h * k, gap * k)
  let (xl, xs) = if flip { (x + gap / 2, x - gap / 2) } else { (x - gap / 2, x + gap / 2) }
  line(p(xl, y - h), p(xl, y + h), stroke: lw)
  line(p(xs, y - h * 0.5), p(xs, y + h * 0.5), stroke: 2.2pt)
}

// 电池（竖直放置）：上边细长线为正极，下边粗短线为负极（flip: true 时反过来）
#let cell-v(p, x, y, h: 13, gap: 7, flip: false, k: 1) = {
  import cetz.draw: *
  let (h, gap) = (h * k, gap * k)
  let (yl, ys) = if flip { (y + gap / 2, y - gap / 2) } else { (y - gap / 2, y + gap / 2) }
  line(p(x - h, yl), p(x + h, yl), stroke: lw)
  line(p(x - h * 0.5, ys), p(x + h * 0.5, ys), stroke: 2.2pt)
}

// 圆形仪表：圆内一个斜体字母
#let meter(p, x, y, letter, r: 13, size: 8pt, k: 1) = {
  import cetz.draw: *
  let r = r * k
  circle(p(x, y), radius: r, fill: white, stroke: lw)
  content(p(x, y), anchor: "center", text(size: size, math.italic(letter)))
}

// 圆形仪表：圆内一根指针（电流表、检流计的示意）
#let meter-needle(p, x, y, r: 15, k: 1) = {
  import cetz.draw: *
  let r = r * k
  circle(p(x, y), radius: r, fill: white, stroke: lw)
  line(p(x - r * 0.45, y + r * 0.5), p(x + r * 0.45, y - r * 0.5), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.35))
}

// 锯齿形电阻符号（水平）：从 (x, y) 向右长 len，n 个齿，齿高 a
#let zigzag(p, x, y, len, n: 5, a: 6, k: 1) = {
  import cetz.draw: *
  let a = a * k
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

// 锯齿形电阻符号（竖直）：从 (x, y) 向下长 len
#let zigzag-v(p, x, y, len, n: 5, a: 6, k: 1) = {
  import cetz.draw: *
  let a = a * k
  let pts = ((x, y),)
  let step = len / (n * 2 + 1)
  pts.push((x, y + step * 0.5))
  for i in range(n * 2) {
    pts.push((x + if calc.even(i) { -a } else { a }, y + step * (i + 1)))
  }
  pts.push((x, y + len - step * 0.5))
  pts.push((x, y + len))
  line(..pts.map(q => p(q.at(0), q.at(1))), stroke: lw)
}

// 接地（导线从上方接入，x、y 为导线末端）
#let ground(p, x, y, hw: 13, k: 1) = {
  import cetz.draw: *
  let hw = hw * k
  line(p(x, y), p(x, y + 3 * k), stroke: lw)
  for (dy, h) in ((3 * k, hw), (10 * k, hw * 0.66), (17 * k, hw * 0.33)) {
    line(p(x - h, y + dy), p(x + h, y + dy), stroke: 1.4pt)
  }
}

// 烧杯：左右壁、底、杯口外翻；液面在 level，液体用断续短线表示
#let beaker(p, x0, x1, top, bot, level, rows: 11, k: 1) = {
  import cetz.draw: *
  let rows = rows * k
  let y = level + 9 * k
  let n = 0
  while y < bot - 4 * k {
    let dash = if calc.even(n) { (7pt, 2.5pt) } else { (4pt, 3pt, 9pt, 2.5pt) }
    line(p(x0 + 3 * k, y), p(x1 - 3 * k, y), stroke: (thickness: 0.5pt, dash: dash, paint: black))
    y += rows
    n += 1
  }
  line(p(x0 - 3 * k, level), p(x1 + 3 * k, level), stroke: 0.7pt)
  line(p(x0 - 10 * k, top - 7 * k), p(x0, top), p(x0, bot), p(x1, bot), p(x1, top), p(x1 + 10 * k, top - 7 * k), stroke: 1.8pt)
}

// 极板（白底长方形，盖住液体线）
#let plate(p, x0, x1, top, bot) = {
  import cetz.draw: *
  rect(p(x0, top), p(x1, bot), fill: white, stroke: lw)
}

// 离子球（带阴影的圆球示意）：圆 + 内部文字
#let ion(p, x, y, body, r: 17, size: 7.5pt, k: 1) = {
  import cetz.draw: *
  let r = r * k
  circle(p(x, y), radius: r, fill: luma(225), stroke: lw)
  content(p(x, y), anchor: "center", text(size: size, body))
}

// 沿任意方向的锯齿形电阻：从 (x1, y1) 到 (x2, y2)，中段 f0～f1 画 n 个齿，齿高 a，两端是引线
#let zz(p, x1, y1, x2, y2, n: 6, a: 6, f0: 0.2, f1: 0.8) = {
  import cetz.draw: *
  let (dx, dy) = (x2 - x1, y2 - y1)
  let len = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / len, dy / len)
  let (nx, ny) = (-uy, ux)
  let pt(t, off) = (x1 + dx * t + nx * off, y1 + dy * t + ny * off)
  let pts = (pt(0, 0), pt(f0, 0))
  let m = n * 2
  for i in range(m) {
    let t = f0 + (f1 - f0) * (i + 1) / (m + 1)
    pts.push(pt(t, if calc.even(i) { -a } else { a }))
  }
  pts.push(pt(f1, 0))
  pts.push(pt(1, 0))
  line(..pts.map(q => p(q.at(0), q.at(1))), stroke: lw)
}
