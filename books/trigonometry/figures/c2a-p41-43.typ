// 图 2·1、图 2·2（原书 p.41）、图 2·3、图 2·4（p.43）；页面 200 dpi 坐标。
#import "c2a-base.typ": *

// 图 2·1 角 AOB：射线从 OA 转到 OB
#let fig-c2a-2-1(width: 330 * k) = px-canvas(330, 190, origin: (270, 1130), width: width, (p, u) => {
  import cetz.draw: *
  let O = (300, 1300)
  let A = (590, 1305)
  let B = (530, 1150)
  c2a-seg(p, O, A, st: lb)
  c2a-seg(p, O, B, st: lb)
  let a0 = dirang(A.at(0) - O.at(0), A.at(1) - O.at(1)).deg()
  let a1 = dirang(B.at(0) - O.at(0), B.at(1) - O.at(1)).deg()
  c2a-arc(p, O, 55, a0, a1, arrow: true)
  lbl(p, O, $O$, dir: "w", d: 16)
  lbl(p, A, $A$, dir: "e", d: 10)
  lbl(p, B, $B$, dir: "e", d: 12)
})

// 一个齿轮：中心 c，齿顶半径 ro，齿根半径 ri，n 个齿，第一个齿的方向 a0（度）
#let c2a-gear(p, c, ro, ri, n, a0) = {
  import cetz.draw: *
  let pitch = 360 / n
  let pts = ()
  for i in range(n) {
    let m = a0 + i * pitch
    pts.push(p(..c2a-pol(c, ri, m - pitch * 0.30)))
    pts.push(p(..c2a-pol(c, ro, m - pitch * 0.17)))
    pts.push(p(..c2a-pol(c, ro, m + pitch * 0.17)))
    pts.push(p(..c2a-pol(c, ri, m + pitch * 0.30)))
  }
  line(..pts, close: true, stroke: lb)
  circle(p(..c), radius: 48, stroke: lb)
  circle(p(..c), radius: 26, stroke: lb)
}

// 图 2·2 两个互相啮合、半径相同的齿轮
#let fig-c2a-2-2(width: 330 * k) = px-canvas(330, 185, origin: (725, 1148), width: width, (p, u) => {
  import cetz.draw: *
  let L = (816, 1240)
  let R = (962, 1240)
  c2a-gear(p, L, 84, 63, 12, 0)
  c2a-gear(p, R, 84, 63, 12, 15)
  // 轮缘内侧的弧线（原图的明暗线）
  c2a-arc(p, L, 58, 150, 210, st: lw)
  c2a-arc(p, R, 58, -30, 30, st: lw)
})

// 图 2·3 940° 的角：射线按逆时针方向旋转 2 周后，再旋转 220°
#let fig-c2a-2-3(width: 470 * k) = px-canvas(470, 250, origin: (265, 255), width: width, (p, u) => {
  import cetz.draw: *
  let O = (485, 362)
  let A = (705, 368)
  let B = c2a-pol(O, 230, 220)
  c2a-seg(p, O, A, st: lb)
  c2a-seg(p, O, B, st: lb)
  c2a-spiral(p, O, 0, 940, 16, 110)
  lbl(p, O, $O$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "e", d: 12)
  lbl(p, B, $B$, dir: "w", d: 12)
})

// 图 2·4 −790° 的角：射线按顺时针方向旋转 2 周后，再按顺时针方向旋转 70°
#let fig-c2a-2-4(width: 340 * k) = px-canvas(340, 330, origin: (745, 225), width: width, (p, u) => {
  import cetz.draw: *
  let O = (828, 315)
  let A = (1055, 312)
  let B = c2a-pol(O, 240, -70)
  c2a-seg(p, O, A, st: lb)
  c2a-seg(p, O, B, st: lb)
  c2a-spiral(p, O, 0, -790, 16, 98)
  lbl(p, O, $O$, dir: "nw", d: 2)
  lbl(p, A, $A$, dir: "e", d: 12)
  lbl(p, B, $B$, dir: "se", d: 12)
})
