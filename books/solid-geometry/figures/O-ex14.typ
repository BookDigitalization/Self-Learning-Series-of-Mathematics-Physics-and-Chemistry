// 习题 3·14 插图：第 9 题（原书 p.282）、第 10 题（p.283）、第 14、15 题（p.284）；页面 200 dpi 坐标。
#import "O-base.typ": *

// 第 9 题：两底面积相等的球带的轴截面
#let fig-O-ex14-9(width: 230 * k) = px-canvas(230, 220, origin: (633, 1122), width: width, (p, u) => {
  import cetz.draw: *
  let O = (746, 1232)
  let r = 101
  circ(p, O, r, stroke: lb)
  let hw = calc.sqrt(r * r - 36 * 36)
  let O1 = (746, 1196)
  let O2 = (746, 1268)
  let A = (746 + hw, 1196)
  let B = (746 + hw, 1268)
  let C = (746 + r, 1232)
  seg(p, (746 - hw, 1196), A)
  seg(p, (746 - hw, 1268), B)
  line(p(..O1), p(..O2), stroke: lb)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, C)
  anglearc(p, O, C, A, 16)
  L(p, 743, 1182, $O_1$)
  L(p, A.at(0) + 12, 1189, $A$)
  L(p, 733, 1232, $O$)
  L(p, C.at(0) + 10, 1232, $C$)
  L(p, B.at(0) + 12, 1270, $B$)
  L(p, 743, 1282, $O_2$)
})

// 第 10 题：量篮球的直径（三幅并排）
#let fig-O-ex14-10(width: 590 * k) = px-canvas(590, 260, origin: (205, 525), width: width, (p, u) => {
  import cetz.draw: *
  // 左：篮球上的圆
  let O = (326, 662)
  circ(p, O, 112, stroke: lb)
  let c1 = (322, 588)
  O-earc(p, c1, 88, 32, 0, 180, rot: 5, st: dsh)
  O-earc(p, c1, 88, 32, 180, 360, rot: 5, st: (paint: black, thickness: lb))
  dseg(p, (326, 550), (331, 774))
  let B = O-ept(c1, 88, 32, 5, rot: 5)
  dseg(p, (323, 588), B)
  let A = O-ept(c1, 88, 32, 150, rot: 5)
  let C = O-ept(c1, 88, 32, 205, rot: 5)
  pdot(p, A, r: 2)
  pdot(p, C, r: 2)
  L(p, 323, 538, $M$)
  L(p, 280, 586, $A$)
  L(p, 307, 592, $O_1$)
  L(p, 421, 576, $B$)
  L(p, 257, 633, $C$)
  L(p, 340, 650, $O$)
  L(p, 331, 788, $N$)
  // 中：作出的三角形和它的外接圆
  let Q = (540, 655)
  circ(p, Q, 77)
  let A1 = O-cpt(Q, 77, 70)
  let B1 = O-cpt(Q, 77, -22)
  let C1 = O-cpt(Q, 77, 200)
  poly(p, (A1, B1, C1), close: true)
  pdot(p, Q, r: 2)
  L(p, A1.at(0) + 10, 565, $A_1$)
  L(p, 556, 648, $O_1$)
  L(p, C1.at(0) - 12, 694, $C_1$)
  L(p, B1.at(0) + 14, 694, $B_1$)
  // 右：作出直角三角形 MBO_1、NBM
  let c3 = (677, 650)
  let R = 107
  O-arc(p, c3, R, -90, 90, st: (paint: black, thickness: lb))
  let M = (677, 543)
  let N = (677, 757)
  let O1 = (677, 590)
  let Bp = (677 + calc.sqrt(R * R - 60 * 60), 590)
  seg(p, M, N)
  seg(p, O1, Bp)
  seg(p, M, Bp)
  seg(p, N, Bp)
  L(p, 680, 531, $M$)
  L(p, 663, 590, $O_1$)
  L(p, Bp.at(0) + 13, 583, $B$)
  L(p, 680, 771, $N$)
})

// 第 14 题：钢珠压在材料上
#let fig-O-ex14-14(width: 280 * k) = px-canvas(280, 140, origin: (580, 370), width: width, (p, u) => {
  import cetz.draw: *
  // 地面与斜线阴影
  let x = 592
  while x < 860 {
    line(p(x, 471), p(x - 17, 496), stroke: lw)
    x += 12
  }
  seg(p, (580, 471), (855, 471))
  // 钢珠（原图为点画的写实球，这里用灰度渐变表示）
  circle(p(701, 437), radius: 61, stroke: lb,
    fill: gradient.radial(luma(250), luma(150), luma(70), center: (38%, 38%), radius: 75%))
})

// 第 15 题：在球内钻圆柱形孔
#let fig-O-ex14-15(width: 245 * k) = px-canvas(245, 260, origin: (630, 712), width: width, (p, u) => {
  import cetz.draw: *
  let O = (749, 843)
  let r = 113
  let rc = 75
  let h = calc.sqrt(r * r - rc * rc)
  let yt = 843 - h
  let yb = 843 + h
  let t1 = calc.atan2(-rc, h).deg()
  // 两侧剩余部分的阴影
  O-hatch(p, O-arcpts(O, r, t1, 360 - t1), ang: 120, gap: 7)
  O-hatch(p, O-arcpts(O, r, -(180 - t1), 180 - t1), ang: 60, gap: 7)
  circ(p, O, r, stroke: lb)
  // 球的大圆（赤道）：后半虚线，前半在孔外实线、孔内虚线
  O-earc(p, O, r, 25, 0, 180, st: dsh)
  let tc = calc.acos(rc / r).deg()
  O-earc(p, O, r, 25, 180, 180 + tc)
  O-earc(p, O, r, 25, 180 + tc, 360 - tc, st: dsh)
  O-earc(p, O, r, 25, 360 - tc, 360)
  // 圆柱：上底整圆实线，中截面虚线，下底后半虚线
  O-earc(p, (749, yt), rc, 17, 0, 360)
  O-earc(p, O, rc, 17, 0, 360, st: dsh)
  O-ell(p, (749, yb), rc, 18)
  seg(p, (749 - rc, yt), (749 - rc, yb))
  seg(p, (749 + rc, yt), (749 + rc, yb))
  // 过 A、B 的大圆（经线）：左半实线，右半虚线
  O-earc(p, O, 37, r, 90, 270)
  O-earc(p, O, 37, r, -90, 90, st: dsh)
  dseg(p, (749, 730), (749, 956))
  L(p, 751, 721, $A$)
  L(p, 661, 752, $C_1$)
  L(p, 737, 751, $O_1$)
  L(p, 735, 849, $O$)
  L(p, 735, 917, $O_2$)
  L(p, 664, 936, $D_2$)
  L(p, 839, 936, $D$)
  L(p, 748, 970, $B$)
})
