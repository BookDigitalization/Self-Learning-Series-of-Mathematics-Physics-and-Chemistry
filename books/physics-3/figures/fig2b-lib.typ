// 第 2 章中篇（§2·5–§2·7）电路图共用的元件符号（CeTZ）。
// 所有函数都在 px-canvas 的绘图环境里调用，点一律是 p(x, y) 转换后的 CeTZ 坐标（单位 = 原书页面像素）。
#import "/common/series.typ": *

#let vadd(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
#let vsub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let vmul(a, k) = (a.at(0) * k, a.at(1) * k)
#let vlen(a) = calc.sqrt(a.at(0) * a.at(0) + a.at(1) * a.at(1))
#let vunit(a) = vmul(a, 1 / vlen(a))

// 图宽：原书页面 1 像素约合 0.0145 厘米
#let pxw(w) = w * 0.0145cm

// 带箭头的线（箭头不大）
#let arrow(a, b, ..args) = {
  import cetz.draw: line
  line(a, b, mark: (end: ">", fill: black, scale: 0.5), ..args)
}
// 两端都有箭头的尺寸线，中间可放文字（白底）
#let dim(a, b, body: none, size: 8pt) = {
  import cetz.draw: line, content
  line(a, b, mark: (start: ">", end: ">", fill: black, scale: 0.5))
  if body != none {
    content(vadd(a, vmul(vsub(b, a), 0.5)), box(fill: white, inset: (x: 1.5pt, y: 0.5pt), text(size: size, body)))
  }
}
// 在线段中点附近放一个箭头（电流方向）：t = 箭头尖所在位置（0–1）
#let mid-arrow(a, b, t: 0.5, len: 8) = {
  import cetz.draw: line
  let e = vunit(vsub(b, a))
  let tip = vadd(a, vmul(vsub(b, a), t))
  line(vsub(tip, vmul(e, len)), tip, mark: (end: ">", fill: black, scale: 0.5))
}
// 标注文字
#let lb(pt, body, anchor: "center", size: 8pt, bg: false) = {
  import cetz.draw: content
  if bg {
    content(pt, anchor: anchor, box(fill: white, inset: (x: 1pt, y: 0.5pt), text(size: size, body)))
  } else {
    content(pt, anchor: anchor, text(size: size, body))
  }
}
// 节点（实心圆点）
#let node(pt, r: 3.2) = {
  import cetz.draw: circle
  circle(pt, radius: r, fill: black, stroke: none)
}
// 电阻：a 到 b 的导线，中段 zl 长的锯齿；at = 锯齿中心在线段上的位置（0–1）
#let resistor(a, b, zl: 56, amp: 5, teeth: 6, at: 0.5) = {
  import cetz.draw: line
  let d = vsub(b, a)
  let e = vunit(d)
  let nv = (-e.at(1), e.at(0))
  let c = vadd(a, vmul(d, at))
  let s = vsub(c, vmul(e, zl / 2))
  let pts = (a, s)
  let n = teeth * 2
  for i in range(n) {
    let pos = vadd(s, vmul(e, zl * (i + 0.5) / n))
    let off = vmul(nv, if calc.even(i) { amp } else { -amp })
    pts.push(vadd(pos, off))
  }
  pts.push(vadd(s, vmul(e, zl)))
  pts.push(b)
  line(..pts)
}
// 只画电池的两个极板：c = 中心，e = 方向（单位向量，由正极指向负极）
#let plates(c, e, gap: 7, long: 18, short: 10, w: 2.2pt) = {
  import cetz.draw: line
  let nv = (-e.at(1), e.at(0))
  let p1 = vsub(c, vmul(e, gap / 2))
  let p2 = vadd(c, vmul(e, gap / 2))
  line(vadd(p1, vmul(nv, long / 2)), vsub(p1, vmul(nv, long / 2)))
  line(vadd(p2, vmul(nv, short / 2)), vsub(p2, vmul(nv, short / 2)), stroke: w)
}
// 电池：a 到 b 的导线，at 处画极板；长极板（正极）靠近 a，短粗极板靠近 b
#let cell(a, b, at: 0.5, gap: 7, long: 18, short: 10) = {
  import cetz.draw: line
  let d = vsub(b, a)
  let e = vunit(d)
  let c = vadd(a, vmul(d, at))
  line(a, vsub(c, vmul(e, gap / 2)))
  line(vadd(c, vmul(e, gap / 2)), b)
  plates(c, e, gap: gap, long: long, short: short)
}
// 串联电池组（中间用虚线省略）：ats1、ats2 为两端各组电池的位置（线段上 0–1），虚线接在两端组之间
#let cellpack(a, b, left: (0.2,), right: (0.8,), gap: 7, long: 18, short: 10) = {
  import cetz.draw: line
  let d = vsub(b, a)
  let e = vunit(d)
  let pt(t) = vadd(a, vmul(d, t))
  let l0 = left.first()
  let l1 = left.last()
  let r0 = right.first()
  let r1 = right.last()
  line(a, vsub(pt(l0), vmul(e, gap / 2)))
  for t in left { plates(pt(t), e, gap: gap, long: long, short: short) }
  for t in right { plates(pt(t), e, gap: gap, long: long, short: short) }
  // 极板之间的连线
  for i in range(left.len() - 1) { line(vadd(pt(left.at(i)), vmul(e, gap / 2)), vsub(pt(left.at(i + 1)), vmul(e, gap / 2))) }
  for i in range(right.len() - 1) { line(vadd(pt(right.at(i)), vmul(e, gap / 2)), vsub(pt(right.at(i + 1)), vmul(e, gap / 2))) }
  line(vadd(pt(l1), vmul(e, gap / 2)), vsub(pt(r0), vmul(e, gap / 2)), stroke: (dash: "dashed", thickness: 0.7pt))
  line(vadd(pt(r1), vmul(e, gap / 2)), b)
}
// 灯泡：圆内画叉
#let lamp(c, r: 12) = {
  import cetz.draw: circle, line
  circle(c, radius: r, fill: white)
  let k = r * 0.7071
  line((c.at(0) - k, c.at(1) - k), (c.at(0) + k, c.at(1) + k))
  line((c.at(0) - k, c.at(1) + k), (c.at(0) + k, c.at(1) - k))
}
// 电炉：圆内画竖直锯齿
#let furnace(c, r: 14) = {
  import cetz.draw: circle, line
  circle(c, radius: r, fill: white)
  let pts = ((c.at(0), c.at(1) + r * 0.85),)
  let n = 8
  for i in range(n) {
    pts.push((c.at(0) + (if calc.even(i) { 4 } else { -4 }), c.at(1) + r * 0.6 - r * 1.2 * (i + 0.5) / n))
  }
  pts.push((c.at(0), c.at(1) - r * 0.85))
  line(..pts)
}
