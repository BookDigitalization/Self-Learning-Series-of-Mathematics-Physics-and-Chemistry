// 图 2·12、图 2·13（原书 p.50）、图 2·14、图 2·15（p.51）、图 2·16（p.52）；页面 200 dpi 坐标。
// 终边上取点 P，作 x 轴的垂线；角 α 用弧（钝角、优角用较小的弧）。
#import "c2a-base.typ": *

// 公用：终边过 P 的角。O 原点，P 终边上的点，E 终边画到的端点，axes = (x0, x1, y0, y1)，
// ar 角弧半径，al 角 α 标注位置；labs 为 ((点, 内容, 方位, 距离), …)
#let c2a-angfig(p, O, P, E, axes, ar, al, labs, ol: "se") = {
  import cetz.draw: *
  let (x0, x1, y0, y1) = axes
  c2a-axes(p, O, x0, x1, y0, y1, ol: none, st: lb)
  lbl(p, O, $O$, dir: ol, d: 12)
  c2a-seg(p, O, E, st: lb)
  c2a-seg(p, P, (P.at(0), O.at(1)), st: lb)
  let a = dirang(P.at(0) - O.at(0), P.at(1) - O.at(1)).deg()
  if a < 0 { a += 360 }
  c2a-arc(p, O, ar, 0, a, arrow: true)
  lbl(p, al, $alpha$, dir: "c", d: 0)
  for (pt, body, dir, d) in labs { lbl(p, pt, body, dir: dir, d: d) }
}


// 图 2·12 锐角 α
#let fig-c2a-2-12(width: 440 * k) = px-canvas(440, 400, origin: (175, 905), width: width, (p, u) => {
  let O = (213, 1242)
  let P = (424, 1072)
  c2a-angfig(p, O, P, (492, 1017), (180, 605, 1300, 915), 42, (262, 1225), (
    (P, $P$, "nw", 12),
    (c2a-mid(O, P), $r$, "nw", 10),
    ((424, 1157), $y$, "e", 10),
    ((320, 1242), $x$, "s", 12),
  ), ol: "sw")
})

// 图 2·13 钝角 α
#let fig-c2a-2-13(width: 380 * k) = px-canvas(380, 390, origin: (630, 900), width: width, (p, u) => {
  let O = (902, 1242)
  let P = (692, 1068)
  c2a-angfig(p, O, P, (652, 1035), (637, 1003, 1285, 905), 25, (921, 1213), (
    (P, $P$, "ne", 12),
    (c2a-mid(O, P), $r$, "ne", 10),
    ((692, 1155), $y$, "w", 10),
    ((790, 1242), $x$, "s", 12),
  ))
})

// 图 2·14 终边在第三象限
#let fig-c2a-2-14(width: 420 * k) = px-canvas(420, 370, origin: (195, 275), width: width, (p, u) => {
  let O = (443, 413)
  let P = (232, 585)
  c2a-angfig(p, O, P, (208, 607), (200, 605, 635, 283), 25, (420, 385), (
    (P, $P$, "se", 11),
    (c2a-mid(O, P), $r$, "se", 10),
    ((232, 500), $y$, "w", 10),
    ((330, 413), $x$, "n", 11),
  ))
})

// 图 2·15 终边在第四象限
#let fig-c2a-2-15(width: 420 * k) = px-canvas(420, 360, origin: (645, 275), width: width, (p, u) => {
  let O = (673, 410)
  let P = (883, 577)
  c2a-angfig(p, O, P, (930, 612), (650, 1055, 625, 285), 25, (646, 385), (
    (P, $P$, "sw", 12),
    (c2a-mid(O, P), $r$, "sw", 10),
    ((883, 490), $y$, "e", 10),
    ((776, 410), $x$, "n", 11),
  ), ol: "sw")
})

// 图 2·16 终边上一点 P(−4, −3)，r = 5
#let fig-c2a-2-16(width: 470 * k) = px-canvas(470, 410, origin: (185, 455), width: width, (p, u) => {
  let O = (516, 616)
  let P = (245, 826)
  c2a-angfig(p, O, P, (213, 851), (188, 650, 860, 465), 25, (497, 588), (
    (P, $P$, "se", 12),
    (c2a-mid(O, P), $5$, "se", 10),
    ((245, 720), $-3$, "w", 14),
    ((362, 616), $-4$, "n", 11),
  ))
})
