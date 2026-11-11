// 图 1·12–图 1·22（原书 p.13–17），读坐标时的页面渲染 200 dpi。
// 分割规是写实插画：保留原扫描的二值化 PNG（A-1-13a/b、A-1-15、A-1-18、A-1-19a/b），图中字母、数字涂去后用 CeTZ 补。
#import "/books/geometry-1/figures/A-lib.typ": *

// 图 1·12（p.13）：把一块直尺（下）放在毫米尺上读数
#let fig-A-1-12(width: 285 * k) = px-canvas(285, 185, origin: (595, 155), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((626, 161), (829, 161), (829, 262), (626, 262)), close: true)
  for c in ((637, 171), (818, 171), (637, 252), (818, 252)) { circle(p(..c), radius: 5, stroke: lt) }
  A-dash(p, (626, 185), (829, 185))
  seg(p, (626, 202), (829, 202))
  seg(p, (626, 223), (829, 223))
  A-dash(p, (626, 239), (829, 239))
  // 毫米尺：0 在 x = 627，每厘米 66.7 像素
  line(p(605, 328), p(605, 268), p(868, 268), p(860, 285), p(866, 300), p(858, 315), p(852, 332), p(605, 328),
    stroke: lw)
  A-ticks(p, 627, 66.7, 268, 0, 34)
  for i in range(4) { A-t(p, (627 + i * 66.7, 298), text(font: fonts.song, size: 9pt)[#i]) }
})

// 图 1·13（p.13）：(1) 分割规量线段 AB  (2) 把张口移到毫米尺上
#let fig-A-1-13(width: 450 * k) = px-canvas(450, 520, origin: (130, 410), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-1-13a.png", (140, 420, 290, 782))
  A-pseg(p, (154, 784), (276, 784), s: 4)
  lbl(p, (150, 806), $A$, dir: "c", d: 0)
  lbl(p, (278, 806), $B$, dir: "c", d: 0)
  A-t(p, (240, 887), [(1)])
  A-img(p, u, "A-1-13b.png", (335, 420, 490, 786))
  line(p(336, 861), p(336, 787), p(564, 787), p(556, 805), p(564, 825), p(556, 845), p(562, 861), p(336, 861),
    stroke: lw)
  A-ticks(p, 353, 66.5, 788, 0, 31)
  for i in range(4) { A-t(p, (353 + i * 66.5, 823), text(font: fonts.song, size: 9pt)[#i]) }
  A-t(p, (426, 889), [(2)])
})

// 图 1·14（p.13）：读毫米尺上 B、D 指的刻度（2.2 厘米、2.3 厘米）
#let fig-A-1-14(width: 190 * k) = px-canvas(190, 190, origin: (640, 450), width: width, (p, u) => {
  import cetz.draw: *
  let ruler(top, bot, l, r, pt, lab) = {
    line(p(l, top), p(r, top), p(r + 4, top + 15), p(r - 3, top + 25), p(r + 1, bot), p(l + 3, bot), p(l - 3, top + 25),
      p(l + 5, top + 15), close: true, stroke: lw)
    A-ticks(p, 677, 111, top, -1, 10, lm: 11, lh: 20, lc: 20)
    A-t(p, (677, bot - 14), text(font: fonts.song, size: 9pt)[2])
    A-t(p, (788, bot - 14), text(font: fonts.song, size: 9pt)[3])
    line(p(pt, top - 8), p(pt, top), stroke: lt)
    lbl(p, (pt, top - 17), lab, dir: "c", d: 0)
  }
  ruler(475, 518, 657, 800, 701, $B$)
  ruler(590, 631, 655, 799, 708, $D$)
})

// 图 1·15（p.13）：分割规两针尖并齐（正确）与不并齐（不正确）
#let fig-A-1-15(width: 305 * k) = px-canvas(305, 180, origin: (575, 725), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-1-15.png", (575, 728, 880, 872))
  A-t(p, (637, 893), [正确])
  A-t(p, (797, 893), [不正确])
})

// 图 1·16（p.14）：PQ = a + b + c
#let fig-A-1-16(width: 700 * k) = px-canvas(700, 135, origin: (140, 525), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (162, 549), (298, 549), s: 4)
  lbl(p, (233, 538), $a$, dir: "c", d: 0)
  A-pseg(p, (162, 588), (324, 588), s: 4)
  lbl(p, (241, 577), $b$, dir: "c", d: 0)
  A-pseg(p, (162, 631), (273, 631), s: 4)
  lbl(p, (219, 620), $c$, dir: "c", d: 0)
  seg(p, (364, 591), (819, 591))
  for x in (364, 499, 659, 766) { A-tick(p, (0, 0), (1, 0), (x, 591), s: 5) }
  lbl(p, (430, 579), $a$, dir: "c", d: 0)
  lbl(p, (579, 577), $b$, dir: "c", d: 0)
  lbl(p, (714, 579), $c$, dir: "c", d: 0)
  lbl(p, (362, 607), $P$, dir: "c", d: 0)
  lbl(p, (766, 609), $Q$, dir: "c", d: 0)
})

