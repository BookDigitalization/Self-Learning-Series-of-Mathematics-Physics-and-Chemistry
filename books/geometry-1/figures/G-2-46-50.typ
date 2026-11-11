// 图 2·46（原书 p.115）、图 2·47、2·48（p.116）、图 2·49（p.117）、图 2·50（p.118）；页面 200 dpi 坐标。
#import "G-base.typ": *

// 图 2·46 例 1：AB=CD，BC=DA，对角线 AC。AB、DC 各 1 道短横，AD、BC 各 2 道
#let fig-G-2-46(width: 420 * k) = px-canvas(420, 190, origin: (300, 765), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((328, 916), (596, 916), (695, 781), (428, 781))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  ticks(p, A, B, 1)
  ticks(p, D, C, 1)
  ticks(p, A, D, 2)
  ticks(p, B, C, 2)
  lbl(p, D, $D$, dir: "n")
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "s")
  lbl(p, A, $A$, dir: "sw")
})

// 图 2·47 例 2：直线 AD、BC 相交于 O，AO=OD，BO=OC。AO、OD 各 2 道短横，BO、OC 各 1 道
#let fig-G-2-47(width: 360 * k) = px-canvas(360, 270, origin: (140, 805), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((165, 818), (408, 818), (228, 1052), (468, 1052))
  let O = G-meet(A, D, B, C)
  seg(p, A, D)
  seg(p, B, C)
  seg(p, A, B)
  seg(p, C, D)
  anglearc(p, O, A, B, 17)   // ∠1、∠2 的角弧（原图有）
  anglearc(p, O, C, D, 17)
  ticks(p, A, O, 2)
  ticks(p, O, D, 2)
  ticks(p, B, O, 1)
  ticks(p, O, C, 1)
  lbl(p, A, $A$, dir: "nw")
  lbl(p, B, $B$, dir: "ne")
  lbl(p, C, $C$, dir: "sw")
  lbl(p, D, $D$, dir: "se")
  content(p(O.at(0) + 14, O.at(1) + 1), tt($O$))
  content(p(311, 903), tsm($1$))
  content(p(318, 968), tsm($2$))
})

// 图 2·48 例 3：A、F、C、D 在一条直线上
#let fig-G-2-48(width: 440 * k) = px-canvas(440, 310, origin: (440, 775), width: width, (p, u) => {
  import cetz.draw: *
  let (A, F, C, D) = ((468, 927), (568, 927), (735, 927), (838, 927))
  let (B, E) = ((638, 787), (667, 1060))
  seg(p, A, D)
  seg(p, A, B)
  seg(p, B, C)
  seg(p, F, E)
  seg(p, E, D)
  anglearc(p, A, D, B, 28)
  anglearc(p, D, A, E, 28)
  anglearc(p, F, A, E, 18)
  anglearc(p, C, D, B, 20)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "n")
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "s")
  content(p(568, 913), tt($F$))
  content(p(735, 942), tt($C$))
  content(p(555, 948), tsm($1$))
  content(p(590, 938), tsm($3$))
  content(p(712, 916), tsm($4$))
  content(p(748, 907), tsm($2$))
})

// 图 2·49 例 4：左为 △ABC 及中线 BE、CF；中、右为拆开画出的 △BEC、△CFB
// 原图 F 在 AB 上、E 在 AC 上，取中点；FB、EC、BC 各 1 道短横
#let fig-G-2-49(width: 730 * k) = px-canvas(730, 225, origin: (100, 605), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((228, 655), (113, 797), (334, 797))
  let F = G-at(A, B, 0.5)
  let E = G-at(A, C, 0.5)
  poly(p, (A, B, C), close: true)
  seg(p, B, E)
  seg(p, C, F)
  ticks(p, F, B, 1)
  ticks(p, E, C, 1)
  ticks(p, B, C, 1)
  anglearc(p, B, C, A, 20)
  anglearc(p, C, B, A, 20)
  lbl(p, A, $A$, dir: "n")
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, F, $F$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  // △BEC
  let (B2, C2, E2) = ((352, 697), (565, 697), (512, 627))
  poly(p, (B2, C2, E2), close: true)
  ticks(p, B2, C2, 1)
  ticks(p, E2, C2, 1)
  anglearc(p, C2, B2, E2, 20)
  lbl(p, B2, $B$, dir: "w", d: 11)
  lbl(p, C2, $C$, dir: "e", d: 11)
  lbl(p, E2, $E$, dir: "n")
  // △CFB
  let (B3, C3, F3) = ((592, 794), (806, 794), (647, 727))
  poly(p, (B3, C3, F3), close: true)
  ticks(p, B3, C3, 1)
  ticks(p, B3, F3, 1)
  anglearc(p, B3, C3, F3, 20)
  lbl(p, B3, $B$, dir: "w", d: 11)
  lbl(p, C3, $C$, dir: "e", d: 11)
  lbl(p, F3, $F$, dir: "n")
})

// 图 2·50 例 5：AB∥DC，AD∥BC，对角线 DB
#let fig-G-2-50(width: 370 * k) = px-canvas(370, 185, origin: (340, 475), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((370, 626), (608, 626), (685, 493), (440, 493))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, B)
  anglearc(p, D, C, B, 24)
  anglearc(p, D, A, B, 24)
  anglearc(p, B, A, D, 24)
  anglearc(p, B, C, D, 22)
  lbl(p, D, $D$, dir: "nw")
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "se")
  lbl(p, A, $A$, dir: "w", d: 11)
  content(p(473, 506), tsm($1$))
  content(p(449, 524), tsm($3$))
  content(p(572, 614), tsm($2$))
  content(p(601, 595), tsm($4$))
})
