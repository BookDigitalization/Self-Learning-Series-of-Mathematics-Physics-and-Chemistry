// 图 2·51（原书 p.125）、图 2·52、2·53（p.126）、图 2·54（p.127）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 图 2·51：左 △ABC 加虚线位置 △DCB（BD=AB），右 △A'B'C'
// 等长记号：AB、BD、A'B' 各 1 道；BC、B'C' 各 2 道（原图 BC 处是较密的短横）
#let fig-H-2-51(width: 480 * k) = px-canvas(480, 300, origin: (255, 985), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((287, 1222), (407, 1005), (407, 1222), (527, 1222))
  let (A2, B2, C2) = ((705, 1222), (587, 1005), (587, 1222))
  poly(p, (A, B, C), close: true)
  H-thin(p, B, D)
  dseg(p, C, D)
  ticks(p, A, B, 1)
  ticks(p, B, D, 1)
  ticks(p, B, C, 2)
  rtmark(p, C, B, A)
  poly(p, (A2, B2, C2), close: true)
  ticks(p, A2, B2, 1)
  ticks(p, B2, C2, 2)
  rtmark(p, C2, B2, A2)
  lbl(p, B, $B$, dir: "n")
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "s")
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, B2, $B'$, dir: "nw")
  lbl(p, C2, $C'$, dir: "sw", d: 11)
  lbl(p, A2, $A'$, dir: "e", d: 11)
})

// 图 2·52 例 1：等腰 △ABC，高 BE、CF
#let fig-H-2-52(width: 270 * k) = px-canvas(270, 310, origin: (140, 935), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((275, 968), (172, 1210), (375, 1210))
  let F = H-foot(C, A, B)
  let E = H-foot(B, A, C)
  poly(p, (A, B, C), close: true)
  seg(p, B, E)
  seg(p, C, F)
  rtmark(p, F, A, C)
  rtmark(p, E, A, B)
  lbl(p, A, $A$, dir: "n")
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, F, $F$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "e", d: 11)
})

// 图 2·53 例 2：河（竖纹水面）、AB、BB'、B'A'；M 为 BB' 的中点，A、M、A' 在一条直线上
// 河中央的字原图糊成一团，按文意猜“河流”，用 unclear 标出（见备忘）。
#let fig-H-2-53(width: 440 * k) = px-canvas(440, 330, origin: (440, 935), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, B2, A2) = ((472, 958), (660, 958), (660, 1200), (838, 1200))
  let M = (660, 1079)
  // 水面：竖向波纹线
  for i in range(0, 17) {
    let x0 = 484 + i * 10
    let pts = range(0, 21).map(j => {
      let y = 948 + j * 15
      p(x0 + 2.2 * calc.sin(y * 0.16 + i), y)
    })
    line(..pts, stroke: 0.5pt)
  }
  // 水面左缘
  line(..range(0, 21).map(j => { let y = 948 + j * 15; p(474 + 2.5 * calc.sin(y * 0.1), y) }), stroke: lw)
  dseg(p, A, B)
  H-thin(p, A, M)
  seg(p, B, B2)
  seg(p, B2, A2)
  seg(p, M, A2)
  rtmark(p, B2, B, A2)
  content(p(560, 1095), box(fill: white, inset: 2pt, tt(unclear[河流])))
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, B2, $B'$, dir: "sw", d: 11)
  lbl(p, A2, $A'$, dir: "e", d: 11)
  content(p(676, 1069), tt($M$))
  content(p(646, 1058), tsm($1$))
  content(p(646, 1100), tsm($2$))
})

// 图 2·54 例 3：∠C=90°，∠B=2∠A，AB=2CB；BE 平分 ∠B，EM⊥AB
// 按条件算出：∠A=30°，∠B=60°，M 为 AB 中点，E 在 AC 上且 EA=EB
#let fig-H-2-54(width: 270 * k) = px-canvas(270, 350, origin: (620, 830), width: width, (p, u) => {
  import cetz.draw: *
  let C = (660, 1150)
  let B = (830, 1150)
  let A = (660, 1150 - 170 * calc.sqrt(3))
  let M = H-at(A, B, 0.5)
  let E = (660, 1150 - 170 / calc.sqrt(3))
  poly(p, (A, B, C), close: true)
  seg(p, B, E)
  dseg(p, E, M)
  ticks(p, A, M, 1)
  ticks(p, M, B, 1)
  ticks(p, C, B, 1)
  rtmark(p, M, A, E)
  anglearc(p, A, C, B, 28)
  anglearc(p, B, E, A, 30)
  lbl(p, A, $A$, dir: "n")
  lbl(p, C, $C$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "w", d: 11)
})