// 图 1·17（p.14）：PQ = l − m
#let fig-A-1-17(width: 720 * k) = px-canvas(720, 95, origin: (130, 1020), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (144, 1042), (360, 1042), s: 4)
  lbl(p, (257, 1031), $l$, dir: "c", d: 0)
  A-pseg(p, (144, 1094), (281, 1094), s: 4)
  lbl(p, (219, 1086), $m$, dir: "c", d: 0)
  // 中：P 在左端
  A-vl(p, 386, 1036, 1103)
  A-vl(p, 599, 1036, 1103)
  A-vl(p, 466, 1063, 1103)
  A-dim(p, 386, 599, 1044, lab: $l$, labx: 498, gapw: 14)
  seg(p, (386, 1071), (599, 1071))
  A-dim(p, 466, 599, 1097, lab: $m$, labx: 526, gapw: 18)
  lbl(p, (381, 1083), $P$, dir: "c", d: 0)
  lbl(p, (466, 1083), $Q$, dir: "c", d: 0)
  // 右：从 l 的左端起截取 m，P 在右端
  A-vl(p, 614, 1036, 1103)
  A-vl(p, 830, 1036, 1103)
  A-vl(p, 748, 1063, 1103)
  A-dim(p, 614, 830, 1044, lab: $l$, labx: 716, gapw: 14)
  seg(p, (614, 1071), (830, 1071))
  A-dim(p, 614, 748, 1097, lab: $m$, labx: 684, gapw: 18)
  lbl(p, (748, 1083), $Q$, dir: "c", d: 0)
  lbl(p, (826, 1083), $P$, dir: "c", d: 0)
})

// 图 1·18（p.15）：用分割规把线段 AB 五等分（写实插画，字母和数字重新标注）
#let fig-A-1-18(width: 330 * k) = px-canvas(330, 390, origin: (550, 190), width: width, (p, u) => {
  import cetz.draw: *
  A-img(p, u, "A-1-18.png", (550, 190, 880, 580))
  lbl(p, (577, 563), $A$, dir: "c", d: 0)
  lbl(p, (829, 399), $B$, dir: "c", d: 0)
  for (x, y, n) in ((635, 532, 1), (688, 506, 2), (726, 484, 3), (782, 465, 4), (826, 430, 5)) {
    A-t(p, (x, y), [#n])
  }
})

