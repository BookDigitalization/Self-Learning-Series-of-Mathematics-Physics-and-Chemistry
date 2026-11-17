// 第 4 章插图的公共工具：位图（原扫描裁剪二值化）+ CeTZ 补字，以及电路元件符号。
// 坐标一律是 render-pages.py --dpi 200 --grid 100 页面图在看图工具里显示的像素坐标（y 向下）。
#import "/common/series.typ": *

// 位图 + 真文字标注。box = (x0, y0, x1, y1) 为裁剪框（与 crop-figure.py 的裁剪框同一坐标系）；
// labels = ((x, y, 内容), …)，x、y 为文字中心。extra 为 (p, u) => { … }，补画矢量线条。
#let bitmap-fig(file, box, labels, width: auto, size: 9pt, extra: none) = {
  let (x0, y0, x1, y1) = box
  let w = x1 - x0
  let h = y1 - y0
  let wd = if width == auto { w * 0.0072cm } else { width }
  px-canvas(w, h, origin: (x0, y0), width: wd, (p, u) => {
    import cetz.draw: *
    content(p(x0, y0), anchor: "north-west", image(file, width: w * u))
    for l in labels {
      content(p(l.at(0), l.at(1)), text(size: size, l.at(2)))
    }
    if extra != none { extra(p, u) }
  })
}

#let arrow-mark = (end: ">", fill: black, scale: 0.5)

// 电池组（短板为负极在左，长板为正极在右）：从 x0 到 x1，中心线 y
#let battery(p, x0, x1, y) = {
  import cetz.draw: *
  line(p(x0, y - 13), p(x0, y + 13), stroke: 1.6pt)
  line(p(x0 + 14, y - 22), p(x0 + 14, y + 22), stroke: 0.7pt)
  line(p(x0 + 14, y), p(x1 - 14, y), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(x1 - 14, y - 13), p(x1 - 14, y + 13), stroke: 1.6pt)
  line(p(x1, y - 22), p(x1, y + 22), stroke: 0.7pt)
}

// 电键：两接点 xa、xb，刀臂向上翘
#let key-switch(p, xa, xb, y) = {
  import cetz.draw: *
  circle(p(xa, y), radius: 4, fill: black, stroke: none)
  circle(p(xb, y), radius: 4, fill: black, stroke: none)
  line(p(xa, y), p(xb - 12, y - 32), stroke: 0.9pt)
}

// 变阻器（锯齿）：从 x0 到 x1，中心线 y，n 个齿
#let rheostat(p, x0, x1, y, n: 8, amp: 11) = {
  import cetz.draw: *
  let pts = ()
  let dx = (x1 - x0) / (2 * n)
  for i in range(2 * n + 1) {
    pts.push(p(x0 + i * dx, y + if calc.rem(i, 2) == 1 { -amp } else { amp }))
  }
  line(..pts, stroke: 0.9pt)
}

// 灯泡（圆内叉）
#let lamp(p, x, y, r) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, stroke: 1pt)
  let d = r * 0.7071
  line(p(x - d, y - d), p(x + d, y + d), stroke: 0.9pt)
  line(p(x - d, y + d), p(x + d, y - d), stroke: 0.9pt)
}

// 电流计（圆内标字）
#let meter(p, x, y, r, body) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, stroke: 1pt)
  content(p(x, y), text(size: 9pt, body))
}

#let junction(p, x, y) = {
  import cetz.draw: *
  circle(p(x, y), radius: 4.5, fill: black, stroke: none)
}

#let tx(p, x, y, body, size: 9pt) = {
  import cetz.draw: *
  content(p(x, y), text(size: size, body))
}
