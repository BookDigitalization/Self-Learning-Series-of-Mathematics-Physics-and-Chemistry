// 第 5 章电路图元件：线圈（螺旋）、电阻（折线）、端点。坐标为像素（y 向下），由调用处的 p 换成 CeTZ 坐标。
#import "/common/series.typ": *

// 沿 a→b 的螺旋线圈，loops 个圈，r 为圈半径（像素）
#let coil(p, a, b, loops: 6, r: 12, lead: 0.12) = {
  import cetz.draw: *
  let (ax, ay) = a
  let (bx, by) = b
  let dx = bx - ax
  let dy = by - ay
  let len = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / len
  let uy = dy / len
  let nx = -uy
  let ny = ux
  let s0 = len * lead
  let s1 = len * (1 - lead)
  let pitch = (s1 - s0) / loops
  let pts = ((ax, ay),)
  let n = loops * 24
  for i in range(0, n + 1) {
    let th = 2 * calc.pi * loops * i / n
    let u = s0 + (s1 - s0) * i / n - 0.5 * pitch * calc.sin(th) * 1.0
    let v = r * (1 - calc.cos(th)) / 2
    pts.push((ax + ux * u + nx * v, ay + uy * u + ny * v))
  }
  pts.push((bx, by))
  line(..pts.map(q => p(..q)), stroke: 0.7pt)
}

// 沿 a→b 的锯齿电阻，peaks 个尖，amp 为振幅（像素）
#let resistor(p, a, b, peaks: 6, amp: 9, lead: 0.2) = {
  import cetz.draw: *
  let (ax, ay) = a
  let (bx, by) = b
  let dx = bx - ax
  let dy = by - ay
  let len = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / len
  let uy = dy / len
  let nx = -uy
  let ny = ux
  let s0 = len * lead
  let s1 = len * (1 - lead)
  let pts = ((ax, ay), (ax + ux * s0, ay + uy * s0))
  let n = peaks * 2
  for i in range(1, n) {
    let u = s0 + (s1 - s0) * i / n
    let v = if calc.rem(i, 2) == 1 { amp } else { -amp }
    pts.push((ax + ux * u + nx * v, ay + uy * u + ny * v))
  }
  pts.push((ax + ux * s1, ay + uy * s1))
  pts.push((bx, by))
  line(..pts.map(q => p(..q)), stroke: 0.7pt)
}

#let dot(p, a) = {
  import cetz.draw: *
  circle(p(..a), radius: 3.2, fill: black, stroke: none)
}

#let wire(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(q => p(..q)), stroke: 0.7pt)
}

#let lab(p, x, y, body, sz: 9pt) = {
  import cetz.draw: *
  content(p(x, y), anchor: "center", text(size: sz, body))
}
