// 图 1·76（原书 p.107，放缩尺的外形和简图）、图 1·77（p.108）；页面 120 dpi 坐标。
// 1·76 上图原为写实的放缩尺画：按各点位置用 CeTZ 重画成带孔的尺条；1·77 的两个位置按 SC = EC、SD = SA 的关系计算。
#import "F-base.typ": *

// 一根尺条：从 a 到 b 的白底黑边长条（宽 w 像素），两端圆头
#let F-bar(p, a, b, w: 11) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (nx, ny) = (-dy / l * w / 2, dx / l * w / 2)
  line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), p(b.at(0) - nx, b.at(1) - ny),
    p(a.at(0) - nx, a.at(1) - ny), close: true, stroke: lt, fill: white)
}
// 销孔
#let F-hole(p, c, r: 2) = {
  import cetz.draw: *
  circle(p(..c), radius: r, fill: black, stroke: none)
}
// 铰接点（大圆孔）
#let F-pin(p, c) = {
  import cetz.draw: *
  circle(p(..c), radius: 5, fill: white, stroke: lw)
  circle(p(..c), radius: 1.6, fill: black, stroke: none)
}
// 尖针 / 铅笔（笔尖朝下的小三角）
#let F-tip(p, c) = {
  import cetz.draw: *
  line(p(c.at(0) - 3, c.at(1)), p(c.at(0) + 3, c.at(1)), p(c.at(0), c.at(1) + 18), close: true, fill: black, stroke: none)
}

// 图 1·76 放缩尺：上为外形（四条尺 AD、AB、CE、CS，在 A、B、C、D 处用螺丝钉连接），下为简图
#let fig-F-1-76(width: 540 * k) = px-canvas(540, 460, origin: (280, 200), width: width, (p, u) => {
  import cetz.draw: *
  // 上图：各铰接点（取自原图）
  let (S, D, C, A, B, E) = ((292, 390), (395, 330), (542, 235), (459, 390), (617, 290), (747, 385))
  let ext1 = (331, 270)   // 尺 AD 越过 D 的一端
  let ext2 = (677, 255)   // 尺 AB 越过 B 的一端
  F-bar(p, S, C)
  F-bar(p, ext1, A)
  F-bar(p, A, ext2)
  F-bar(p, C, E)
  for pt in (D, B) { F-pin(p, pt) }
  F-pin(p, C)
  F-tip(p, S)
  F-tip(p, A)
  F-tip(p, E)
  for t in (0.2, 0.4, 0.6, 0.8) {
    F-hole(p, lerp(S, C, t))
    F-hole(p, lerp(C, E, t))
    F-hole(p, lerp(A, ext2, t))
    F-hole(p, lerp(ext1, A, t))
  }
  lbl(p, S, $S$, dir: "w", d: 12)
  lbl(p, D, $D$, dir: "ne", d: 12)
  lbl(p, C, $C$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "e", d: 12)
  // 下图简图
  let (S2, E2) = ((330, 620), (740, 620))
  let C2 = (535, 466)
  let t = 0.4
  let D2 = lerp(S2, C2, t)
  let A2 = lerp(S2, E2, t)
  let B2 = (A2.at(0) + C2.at(0) - D2.at(0), A2.at(1) + C2.at(1) - D2.at(1))
  dseg(p, S2, E2)
  seg(p, S2, C2)
  seg(p, C2, E2)
  seg(p, D2, A2)
  seg(p, A2, B2)
  lbl(p, C2, $C$, dir: "n", d: 10)
  lbl(p, D2, $D$, dir: "nw", d: 10)
  lbl(p, B2, $B$, dir: "ne", d: 10)
  lbl(p, S2, $S$, dir: "w", d: 11)
  lbl(p, A2, $A$, dir: "s", d: 11)
  lbl(p, E2, $E$, dir: "e", d: 11)
})

// 图 1·77 放缩尺描图：尖针 A 描四边形 A1A2A3A4，铅笔 E 画出 E1E2E3E4
#let fig-F-1-77(width: 780 * k) = px-canvas(780, 400, origin: (110, 400), width: width, (p, u) => {
  import cetz.draw: *
  let S = (150, 603)
  let L = 271          // CS = CE
  let t = 0.35         // SD / SC = SA / SE
  let apex(E) = {
    let (dx, dy) = (E.at(0) - S.at(0), E.at(1) - S.at(1))
    let d = calc.sqrt(dx * dx + dy * dy)
    let h = calc.sqrt(L * L - d * d / 4)
    let (nx, ny) = (dy / d, -dx / d)
    (S.at(0) + dx / 2 + nx * h, S.at(1) + dy / 2 + ny * h)
  }
  let E1 = (618, 505)
  let E2 = (565, 660)
  let E3 = (670, 765)
  let E4 = (815, 580)
  let place(E) = {
    let C = apex(E)
    let D = lerp(S, C, t)
    let A = lerp(S, E, t)
    let B = (A.at(0) + C.at(0) - D.at(0), A.at(1) + C.at(1) - D.at(1))
    (C, D, A, B)
  }
  let (C1, D1, A1, B1) = place(E1)
  let (C2, D2, A2, B2) = place(E2)
  let A3 = (332, 668)
  let A4 = (390, 598)
  // 虚线 SE1、SE2
  dseg(p, S, E1)
  dseg(p, S, E2)
  // 两个位置的尺
  for (C, D, A, B, E) in ((C1, D1, A1, B1, E1), (C2, D2, A2, B2, E2)) {
    line(p(..S), p(..C), stroke: lt)
    line(p(..C), p(..E), stroke: lt)
    line(p(..D), p(..A), stroke: lt)
    line(p(..A), p(..B), stroke: lt)
  }
  // 四边形 A1A2A3A4（尖针描的）：A1A2、A2A3 描粗；E1E2E3E4（铅笔画的）描粗并加箭头
  line(p(..A1), p(..A2), p(..A3), stroke: lb)
  line(p(..A3), p(..A4), p(..A1), stroke: lw)
  line(p(..E1), p(..E2), p(..E3), p(..E4), close: true, stroke: lb)
  amid(p, E1, E2)
  amid(p, E2, E3)
  amid(p, E3, E4)
  lbl(p, S, $S$, dir: "w", d: 11)
  lbl(p, C1, $C_1$, dir: "n", d: 10)
  lbl(p, C2, $C_2$, dir: "ne", d: 11)
  lbl(p, B1, $B_1$, dir: "ne", d: 10)
  lbl(p, B2, $B_2$, dir: "e", d: 11)
  lbl(p, D1, $D_1$, dir: "nw", d: 11)
  lbl(p, D2, $D_2$, dir: "sw", d: 11)
  lbl(p, A1, $A_1$, dir: "n", d: 11)
  lbl(p, A2, $A_2$, dir: "sw", d: 11)
  lbl(p, A3, $A_3$, dir: "s", d: 10)
  lbl(p, A4, $A_4$, dir: "e", d: 11)
  lbl(p, E1, $E_1$, dir: "n", d: 11)
  lbl(p, E2, $E_2$, dir: "s", d: 11)
  lbl(p, E3, $E_3$, dir: "s", d: 11)
  lbl(p, E4, $E_4$, dir: "e", d: 11)
})
