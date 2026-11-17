// 第 3 章写实插图：沿用原扫描裁剪的二值化位图，图中标注（字母、汉字）涂去后用 CeTZ 补成真文字。
// 坐标是原书扫描页 110 dpi 渲染图上的像素坐标；box 是裁剪区 (x0, y0, x1, y1)，labels 是 (x, y, 内容) 列表。
#import "/common/series.typ": *

#let bm(file, box, labels: (), k: 0.0225cm, size: 9.5pt, italic: true) = {
  let (x0, y0, x1, y1) = box
  px-canvas(x1 - x0, y1 - y0, origin: (x0, y0), width: (x1 - x0) * k, (p, u) => {
    import cetz.draw: *
    content(p(x0, y0), anchor: "north-west", image(file, width: (x1 - x0) * u))
    for (x, y, body) in labels {
      content(p(x, y), anchor: "center", text(size: size, body))
    }
  })
}
#let N = text(style: "italic")[N]
#let S = text(style: "italic")[S]
#let L(s) = text(style: "italic")[#s]

// p.172
#let fig-3-1(width: 6.4cm) = bm("fig3-1.png", (105, 140, 400, 535), k: width / 295)
#let fig-3-2(width: 5.2cm) = bm("fig3-2.png", (515, 235, 750, 510), k: width / 235, labels: ((529, 364, N), (737, 364, S)))
#let fig-3-3(width: 4.8cm) = bm("fig3-3.png", (112, 950, 325, 1005), k: width / 213)
// p.173
#let fig-3-4(width: 4.9cm) = bm("fig3-4.png", (580, 140, 810, 425), k: width / 230,
  labels: ((687, 265, [北]), (627, 323, [西]), (748, 323, [东]), (686, 383, [南])))
#let fig-3-5(width: 4.4cm) = bm("fig3-5.png", (130, 810, 330, 1050), k: width / 200,
  labels: ((171, 929, N), (244, 911, S), (159, 958, [斥]), (180, 967, N), (264, 988, S)))
// p.177
#let fig-3-7(width: 4.2cm) = bm("fig3-7.png", (590, 865, 775, 1010), k: width / 185, labels: ((613, 943, N), (748, 945, S)))
// p.178
#let fig-3-9(width: 8cm) = bm("fig3-9.png", (385, 860, 760, 1160), k: width / 375,
  labels: ((507, 873, N), (524, 1008, N), (653, 1008, S)))
// p.179
#let fig-3-10(width: 9.4cm) = bm("fig3-10.png", (250, 590, 670, 830), k: width / 420)
#let fig-3-11(width: 8.8cm) = bm("fig3-11.png", (260, 900, 665, 1165), k: width / 405)
// p.182
#let fig-3-12(width: 5.8cm) = bm("fig3-12.png", (110, 510, 400, 665), k: width / 290, labels: ((167, 603, N), (250, 601, S)))
// p.183
#let fig-3-13(width: 7.6cm) = bm("fig3-13.png", (105, 140, 445, 375), k: width / 340, labels: ((226, 339, [电流方向]),))
#let fig-3-14(width: 7.8cm) = bm("fig3-14.png", (460, 140, 810, 375), k: width / 350,
  labels: ((718, 212, N), (580, 334, [电流方向])))
#let fig-3-15(width: 7.4cm) = bm("fig3-15.png", (460, 990, 795, 1165), k: width / 335,
  labels: ((514, 1013, [磁力线方向]), (766, 1049, L[I]), (721, 1070, [电流方向])))
// p.184
#let fig-3-16(width: 8.6cm) = bm("fig3-16.png", (105, 335, 490, 562), k: width / 385,
  labels: ((298, 345, L[I]), (272, 413, N), (272, 467, S), (127, 548, [+]), (428, 548, [−])))
#let fig-3-17(width: 7.4cm) = bm("fig3-17.png", (445, 800, 780, 1030), k: width / 335,
  labels: ((768, 866, L[I]), (491, 908, N), (727, 908, S)))