// 图 1·19（p.15）：(1) 针尖间距离缩短 a  (2) 加长 a
#let fig-A-1-19(width: 440 * k) = px-canvas(440, 430, origin: (290, 630), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  A-img(p, u, "A-1-19a.png", (600, 634, 690, 758))
  seg(p, (319, 762), (712, 762))
  for (i, x) in ((1, 386), (2, 462), (3, 536), (4, 608), (5, 681)) {
    A-tick(p, (0, 0), (1, 0), (x, 762), s: 5)
    A-t(p, (x, 777), [#i])
  }
  A-tick(p, (0, 0), (1, 0), (654, 762), s: 5)
  lbl(p, (317, 750), $A$, dir: "c", d: 0)
  lbl(p, (654, 748), $B$, dir: "c", d: 0)
  A-vl(p, 651, 762, 815)
  A-vl(p, 682, 762, 815)
  line(p(623, 802), p(650, 802), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(704, 802), p(683, 802), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  lbl(p, (666, 802), $a$, dir: "c", d: 0)
  A-t(p, (511, 836), [(1)])
  // (2)
  A-img(p, u, "A-1-19b.png", (540, 850, 620, 986))
  seg(p, (301, 989), (721, 989))
  for (i, x) in ((1, 365), (2, 426), (3, 486), (4, 548), (5, 611)) {
    A-tick(p, (0, 0), (1, 0), (x, 989), s: 5)
    A-t(p, (x, 1004), [#i])
  }
  A-tick(p, (0, 0), (1, 0), (643, 989), s: 5)
  lbl(p, (301, 975), $A$, dir: "c", d: 0)
  lbl(p, (643, 978), $B$, dir: "c", d: 0)
  A-vl(p, 611, 989, 1035)
  A-vl(p, 643, 989, 1035)
  line(p(579, 1011), p(610, 1011), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(675, 1011), p(644, 1011), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  lbl(p, (627, 1012), $a$, dir: "c", d: 0)
  A-t(p, (586, 1051), [(2)])
})

// 图 1·20（p.16）：在射线 AM 上截取 5 个 a
#let fig-A-1-20(width: 600 * k) = px-canvas(600, 60, origin: (170, 155), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (183, 179), (245, 179), s: 4)
  lbl(p, (214, 168), $a$, dir: "c", d: 0)
  seg(p, (306, 181), (690, 181))
  A-dash(p, (690, 181), (750, 181))
  pdot(p, (750, 181), r: 2)
  let xs = (306, 365, 428, 486, 546, 605)
  for x in xs { A-tick(p, (0, 0), (1, 0), (x, 181), s: 5) }
  for (n, x) in (($A$, 303), ($B$, 365), ($C$, 428), ($D$, 486), ($E$, 546), ($F$, 605), ($M$, 665)) {
    lbl(p, (x, 198), n, dir: "c", d: 0)
  }
  for x in (335, 396, 458, 518, 577) { lbl(p, (x, 167), $a$, dir: "c", d: 0) }
})

// 图 1·21（p.16）：x = a + 2b、y = 3a − 2b
#let fig-A-1-21(width: 760 * k) = px-canvas(760, 215, origin: (90, 520), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (102, 536), (236, 536), s: 5)
  lbl(p, (163, 527), $a$, dir: "c", d: 0)
  A-pseg(p, (102, 578), (200, 578), s: 5)
  lbl(p, (148, 567), $b$, dir: "c", d: 0)
  // x = a + 2b
  A-vl(p, 292, 530, 598)
  A-vl(p, 428, 530, 573)
  A-vl(p, 631, 530, 598)
  A-dim(p, 292, 428, 536, lab: $a$, labx: 352, gapw: 14)
  A-dim(p, 428, 631, 536, lab: $2b$, labx: 540, gapw: 26)
  line(p(292, 567), p(760, 567), stroke: lb)
  A-dash(p, (760, 567), (812, 567))
  lbl(p, (279, 563), $A$, dir: "c", d: 0)
  lbl(p, (826, 568), $M$, dir: "c", d: 0)
  A-dim(p, 292, 631, 592, lab: $x$, labx: 463, gapw: 14)
  // y = 3a − 2b
  A-vl(p, 203, 650, 722)
  A-vl(p, 403, 680, 722)
  A-vl(p, 604, 650, 722)
  A-dim(p, 203, 604, 658, lab: $3a$, labx: 398, gapw: 26)
  line(p(203, 687), p(675, 687), stroke: lb)
  A-dash(p, (675, 687), (725, 687))
  lbl(p, (190, 688), $B$, dir: "c", d: 0)
  lbl(p, (617, 677), $E$, dir: "c", d: 0)
  lbl(p, (736, 687), $N$, dir: "c", d: 0)
  A-dim(p, 203, 403, 713, lab: $y$, labx: 304, gapw: 14)
  A-dim(p, 403, 604, 713, lab: $2b$, labx: 505, gapw: 26)
})

// 图 1·22（p.17）：按 10:1 放大的 5.4 cm、2.5 cm 及其差 2.9 cm
#let fig-A-1-22(width: 400 * k) = px-canvas(400, 240, origin: (320, 500), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (339, 527), (703, 527), s: 11)
  A-t(p, (532, 514), [5.4 cm])
  lbl(p, (332, 548), $A$, dir: "c", d: 0)
  lbl(p, (702, 548), $B$, dir: "c", d: 0)
  A-pseg(p, (339, 593), (507, 593), s: 11)
  A-t(p, (424, 581), [2.5 cm])
  lbl(p, (338, 617), $C$, dir: "c", d: 0)
  lbl(p, (504, 617), $D$, dir: "c", d: 0)
  A-vl(p, 339, 640, 662)
  A-vl(p, 700, 640, 662)
  A-dim(p, 339, 700, 651, lab: [5.4 cm], labx: 516, gapw: 72)
  line(p(339, 683), p(700, 683), stroke: lb)
  A-vl(p, 339, 672, 694)
  A-vl(p, 502, 672, 694)
  A-vl(p, 700, 672, 694)
  A-vl(p, 339, 706, 728)
  A-vl(p, 502, 706, 728)
  A-vl(p, 700, 706, 728)
  A-dim(p, 339, 502, 717, lab: [2.5 cm], labx: 421, gapw: 72)
  A-dim(p, 502, 700, 717, lab: [2.9 cm], labx: 613, gapw: 72)
})
