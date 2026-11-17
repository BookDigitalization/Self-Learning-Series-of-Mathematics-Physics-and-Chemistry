// 物理第三册第 1 章下篇图的共用小工具（CeTZ）。p 为 px-canvas 给出的坐标换算函数，坐标 y 向下。
#import "/common/series.typ": *

#let th = 0.8pt
#let thin = 0.5pt

// 斜线阴影矩形
#let hatch(p, x0, y0, x1, y1, d: 9, stroke-w: th) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), stroke: stroke-w)
  let c = x0 + y0 + d
  while c < x1 + y1 {
    let lo = calc.max(x0, c - y1)
    let hi = calc.min(x1, c - y0)
    if lo < hi { line(p(lo, c - lo), p(hi, c - hi), stroke: 0.4pt) }
    c += d
  }
}

// 箭头线
#let arr(p, a, b, w: th, s: 0.5) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: w, mark: (end: "stealth", fill: black, scale: s))
}

// 接地符号：导线下端在 (x, y)
#let ground(p, x, y, w: 30) = {
  import cetz.draw: *
  line(p(x - w / 2, y), p(x + w / 2, y), stroke: th)
  line(p(x - w / 3, y + 7), p(x + w / 3, y + 7), stroke: th)
  line(p(x - w / 6, y + 14), p(x + w / 6, y + 14), stroke: th)
}

// 文字标注
#let lab(p, x, y, body, size: 9pt, fill: none) = {
  import cetz.draw: *
  content(p(x, y), anchor: "center", text(size: size, body), fill: fill, padding: 1pt, stroke: none)
}

// 电容器符号（导线水平）：中心 (x, y)，极板高 h、间距 g
#let cap-h(p, x, y, h: 13, g: 12) = {
  import cetz.draw: *
  line(p(x - g / 2, y - h), p(x - g / 2, y + h), stroke: 1.4pt)
  line(p(x + g / 2, y - h), p(x + g / 2, y + h), stroke: 1.4pt)
}

// 实心节点
#let dot(p, x, y, r: 3.5, u: 1) = {
  import cetz.draw: *
  circle(p(x, y), radius: r * u, fill: black, stroke: none)
}

// 一圈射线（点电荷电场）：中心 (cx, cy)，从半径 r0 到 r1，n 条，向外或向内
#let rays(p, cx, cy, r0, r1, n: 12, inward: false) = {
  import cetz.draw: *
  for i in range(n) {
    let a = 360deg / n * i + 90deg
    let c = calc.cos(a)
    let s = -calc.sin(a)
    let a0 = (cx + r0 * c, cy + r0 * s)
    let a1 = (cx + r1 * c, cy + r1 * s)
    if inward { arr(p, a1, a0) } else { arr(p, a0, a1) }
  }
}

// 带标注的位图：位图来自原扫描裁剪（二值化），图中字母涂去后用 CeTZ 补成真文字。坐标为位图像素。
#let bm(file, w, h, width, labels, size: 8.5pt) = px-canvas(w, h, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image(file, width: w * u))
  for (x, y, body) in labels {
    lab(p, x, y, body, size: size)
  }
})