// p.185
#let fig-3-18(width: 6cm) = bm("fig3-18.png", (510, 335, 780, 484), k: width / 270, labels: ((575, 356, N), (742, 356, S)))
#let fig-ex-3-2-7(width: 2.9cm) = bm("ex3-2-7.png", (170, 130, 300, 278), k: width / 130,
  labels: ((219, 268, [−]), (265, 268, [+])))
#let fig-ex-3-2-8(width: 6.8cm) = bm("ex3-2-8.png", (440, 150, 745, 280), k: width / 305,
  labels: ((621, 172, N), (724, 172, S), (533, 252, [电源])))
// p.186
#let fig-3-19(width: 5.8cm) = bm("fig3-19.png", (130, 625, 390, 878), k: width / 260, labels: ((288, 650, N),))
#let fig-3-20(width: 7.2cm) = bm("fig3-20.png", (460, 665, 780, 860), k: width / 320)
// p.187
#let fig-3-21(width: 3.6cm) = bm("fig3-21.png", (170, 635, 330, 850), k: width / 160, labels: ((233, 833, N), (287, 833, S)))
#let fig-3-22(width: 7cm) = bm("fig3-22.png", (465, 685, 780, 835), k: width / 315, labels: ((480, 738, N), (747, 738, S)))
// p.188
#let fig-3-23(width: 2.7cm) = bm("fig3-23.png", (165, 255, 285, 480), k: width / 120)
#let fig-3-24(width: 7.4cm) = bm("fig3-24.png", (410, 100, 745, 500), k: width / 335,
  labels: ((460, 271, L[E]), (542.5, 246.5, L[S]), (543.5, 276, L[C]), (570, 370, L[H]), (460, 454, L[A]),
    (692.5, 285, L[P]), (722.5, 447.5, L[B])))
// p.189
#let fig-3-25(width: 13cm) = bm("fig3-25.png", (170, 130, 760, 420), k: width / 590,
  labels: ((342.5, 220, L[A]), (539, 222.5, L[B]), (582.5, 164, L[W]), (665, 161, L[W′]), (665, 207.5, L[R]),
    (701, 237.5, L[F]), (575, 245, L[C]), (571.5, 279, L[M]), (668.5, 278.5, L[S]), (290, 280, L[K])))
// p.190
#let fig-3-27(width: 12.4cm) = bm("fig3-27.png", (155, 350, 715, 610), k: width / 560,
  labels: ((194, 400, L[A]), (664, 382.5, L[B])))
// p.191
#let fig-3-28(width: 14.5cm) = bm("fig3-28.png", (130, 120, 805, 400), k: width / 675,
  labels: ((225, 270, L[K]), (446.5, 235, L[E]), (562.5, 175, L[C]), (723.5, 162.5, [电源]), (655, 374, [电解池])))
#let fig-3-29(width: 6.2cm) = bm("fig3-29.png", (500, 550, 775, 800), k: width / 275,
  labels: ((564, 569, L[B]), (601.5, 607.5, L[R]), (728.5, 611, L[M]), (545, 686, L[T])))
// p.192（习题 3·3 第 7 题）
#let fig-ex-3-3-7(width: 5.4cm) = bm("ex3-3-7.png", (330, 475, 570, 775), k: width / 240,
  labels: ((460, 537.5, L[F]), (522.5, 495, [接工作 \ 电路]), (548.5, 560, L[K]), (546, 595, L[P]),
    (425, 598.5, S), (499, 598.5, N), (367.5, 625, [控制电流 \ 的导线])))
// p.193
#let fig-3-30(width: 8.4cm) = bm("fig3-30.png", (280, 145, 650, 240), k: width / 370)
#let fig-3-31(width: 8.4cm) = bm("fig3-31.png", (270, 510, 650, 606), k: width / 380)
#let fig-3-32(width: 8.4cm) = bm("fig3-32.png", (270, 950, 650, 1050), k: width / 380)
// p.194
#let fig-3-33(width: 9cm) = bm("fig3-33.png", (95, 775, 490, 950), k: width / 395,
  labels: ((180, 937, L[(a)]), (397, 937, L[(b)])))
