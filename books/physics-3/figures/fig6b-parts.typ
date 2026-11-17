// 第 6 章下篇（§6·9 起）电路图用的元件符号（CeTZ）。
// 所有函数的第一个参数是 px-canvas 给的 p（页面像素坐标 → CeTZ 坐标），其余坐标都是原书页面 200 dpi 像素坐标（y 向下）。
#import "/common/series.typ": *

#let lw = 0.8pt

// 折线导线
#let wire(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(a => p(..a)), stroke: lw)
}

// 连接点
#let node(p, x, y, r: 4.5) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, fill: black, stroke: none)
}

// 接地（导线从上方接入，x、y 为导线末端）
#let ground(p, x, y, hw: 15) = {
  import cetz.draw: *
  line(p(x, y), p(x, y + 3), stroke: lw)
  for (dy, h) in ((3, hw), (11, hw * 0.66), (19, hw * 0.33)) {
    line(p(x - h, y + dy), p(x + h, y + dy), stroke: 1.5pt)
  }
}

// 接地（导线从左方接入）
#let ground-h(p, x, y, hh: 17) = {
  import cetz.draw: *
  line(p(x, y), p(x + 3, y), stroke: lw)
  for (dx, h) in ((3, hh), (12, hh * 0.66), (21, hh * 0.33)) {
    line(p(x + dx, y - h), p(x + dx, y + h), stroke: 1.5pt)
  }
}

// 天线（顶点向下的“Y”形；x、y 为顶端横线中点，导线从尖端下垂）
#let antenna(p, x, y, hw: 26, h: 24) = {
  import cetz.draw: *
  line(p(x - hw, y), p(x + hw, y), stroke: 2.2pt)
  line(p(x - hw, y), p(x, y + h), p(x + hw, y), stroke: lw)
}

// 电容器（导线水平，极板竖直）；var 为可变
#let cap(p, x, y, len: 24, gap: 9, var: false, st: 2pt) = {
  import cetz.draw: *
  line(p(x - gap / 2, y - len / 2), p(x - gap / 2, y + len / 2), stroke: st)
  line(p(x + gap / 2, y - len / 2), p(x + gap / 2, y + len / 2), stroke: st)
  if var {
    line(p(x - 16, y + 15), p(x + 16, y - 15), stroke: 0.7pt,
      mark: (end: "stealth", fill: black, scale: 0.5))
  }
}

// 电容器（导线竖直，极板水平）
#let cap-v(p, x, y, len: 24, gap: 9, var: false, st: 2pt) = {
  import cetz.draw: *
  line(p(x - len / 2, y - gap / 2), p(x + len / 2, y - gap / 2), stroke: st)
  line(p(x - len / 2, y + gap / 2), p(x + len / 2, y + gap / 2), stroke: st)
  if var {
    line(p(x - 15, y + 16), p(x + 15, y - 16), stroke: 0.7pt,
      mark: (end: "stealth", fill: black, scale: 0.5))
  }
}

// 水平线圈（向上凸的 n 个半圆，从 x 开始）
#let coil-h(p, x, y, n, r: 8) = {
  import cetz.draw: *
  for i in range(n) {
    arc(p(x + r + 2 * r * i, y), start: 0deg, stop: 180deg, radius: r, anchor: "origin", stroke: lw)
  }
}

// 竖直线圈（n 个半圆，从 y 向下；side 为 "left" 向左凸、"right" 向右凸）
#let coil-v(p, x, y, n, r: 8, side: "left") = {
  import cetz.draw: *
  for i in range(n) {
    let c = p(x, y + r + 2 * r * i)
    if side == "left" {
      arc(c, start: 90deg, stop: 270deg, radius: r, anchor: "origin", stroke: lw)
    } else {
      arc(c, start: -90deg, stop: 90deg, radius: r, anchor: "origin", stroke: lw)
    }
  }
}

// 电阻（矩形）；(x, y) 为左边中点
#let resistor(p, x, y, w: 60, h: 20) = {
  import cetz.draw: *
  rect(p(x, y - h / 2), p(x + w, y + h / 2), stroke: lw, fill: white)
}

// 电池组（导线水平，从 x 开始，第一片为长板）；cells 为片数
#let battery(p, x, y, cells: 2, long: 22, short: 12, step: 11) = {
  import cetz.draw: *
  for i in range(cells * 2) {
    let l = if calc.even(i) { long } else { short }
    let st = if calc.even(i) { 1.2pt } else { 2.2pt }
    line(p(x + step * i, y - l / 2), p(x + step * i, y + l / 2), stroke: st)
  }
}

// 交流电源（圆内一个“～”）
#let ac-source(p, x, y, r: 17) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, stroke: lw, fill: white)
  bezier(p(x - 9, y), p(x + 9, y), p(x - 4, y - 11), p(x + 4, y + 11), stroke: 0.9pt)
}

// 三极电子管：(x, y) 为外壳左上角，w、h 为外壳宽高；
// 画出外壳、屏极、栅极（虚线）、阴极（拱形灯丝）；各部分位置按比例取，需要时可另设
#let tube(p, x, y, w, h, has-grid: true, plate-y: 0.2, grid-y: 0.43, cat-y: 0.72) = {
  import cetz.draw: *
  rect(p(x, y), p(x + w, y + h), radius: w / 2, stroke: 1.6pt)
  line(p(x + w * 0.27, y + h * plate-y), p(x + w * 0.73, y + h * plate-y), stroke: 3pt)
  if has-grid {
    line(p(x + w * 0.1, y + h * grid-y), p(x + w * 0.9, y + h * grid-y),
      stroke: (thickness: 1.2pt, dash: (6pt, 3pt)))
  }
  bezier(p(x + w * 0.1, y + h * (cat-y + 0.14)), p(x + w * 0.9, y + h * (cat-y + 0.14)),
    p(x + w * 0.12, y + h * (cat-y - 0.1)), p(x + w * 0.88, y + h * (cat-y - 0.1)), stroke: 2.6pt)
}

