// 第 4 章插图（原书 p.133–175）。坐标取自 200 dpi 页面（crop-view 叠网格图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let c4k = 0.0125cm   // 200 dpi 页面 1 像素对应的排版长度（约为原图 1.1 倍）

#let c4-sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let c4-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 点 c 在直线 ab 上的垂足
#let c4-foot(a, b, c) = {
  let d = c4-sub(b, a)
  let w = c4-sub(c, a)
  let t = (w.at(0) * d.at(0) + w.at(1) * d.at(1)) / (d.at(0) * d.at(0) + d.at(1) * d.at(1))
  c4-lerp(a, b, t)
}

// 图 4·1（p.134）两角和的正弦、余弦
#let fig-c4-4-1(width: 340 * c4k) = px-canvas(340, 320, origin: (690, 300), width: width, (p, u) => {
  import cetz.draw: *
  let O = (706, 548)
  let A = (1025, 548)
  let B = (1018, 445)
  let C = (880, 330)
  let D = (C.at(0), O.at(1))
  let E = c4-foot(O, B, C)
  let F = (E.at(0), O.at(1))
  let G = (C.at(0), E.at(1))
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, C)
  seg(p, C, D)
  seg(p, C, E)
  seg(p, E, F)
  seg(p, G, E)
  rtmark(p, D, C, A, s: 10)
  rtmark(p, E, C, B, s: 10)
  anglearc(p, O, A, B, 46)
  anglearc(p, O, B, C, 30)
  anglearc(p, C, D, E, 34)
  content(p(752, 538), tsm($alpha$))
  content(p(745, 515), tsm($beta$))
  content(p(889, 386), tsm($alpha$))
  lbl(p, O, $O$, dir: "w", d: 12)
  lbl(p, A, $A$, dir: "s", d: 18)
  lbl(p, B, $B$, dir: "se", d: 18)
  lbl(p, C, $C$, dir: "n", d: 13)
  lbl(p, D, $D$, dir: "s", d: 16)
  lbl(p, E, $E$, dir: "se", d: 16)
  lbl(p, F, $F$, dir: "s", d: 16)
  lbl(p, G, $G$, dir: "w", d: 14)
})

// 图 4·2（p.169）y = 2√3 sin(x − π/6) 的图像：按真实函数采样。
// 原图量得：x 轴 y = 525，曲线零点 x ≈ 400、603、805（一个周期 405 像素），极值 ±220 像素；
// y 轴在 x ≈ 568，另一条竖线（平移后的位置）在 x ≈ 603 处，两条竖线顶端都带箭头。
#let fig-c4-4-2(width: 650 * c4k) = px-canvas(650, 560, origin: (350, 225), width: width, (p, u) => {
  import cetz.draw: *
  let y0 = 525
  let per = 405
  let x1 = 602.5             // 曲线上升零点
  let xo = x1 - per / 12     // 原点（π/6 = 周期的 1/12）
  let amp = 2 * calc.sqrt(3) * per / (2 * calc.pi)   // 与横轴同一单位长
  line(p(365, y0), p(975, y0), stroke: lw, mark: arw)
  line(p(xo, 772), p(xo, 235), stroke: lw, mark: arw)
  line(p(x1, 772), p(x1, 235), stroke: lw, mark: arw)
  let pts = range(0, 101).map(i => {
    let t = i / 100
    let x = x1 - per / 2 + t * per
    (x, y0 - amp * calc.sin((x - x1) / per * 2 * calc.pi))
  })
  line(..pts.map(q => p(..q)), stroke: lw)
  content(p(xo - 14, y0 + 16), tt($O$))
  content(p(xo + 18, 242), tt($y$))
  content(p(985, y0 + 18), tt($x$))
})

// 图 4·3（p.173）各个公式间的关系：流程框图，坐标取自 200 dpi 页面。T_{α−β} 原图下标印作“θ”形，按文意录作 β。
#let fig-c4-4-3(width: 800 * c4k) = px-canvas(800, 470, origin: (270, 1020), width: width, (p, u) => {
  import cetz.draw: *
  let bx(x0, y0, x1, y1, body) = {
    rect(p(x0, y0), p(x1, y1), stroke: lb)
    content(p((x0 + x1) / 2, (y0 + y1) / 2), tt(body))
  }
  let t(x, y, body) = content(p(x, y), tt(body))
  let ar(a, b) = line(p(..a), p(..b), stroke: lw, mark: arw)
  bx(283, 1027, 380, 1077, $T_(alpha - beta)$)
  bx(509, 1027, 603, 1077, $T_(alpha + beta)$)
  bx(733, 1027, 830, 1077, $T_(2 alpha)$)
  bx(960, 1030, 1057, 1080, $T_(alpha/2)$)
  bx(283, 1132, 380, 1228, [$S_(alpha - beta)$ \ $C_(alpha - beta)$])
  bx(509, 1132, 603, 1228, [$S_(alpha + beta)$ \ $C_(alpha + beta)$])
  bx(733, 1132, 830, 1228, [$S_(2 alpha)$ \ $C_(2 alpha)$])
  bx(960, 1132, 1057, 1228, [$S_(alpha/2)$ \ $C_(alpha/2)$])
  bx(323, 1335, 571, 1477, [$S C$ \ $C S$ \ $C C$ \ $S S$])
  bx(675, 1335, 770, 1479, [$S + S$ \ $S - S$ \ $C + C$ \ $C - C$])
  ar((509, 1053), (380, 1053))
  ar((603, 1053), (733, 1053))
  ar((509, 1180), (380, 1180))
  ar((603, 1180), (733, 1180))
  ar((830, 1181), (960, 1181))
  ar((555, 1132), (555, 1077))
  ar((1010, 1132), (1010, 1080))
  ar((332, 1228), (332, 1328))
  ar((557, 1228), (557, 1328))
  ar((571, 1407), (670, 1407))
  t(445, 1035, [以 $-beta$ 代 $beta$])
  t(668, 1035, [当 $alpha = beta$ 时])
  t(445, 1160, [以 $-beta$ 代 $beta$])
  t(668, 1160, [当 $alpha = beta$ 时])
  t(895, 1150, [以 $alpha/2$ 代 $alpha$])
  t(580, 1103, [相除])
  t(1043, 1103, [相除])
  t(440, 1255, [$alpha plus.minus beta$ 的同名函数])
  t(443, 1305, [相加与相减])
  t(622, 1390, [变形])
})