// 竖直电池组（导线竖直，极板水平，从 y 开始向下，第一片为长板）
#let battery-v(p, x, y, cells: 2, long: 30, short: 16, step: 13) = {
  import cetz.draw: *
  for i in range(cells * 2) {
    let l = if calc.even(i) { long } else { short }
    let st = if calc.even(i) { 1.2pt } else { 2.4pt }
    line(p(x - l / 2, y + step * i), p(x + l / 2, y + step * i), stroke: st)
  }
}

// 方块图里的方框与文字；(x0, y0)–(x1, y1) 为左上、右下角
#let blk(p, x0, y0, x1, y1, body, size: 10pt) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), stroke: 1.6pt, fill: white)
  content(p((x0 + x1) / 2, (y0 + y1) / 2), anchor: "center", text(font: fonts.hei, size: size, weight: "medium", body))
}

// 扬声器符号（方框 + 喇叭口，开口向右）；(x, y) 为方框左边中点
#let spk(p, x, y, hh: 24, flare: 58) = {
  import cetz.draw: *
  rect(p(x, y - hh), p(x + 14, y + hh), stroke: 1.6pt, fill: white)
  line(p(x + 14, y - hh), p(x + 48, y - flare), p(x + 48, y + flare), p(x + 14, y + hh), stroke: 1.6pt)
}

// 送话器符号（左半圆 + 竖线）；(x, y) 为竖线中点，r 为半径
#let mic(p, x, y, r: 36) = {
  import cetz.draw: *
  arc(p(x, y), start: 90deg, stop: 270deg, radius: r, anchor: "origin", stroke: 1.8pt)
  line(p(x, y - r), p(x, y + r), stroke: 1.8pt)
  line(p(x - r * 0.25, y - r * 0.96), p(x - r * 0.25, y + r * 0.96), stroke: 1.2pt)
}

// 方块图用的图中文字
#let blab(p, x, y, body, size: 10pt) = {
  import cetz.draw: *
  content(p(x, y), anchor: "center", text(font: fonts.hei, size: size, weight: "bold", body))
}

// 扩音机符号：方框内一个“>”；(x0, y0)–(x1, y1) 为方框左上、右下角
#let amp(p, x0, y0, x1, y1) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), stroke: 1.6pt, fill: white)
  let ym = (y0 + y1) / 2
  line(p(x0 + 18, y0 + 11), p(x0 + 80, ym), p(x0 + 18, y1 - 11), stroke: 1.2pt)
}

// 扬声器单元（侧视）：竖直的小方框（线圈）+ 向右张开的喇叭口，(x, y) 为方框中心
#let spk-r(p, x, y, hh: 14, flare: 27, fw: 26) = {
  import cetz.draw: *
  rect(p(x - 6, y - hh), p(x + 6, y + hh), stroke: 1.3pt, fill: white)
  line(p(x + 6, y - hh + 2), p(x + 6 + fw, y - flare), p(x + 6 + fw, y + flare), p(x + 6, y + hh - 2), stroke: 1.3pt)
}

// 扬声器单元（俯视）：水平的小方框 + 向上张开的喇叭口，(x, y) 为方框中心
#let spk-u(p, x, y, hw: 20, flare: 35, fh: 22) = {
  import cetz.draw: *
  rect(p(x - hw, y - 7), p(x + hw, y + 7), stroke: 1.3pt, fill: white)
  line(p(x - hw + 3, y - 7), p(x - flare, y - 7 - fh), p(x + flare, y - 7 - fh), p(x + hw - 3, y - 7), stroke: 1.3pt)
}

// 带圈的 + / −（空穴 / 电子）
#let hole(p, x, y, sign: "+", r: 13) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, stroke: 0.9pt, fill: white)
  content(p(x, y), anchor: "center", text(size: 8.5pt, weight: "bold", if sign == "+" { [+] } else { [#sym.minus] }))
}

// 竖直虚线（P-N 结两侧的边界线）
#let vdash(p, x, y0, y1) = {
  import cetz.draw: *
  line(p(x, y0), p(x, y1), stroke: (thickness: 1.2pt, dash: (6pt, 3pt)))
}

// 竖直电阻（锯齿形）：(x, y) 为上端，h 为总高
#let zigzag-v(p, x, y, h: 100, n: 5, a: 11) = {
  import cetz.draw: *
  let pts = ((x, y),)
  let d = h / (2 * n + 2)
  pts.push((x, y + d))
  for i in range(2 * n) {
    pts.push((x + if calc.even(i) { a } else { -a }, y + d * (i + 1.5) + d * 0.5))
  }
  pts.push((x, y + h - d))
  pts.push((x, y + h))
  line(..pts.map(a => p(..a)), stroke: lw)
}

// 竖直线圈（椭圆环叠成，n 个）：cx 为中心线，从 y 向下
#let coil-loops(p, cx, y, n, rx: 13, ry: 8) = {
  import cetz.draw: *
  for i in range(n) {
    circle(p(cx, y + ry + 2 * ry * i), radius: (rx, ry), stroke: lw)
  }
}
