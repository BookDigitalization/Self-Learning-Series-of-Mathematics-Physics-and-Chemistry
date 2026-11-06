// 书末插图（总复习题 p.514–519 的 19 幅附图 + 习题 9·6 第 4 题答案附图），全部用 CeTZ 重绘。
// 坐标是各图原位图的像素坐标（y 向下）。bk-r19、bk-r21 的坐标取自重新裁的原页图（原位图裁得不全）。
// 原图均为约 130 dpi 的线条图，重绘时位置、比例为目测近似，几何关系、字母、数字照原图。
#import "/common/series.typ": *
#import cetz.draw: *

#let T = 1.2pt           // 粗线
#let t = 0.7pt           // 细线
#let ar(s: 0.55) = (end: "stealth", fill: black, scale: s)
#let ar2(s: 0.5) = (start: (symbol: "stealth", fill: black, scale: s), end: (symbol: "stealth", fill: black, scale: s))
#let dashed = (dash: "dashed")
#let dd = 0.7pt + black
#let lab(p, x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
#let ptx(p, x, y) = p(x, y)

// 地面：横线 + 下方斜线
#let ground(p, x0, x1, y, step: 22, len: 14, w: T) = {
  line(p(x0, y), p(x1, y), stroke: w)
  let x = x0 + step * 0.6
  while x < x1 {
    line(p(x, y), p(x - len * 0.55, y + len), stroke: 0.6pt)
    x += step
  }
}
// 墙：竖线 + 左侧斜线
#let wall(p, x, y0, y1, step: 36, len: 18, w: T) = {
  line(p(x, y0), p(x, y1), stroke: w)
  let y = y0 + step * 0.5
  while y < y1 {
    line(p(x, y), p(x - len * 0.6, y + len), stroke: 0.6pt)
    y += step
  }
}
// 圆弧上的点（数学角度，y 向上）
#let arcpts(cx, cy, r, a0, a1, n: 24) = range(0, n + 1).map(i => {
  let a = a0 + (a1 - a0) * i / n
  (cx + r * calc.cos(a * 1deg), cy - r * calc.sin(a * 1deg))
})
#let arc-line(p, cx, cy, r, a0, a1, stroke: t, mark: none) = {
  let pts = arcpts(cx, cy, r, a0, a1)
  line(..pts.map(q => p(..q)), stroke: stroke, mark: mark)
}
// 斜线填充矩形（45°，向右上）
#let hatch-rect(p, x0, y0, x1, y1, step: 16) = {
  rect(p(x0, y0), p(x1, y1), stroke: T)
  let s = x0 + y0 + step
  while s < x1 + y1 {
    let xa = calc.max(x0, s - y1)
    let xb = calc.min(x1, s - y0)
    line(p(xa, s - xa), p(xb, s - xb), stroke: 0.6pt)
    s += step
  }
}
#let zigzag(p, x0, y0, x1, y1, n, amp) = {
  // 沿 (x0,y0)→(x1,y1) 的锯齿（弹簧）
  let dx = x1 - x0
  let dy = y1 - y0
  let len = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / len, dy / len)
  let (nx, ny) = (-uy, ux)
  let pts = ((x0, y0),)
  for i in range(0, n) {
    let f = (i + 0.5) / n
    let sgn = if calc.even(i) { 1 } else { -1 }
    pts.push((x0 + dx * f + nx * amp * sgn, y0 + dy * f + ny * amp * sgn))
  }
  pts.push((x1, y1))
  line(..pts.map(q => p(..q)), stroke: 0.9pt)
}
#let wdash(p, rows) = for (x0, x1, y) in rows { line(p(x0, y), p(x1, y), stroke: 0.9pt) }

// ───────── 总复习题 第 1 题 p.514 ─────────
#let bk-r1(width: 5.6cm) = px-canvas(670, 317, width: width, (p, u) => {
  line(p(15, 30), p(15, 285), p(32, 300), p(640, 300), p(655, 285), p(655, 30), stroke: T)
  line(p(170, 35), p(170, 245), p(185, 258), p(400, 258), p(415, 245), p(415, 40), stroke: T)
  line(p(15, 85), p(170, 85), stroke: t)
  line(p(415, 83), p(655, 83), stroke: t)
  wdash(p, ((60, 130, 100), (30, 80, 128), (110, 150, 128), (30, 90, 175), (60, 120, 205), (20, 70, 240), (60, 100, 275),
    (150, 240, 272), (300, 360, 272), (400, 470, 272), (500, 560, 272),
    (440, 500, 105), (530, 600, 110), (600, 640, 130), (450, 520, 150), (540, 580, 150), (600, 640, 165),
    (440, 490, 195), (500, 560, 200), (590, 640, 205), (450, 520, 240), (540, 600, 235)))
  rect(p(490, 40), p(585, 115), fill: white, stroke: none)
  hatch-rect(p, 490, 40, 585, 115, step: 18)
})

// ───────── 第 5 题 ─────────
#let bk-r5(width: 5cm) = px-canvas(612, 508, width: width, (p, u) => {
  line(p(30, 308), p(610, 305), stroke: T)
  wdash(p, ((50, 120, 325), (150, 190, 325), (350, 420, 325), (500, 580, 325),
    (100, 180, 345), (220, 280, 345), (350, 400, 345), (460, 520, 345), (570, 600, 345),
    (170, 230, 375), (280, 330, 375), (400, 450, 375), (520, 560, 375),
    (240, 300, 405), (350, 400, 405), (430, 500, 410), (320, 370, 432), (420, 460, 432), (550, 600, 432)))
  line(p(70, 150), p(70, 10), stroke: 1.8pt, mark: ar(s: 0.6))
  lab(p, 108, 52, $F$, size: 10pt)
  // 细棒：以 S→E 为轴，宽 30
  let (sx, sy) = (88, 168)
  let (ex, ey) = (515, 462)
  let (dx, dy) = (ex - sx, ey - sy)
  let l = calc.sqrt(dx * dx + dy * dy)
  let (nx, ny) = (-dy / l * 15, dx / l * 15)
  line(p(sx + nx, sy + ny), p(ex + nx, ey + ny), p(ex - nx, ey - ny), p(sx - nx, sy - ny),
    close: true, fill: white, stroke: 1.1pt)
  line(p(sx - nx, sy - ny), p(ex - nx, ey - ny), stroke: 1.8pt)
})

// ───────── 第 6 题 ─────────
#let bk-r6(width: 7cm) = px-canvas(855, 751, width: width, (p, u) => {
  line(p(15, 172), p(118, 172), stroke: 1.8pt, mark: ar(s: 0.6))
  lab(p, 62, 135, $P$, size: 10pt)
  rect(p(130, 160), p(445, 185), stroke: T)
  rect(p(430, 65), p(525, 155), stroke: T)
  wdash(p, ((450, 480, 90), (485, 510, 90), (445, 475, 115), (480, 510, 120), (450, 500, 140)))
  line(p(525, 65), p(565, 65), stroke: T)
  line(p(525, 150), p(565, 150), stroke: T)
  line(p(525, 108), p(700, 108), stroke: 1.5pt)
  lab(p, 160, 215, $A$, size: 10pt)
  lab(p, 480, 35, $B$, size: 10pt)
  lab(p, 690, 70, $C$, size: 10pt)
  circle(p(700, 108), radius: 5 * u, fill: black)
  circle(p(700, 212), radius: 5 * u, fill: black)
  lab(p, 740, 215, $D$, size: 10pt)
  line(p(700, 108), p(700, 580), stroke: 1.8pt)
  line(p(700, 580), p(655, 580), stroke: T)
  zigzag(p, 702, 468, 800, 468, 5, 14)
  line(p(808, 440), p(808, 495), stroke: 2pt)
  lab(p, 738, 590, $E$, size: 10pt)
  circle(p(485, 585), radius: 152 * u, stroke: 1.5pt)
  let outer = arcpts(485, 585, 168, -17, 17)
  let inner = arcpts(485, 585, 152, 17, -17)
  line(..(outer + inner).map(q => p(..q)), close: true, fill: luma(75%), stroke: 1pt)
  lab(p, 645, 662, $G$, size: 10pt)
  line(p(485, 585), p(361, 498), stroke: t, mark: ar(s: 0.5))
  lab(p, 455, 515, $R$, size: 9pt)
  lab(p, 492, 612, $O$, size: 10pt)
})

// ───────── 第 8 题 ─────────
#let bk-r8(width: 4cm) = px-canvas(578, 705, width: width, (p, u) => {
  wall(p, 70, 10, 690, step: 38, len: 20)
  line(p(70, 88), p(515, 340), stroke: t)
  let (bx, by) = (70, 590)
  let (ax, ay) = (515, 340)
  let (dx, dy) = (ax - bx, ay - by)
  let l = calc.sqrt(dx * dx + dy * dy)
  let (nx, ny) = (-dy / l * 6, dx / l * 6)
  line(p(bx + nx, by + ny), p(ax + nx, ay + ny), stroke: t)
  line(p(bx - nx, by - ny), p(ax - nx, ay - ny), stroke: t)
  line(p(ax + nx, ay + ny), p(ax - nx, ay - ny), stroke: t)
  line(p(68, 575), p(98, 584), p(70, 612), close: true, fill: black, stroke: none)
  arc-line(p, 70, 88, 52, -90, -30)
  arc-line(p, 70, 590, 55, 90, 30)
  lab(p, 108, 155, $alpha$, size: 10pt)
  lab(p, 115, 515, $alpha$, size: 10pt)
  lab(p, 97, 28, $C$, size: 11pt)
  lab(p, 540, 345, $A$, size: 11pt)
  lab(p, 32, 608, $B$, size: 11pt)
})

// ───────── 第 9 题（两幅） ─────────
#let bk-r9a(width: 4cm) = px-canvas(451, 254, width: width, (p, u) => {
  ground(p, 0, 440, 208, step: 28, len: 16, w: 1pt)
  rect(p(108, 182), p(290, 208), stroke: 1pt)
  line(p(20, 12), p(222, 182), stroke: 1.6pt, mark: ar(s: 0.6))
  line(p(20, 12), p(20, 118), stroke: (dash: "dashed", thickness: 0.8pt))
  arc-line(p, 20, 12, 62, -90, -40)
  lab(p, 52, 90, $alpha$, size: 10pt)
  lab(p, 165, 85, $F$, size: 10pt)
  lab(p, 322, 183, $m$, size: 9pt)
})
#let bk-r9b(width: 4.6cm) = px-canvas(521, 290, width: width, (p, u) => {
  ground(p, 20, 505, 272, step: 28, len: 16, w: 1pt)
  line(p(70, 272), p(505, 22), stroke: 1pt)
  let u = (calc.cos(30deg), -calc.sin(30deg))
  let nrm = (-calc.sin(30deg), -calc.cos(30deg))
  let (x0, y0) = (215, 188)
  let l = 190
  let h = 28
  let c1 = (x0, y0)
  let c2 = (x0 + l * u.at(0), y0 + l * u.at(1))
  let c3 = (c2.at(0) + h * nrm.at(0), c2.at(1) + h * nrm.at(1))
  let c4 = (x0 + h * nrm.at(0), y0 + h * nrm.at(1))
  line(p(..c1), p(..c2), p(..c3), p(..c4), close: true, fill: white, stroke: 1pt)
  lab(p, 325, 62, $m$, size: 9pt)
  line(p(70, 108), p(262, 108), stroke: 1.6pt, mark: ar(s: 0.6))
  lab(p, 138, 78, $F$, size: 10pt)
  arc-line(p, 70, 272, 90, 0, 30)
  lab(p, 178, 250, $alpha$, size: 10pt)
})

// ───────── 第 14 题 ─────────
#let bk-r14(width: 1.5cm) = px-canvas(162, 508, width: width, (p, u) => {
  line(p(80, 62), p(80, 10), stroke: 1.8pt, mark: ar(s: 0.7))
  line(p(80, 60), p(80, 505), stroke: 1.2pt)
  for (y0, y1) in ((90, 168), (285, 350), (430, 505)) {
    rect(p(28, y0), p(132, y1), fill: white, stroke: 1.4pt)
  }
  lab(p, 80, 130, $m_1$, size: 9pt)
  lab(p, 80, 318, $m_2$, size: 9pt)
  lab(p, 80, 470, $m_3$, size: 9pt)
  lab(p, 108, 22, $F$, size: 10pt)
  lab(p, 45, 255, $a$, size: 10pt)
  lab(p, 45, 400, $b$, size: 10pt)
})

// ───────── 第 16 题 ─────────
#let bk-r16(width: 7cm) = px-canvas(820, 520, width: width, (p, u) => {
  let sl(x0, y0, x1, y1) = {
    rect(p(x0, y0), p(x1, y1), fill: luma(88%), stroke: 1.2pt)
  }
  // 上图
  ground(p, 15, 520, 135, step: 26, len: 14, w: 1pt)
  sl(65, 80, 470, 132)
  lab(p, 270, 105, $M$, size: 10pt)
  rect(p(62, 15), p(130, 80), fill: white, stroke: 1.4pt)
  lab(p, 96, 48, $m$, size: 10pt)
  line(p(130, 48), p(212, 48), stroke: (dash: "dashed", thickness: 0.8pt), mark: ar(s: 0.5))
  lab(p, 236, 40, $F$, size: 10pt)
  // 下图
  ground(p, 215, 740, 330, step: 26, len: 14, w: 1pt)
  sl(270, 275, 680, 325)
  lab(p, 470, 300, $M$, size: 10pt)
  rect(p(270, 215), p(345, 275), stroke: (dash: "dashed", thickness: 0.8pt))
  rect(p(618, 215), p(680, 275), fill: white, stroke: 1.4pt)
  lab(p, 650, 245, $m$, size: 10pt)
  line(p(685, 245), p(765, 245), stroke: (dash: "dashed", thickness: 0.8pt), mark: ar(s: 0.5))
  lab(p, 790, 238, $F$, size: 10pt)
  // 位移标注
  line(p(60, 135), p(60, 515), stroke: 1.6pt)
  line(p(270, 215), p(270, 440), stroke: 1.6pt)
  line(p(620, 330), p(620, 515), stroke: 1.6pt)
  line(p(62, 425), p(268, 425), stroke: 0.8pt, mark: ar2())
  line(p(272, 383), p(618, 383), stroke: 0.8pt, mark: ar2())
  line(p(62, 487), p(618, 487), stroke: 0.8pt, mark: ar2())
  // 原图此三处字母印得很小、字形模糊，按文意（M 的位移、m 的位移、相对滑动距离 L）补成 x_M、x_m、L
  content(p(190, 408), anchor: "center", text(size: 9pt, fill: white, stroke: 3pt + white, $x_M$))
  content(p(190, 408), anchor: "center", text(size: 9pt, $x_M$))
  content(p(445, 366), anchor: "center", text(size: 9pt, fill: white, stroke: 3pt + white, $L$))
  content(p(445, 366), anchor: "center", text(size: 9pt, $L$))
  content(p(345, 470), anchor: "center", text(size: 9pt, fill: white, stroke: 3pt + white, $x_m$))
  content(p(345, 470), anchor: "center", text(size: 9pt, $x_m$))
})

// ───────── 第 17 题 ─────────
#let bk-r17(width: 6.4cm) = px-canvas(751, 728, width: width, (p, u) => {
  ground(p, 0, 745, 685, step: 26, len: 16, w: 1pt)
  // 轴线
  line(p(352, 5), p(352, 722), stroke: (dash: "dash-dotted", thickness: 0.7pt))
  // 漏斗形重块 ABCD
  line(p(100, 90), p(605, 95), p(448, 372), p(262, 372), close: true, stroke: 1.6pt)
  line(p(262, 378), p(448, 378), stroke: 1pt)
  // 两辆车
  for (x0, x1, wx) in ((52, 252, (92, 200)), (455, 655, (505, 603))) {
    rect(p(x0, 368), p(x1, 645), stroke: 1.4pt)
    for cx in wx { circle(p(cx, 660), radius: 12 * u, stroke: 1.2pt, fill: white) }
  }
  lab(p, 150, 515, $M$, size: 11pt)
  lab(p, 550, 510, $M$, size: 11pt)
  // 角度
  line(p(270, 378), p(352, 530), stroke: (dash: "dashed", thickness: 0.7pt))
  line(p(440, 378), p(352, 530), stroke: (dash: "dashed", thickness: 0.7pt))
  arc-line(p, 352, 530, 100, 90, 121)
  arc-line(p, 352, 530, 100, 90, 59)
  lab(p, 322, 420, $alpha$, size: 11pt)
  lab(p, 382, 432, $alpha$, size: 11pt)
  // h
  line(p(285, 380), p(285, 683), stroke: 0.8pt, mark: ar2())
  lab(p, 268, 545, $h$, size: 11pt)
  lab(p, 385, 188, $m$, size: 9pt)
  lab(p, 65, 90, $A$, size: 12pt)
  lab(p, 632, 95, $D$, size: 12pt)
  lab(p, 215, 410, $B$, size: 11pt)
  lab(p, 478, 410, $C$, size: 11pt)
})

// ───────── 第 18 题 ─────────
#let bk-r18(width: 7.4cm) = px-canvas(981, 474, width: width, (p, u) => {
  line(p(35, 442), p(965, 442), stroke: 1.6pt)
  // 山坡
  line(p(30, 58), p(945, 445), stroke: 1pt)
  // 弹道（抛物线）
  let a = 295 / calc.pow(675, 2)
  let pts = range(0, 41).map(i => {
    let x = 85 + 675 * i / 40
    (x, 80 + a * calc.pow(x - 85, 2))
  })
  line(..pts.map(q => p(..q)), stroke: 1.6pt)
  line(p(85, 76), p(355, 76), stroke: 1.2pt, mark: ar(s: 0.5))
  lab(p, 405, 78, $v_1$, size: 11pt)
  lab(p, 95, 40, $A$, size: 12pt)
  lab(p, 800, 350, $B$, size: 12pt)
  line(p(75, 366), p(760, 376), stroke: (dash: "dashed", thickness: 0.8pt))
  line(p(80, 80), p(80, 364), stroke: 0.9pt, mark: ar2())
  lab(p, 62, 230, $h$, size: 11pt)
  arc-line(p, 945, 445, 72, 157, 180)
  lab(p, 825, 428, $alpha$, size: 11pt)
})

// ───────── 第 19 题（坐标取自重裁的原页图 600×480）─────────
#let bk-r19(width: 6.4cm) = px-canvas(600, 480, width: width, (p, u) => {
  ground(p, 85, 545, 437, step: 24, len: 16, w: 1.6pt)
  line(p(100, 40), p(100, 425), stroke: 1.8pt)
  line(p(100, 425), p(485, 425), stroke: (dash: "dashed", thickness: 0.9pt))
  lab(p, 68, 440, $O$, size: 11pt)
  for (y, m) in ((42, $m_1$), (178, $m_2$), (303, $m_3$)) {
    circle(p(100, y), radius: 14 * u, fill: white, stroke: 1.2pt)
    line(p(92, y + 8), p(108, y - 8), stroke: 0.7pt)
    lab(p, 62, y, m, size: 9pt)
  }
  for x in (225, 345, 483) { circle(p(x, 425), radius: 10 * u, fill: white, stroke: 1pt) }
  // 三条圆弧轨迹（圆心 O）
  for (r, a-mid, w) in ((383, 42, 1.3pt), (247, 45, 0.9pt), (122, 48, 0.7pt)) {
    arc-line(p, 100, 425, r, 6, 87, stroke: w)
    let (x1, y1) = (100 + r * calc.cos(a-mid * 1deg), 425 - r * calc.sin(a-mid * 1deg))
    let (x2, y2) = (100 + r * calc.cos((a-mid - 2) * 1deg), 425 - r * calc.sin((a-mid - 2) * 1deg))
    line(p(x1, y1), p(x2, y2), stroke: 1pt, mark: ar(s: 0.5))
  }
  lab(p, 128, 92, $display(L / 3)$, size: 10pt)
  lab(p, 128, 232, $display(L / 3)$, size: 10pt)
  lab(p, 128, 360, $display(L / 3)$, size: 10pt)
})

// ───────── 第 21 题（坐标取自重裁的原页图）─────────
#let bk-r21(width: 3.6cm) = px-canvas(400, 540, width: width, (p, u) => {
  // 以下坐标：悬点 (170,40)，摆长 430（到球心）
  let (ox, oy) = (170, 40)
  line(p(ox - 28, oy), p(ox + 28, oy), stroke: 1.2pt)
  for i in range(0, 6) { line(p(ox - 24 + i * 9, oy), p(ox - 18 + i * 9, oy - 9), stroke: 0.6pt) }
  line(p(ox, oy), p(ox, 430), stroke: 1.8pt)
  circle(p(ox, 470), radius: 42 * u, stroke: 1.2pt)
  lab(p, ox, 470, $M$, size: 11pt)
  let ang = 20.5deg
  let (gx, gy) = (ox + 430 * calc.sin(ang), oy + 430 * calc.cos(ang))
  circle(p(gx, gy), radius: 42 * u, stroke: 1.2pt)
  line(p(ox, oy), p(gx - 41 * calc.sin(ang), gy - 41 * calc.cos(ang)), stroke: (dash: "dashed", thickness: 0.9pt))
  arc-line(p, ox, oy, 95, -90, -69.5)
  lab(p, ox + 20, oy + 110, $alpha$, size: 10pt)
  lab(p, ox - 40, 295, $L$, size: 11pt)
  line(p(8, 478), p(92, 478), stroke: 1.2pt, mark: ar(s: 0.5))
  lab(p, 22, 455, $m$, size: 9pt)
  lab(p, 82, 448, $v$, size: 9pt)
})

// ───────── 第 23 题 ─────────
#let bk-r23(width: 8cm) = px-canvas(936, 290, width: width, (p, u) => {
  arc-line(p, 270, 22, 216, 180, 270, stroke: 1.4pt)
  // 圆弧外侧斜线
  for a in range(184, 268, step: 7) {
    let (x0, y0) = (270 + 216 * calc.cos(a * 1deg), 22 - 216 * calc.sin(a * 1deg))
    line(p(x0, y0), p(x0 - 13, y0 + 5), stroke: 0.6pt)
  }
  ground(p, 270, 925, 238, step: 24, len: 14, w: 1.4pt)
  line(p(55, 22), p(250, 22), stroke: (dash: "dashed", thickness: 0.8pt))
  rect(p(250, 24), p(272, 47), fill: white, stroke: 1pt)
  line(p(270, 47), p(270, 238), stroke: (dash: "dashed", thickness: 0.8pt))
  lab(p, 28, 22, $Q$, size: 10pt)
  lab(p, 292, 128, $R$, size: 9pt)
  for (x, n) in ((368, $1$), (425, $2$), (483, $3$), (540, $4$), (755, $n$)) {
    circle(p(x, 227), radius: 4 * u, fill: black, stroke: none)
    lab(p, x, 262, n, size: 9pt)
  }
})

// ───────── 第 26 题 ─────────
#let bk-r26(width: 3.8cm) = px-canvas(520, 566, width: width, (p, u) => {
  catmull(p(268, 10), p(180, 100), p(130, 200), p(112, 290), p(150, 380), p(260, 450), p(380, 538), stroke: 1.5pt, tension: 0.5)
  catmull(p(305, 14), p(215, 130), p(180, 230), p(190, 320), p(245, 395), p(330, 445), p(410, 490), stroke: 1.5pt, tension: 0.5)
  catmull(p(290, 12), p(165, 190), p(140, 290), p(165, 370), p(260, 435), p(400, 505), stroke: (dash: "dashed", thickness: 0.8pt), tension: 0.5)
  line(p(400, 505), p(445, 528), stroke: 1.4pt, mark: ar(s: 0.6))
  lab(p, 355, 14, $v_1$, size: 10pt)
  lab(p, 495, 542, $v_2$, size: 10pt)
  // 弯角 α
  line(p(30, 322), p(105, 355), stroke: (dash: "dash-dotted", thickness: 0.7pt))
  line(p(52, 372), p(90, 328), stroke: (dash: "dash-dotted", thickness: 0.7pt))
  arc-line(p, 68, 346, 50, 40, -50)
  lab(p, 142, 320, $alpha$, size: 10pt)
})

// ───────── 第 27 题 ─────────
#let bk-r27(width: 6.4cm) = px-canvas(785, 635, width: width, (p, u) => {
  let (cx, cy) = (445, 395)
  lab(p, 175, 45, $M = m_1 + m_2 + m_3$, size: 10pt)
  // 铀核（不规则圆）
  circle(p(430, 62), radius: 52 * u, stroke: 1.6pt)
  line(p(135, 395), p(765, 395), stroke: (dash: "dash-dotted", thickness: 0.8pt))
  // v1
  line(p(cx + 30 * 0.5, cy - 30 * 0.866), p(612, 122), stroke: 1.8pt, mark: ar(s: 0.6))
  lab(p, 640, 118, $v_1$, size: 10pt)
  circle(p(478, 350), radius: 17 * u, fill: white, stroke: 1.6pt)
  lab(p, 450, 298, $m_1$, size: 9pt)
  // v2
  line(p(cx + 30 * 0.5, cy + 30 * 0.866), p(552, 565), stroke: 1.8pt, mark: ar(s: 0.6))
  lab(p, 580, 585, $v_2$, size: 10pt)
  circle(p(488, 438), radius: 15 * u, fill: white, stroke: 1.6pt)
  lab(p, 540, 418, $m_2$, size: 9pt)
  // v3
  line(p(402, 395), p(340, 395), stroke: 1.8pt, mark: ar(s: 0.6))
  lab(p, 308, 357, $v_3$, size: 10pt)
  circle(p(425, 392), radius: 17 * u, fill: white, stroke: 1.6pt)
  lab(p, 375, 422, $m_3$, size: 9pt)
  // 角度
  arc-line(p, cx, cy, 152, 0, 60)
  arc-line(p, cx, cy, 185, 0, -60)
  lab(p, 622, 305, $60 degree$, size: 9pt)
  lab(p, 645, 457, $60 degree$, size: 9pt)
})

// ───────── 第 28 题 ─────────
#let bk-r28(width: 5.6cm) = px-canvas(682, 567, width: width, (p, u) => {
  ground(p, 35, 670, 530, step: 22, len: 14, w: 1.6pt)
  line(p(62, 28), p(62, 530), stroke: 1.6pt)
  let a = 1.7e-3
  let pts = range(0, 41).map(i => {
    let y = 28 + (530 - 28) * i / 40
    (62 + calc.sqrt((y - 28) / a), y)
  })
  line(..pts.map(q => p(..q)), stroke: 1.4pt)
  line(p(62, 30), p(250, 30), stroke: 1.2pt, mark: ar(s: 0.5))
  lab(p, 300, 40, $v_1$, size: 10pt)
  let xa = 62 + calc.sqrt((240 - 28) / a)
  let xb = 62 + calc.sqrt((388 - 28) / a)
  line(p(62, 240), p(xa, 240), stroke: (dash: "dashed", thickness: 0.8pt))
  line(p(62, 388), p(xb, 388), stroke: (dash: "dashed", thickness: 0.8pt))
  circle(p(xa, 240), radius: 5 * u, fill: black)
  circle(p(xb, 388), radius: 5 * u, fill: black)
  lab(p, xa + 38, 232, $A'$, size: 10pt)
  lab(p, xb + 38, 385, $B'$, size: 10pt)
  lab(p, 28, 243, $A$, size: 10pt)
  lab(p, 28, 405, $B$, size: 10pt)
  lab(p, 40, 322, $h$, size: 10pt)
})

// ───────── 第 29 题 ─────────
#let bk-r29(width: 6.4cm) = px-canvas(774, 254, width: width, (p, u) => {
  ground(p, 10, 760, 240, step: 24, len: 14, w: 1.4pt)
  let pts = range(0, 41).map(i => {
    let x = 62 + (650 - 62) * i / 40
    (x, 240 - 222 * (1 - calc.pow((x - 356) / 294, 2)))
  })
  line(..pts.map(q => p(..q)), stroke: 1.4pt)
  line(p(20, 68), p(690, 68), stroke: (dash: "dashed", thickness: 0.8pt))
  line(p(20, 143), p(690, 143), stroke: (dash: "dashed", thickness: 0.8pt))
  line(p(150, 108), p(165, 88), stroke: 1.4pt, mark: ar(s: 0.5))
  line(p(380, 18), p(400, 18), stroke: 1.4pt, mark: ar(s: 0.5))
  line(p(645, 69), p(645, 142), stroke: 0.9pt, mark: ar2())
  lab(p, 673, 106, $h$, size: 10pt)
  lab(p, 120, 172, $A$, size: 10pt)
  lab(p, 555, 175, $A'$, size: 10pt)
  lab(p, 192, 44, $B$, size: 10pt)
  lab(p, 530, 44, $B'$, size: 10pt)
})

// ───────── 第 33 题（两幅并排）─────────
#let bk-r33(width: 11cm) = px-canvas(1328, 324, width: width, (p, u) => {
  // 左：竖直悬挂的弹簧
  line(p(45, 40), p(215, 40), stroke: (dash: "dashed", thickness: 0.8pt))
  line(p(330, 38), p(375, 38), stroke: 1pt)
  line(p(15, 187), p(355, 187), stroke: (dash: "dashed", thickness: 0.8pt))
  line(p(215, 287), p(355, 287), stroke: (dash: "dashed", thickness: 0.8pt))
  zigzag(p, 180, 40, 180, 187, 6, 13)
  zigzag(p, 345, 38, 345, 287, 6, 13)
  line(p(75, 41), p(75, 186), stroke: 0.8pt, mark: ar2())
  lab(p, 55, 110, $L_0$, size: 10pt)
  line(p(232, 188), p(232, 286), stroke: 0.8pt, mark: ar2())
  lab(p, 190, 250, $display(L_0 / 2)$, size: 10pt)
  // 右：光滑水平面内作圆周运动
  line(p(855, 50), p(1310, 52), p(1190, 330), p(715, 330), close: true, stroke: 1.4pt)
  let ep = range(0, 49).map(i => {
    let a = 360 * i / 48
    (1020 + 165 * calc.cos(a * 1deg), 185 - 85 * calc.sin(a * 1deg))
  })
  line(..ep.map(q => p(..q)), stroke: (dash: "dashed", thickness: 1.1pt))
  line(p(1050, 98), p(1000, 98), stroke: 1pt, mark: ar(s: 0.5))
  zigzag(p, 1018, 183, 1140, 120, 6, 8)
  lab(p, 988, 185, $O$, size: 11pt)
  lab(p, 1118, 152, $B$, size: 11pt)
})

// ───────── 第 35 题 ─────────
#let bk-r35(width: 6.4cm) = px-canvas(809, 497, width: width, (p, u) => {
  // 铜杆 AB（斜线填充）
  hatch-rect(p, 50, 125, 770, 165, step: 24)
  // 铜环
  rect(p(160, 70), p(195, 225), fill: white, stroke: 1.2pt)
  for y in range(95, 225, step: 24) { line(p(168, y), p(188, y), stroke: 0.6pt) }
  rect(p(495, 68), p(578, 225), fill: white, stroke: 1.2pt)
  for y in range(95, 225, step: 24) { line(p(503, y), p(570, y), stroke: 0.6pt) }
  // 转轴
  rect(p(385, 165), p(410, 470), fill: luma(30%), stroke: none)
  line(p(398, 15), p(398, 125), stroke: 0.8pt)
  line(p(195, 15), p(195, 70), stroke: 0.8pt)
  line(p(492, 15), p(492, 68), stroke: 0.8pt)
  line(p(197, 42), p(396, 42), stroke: 0.8pt, mark: ar2(s: 0.4))
  line(p(400, 42), p(490, 42), stroke: 0.8pt, mark: ar2(s: 0.4))
  lab(p, 322, 60, $l_1$, size: 10pt)
  lab(p, 455, 58, $l_2$, size: 10pt)
  lab(p, 158, 24, $m_1$, size: 9pt)
  lab(p, 532, 24, $m_2$, size: 9pt)
  lab(p, 26, 160, $A$, size: 11pt)
  lab(p, 750, 148, $B$, size: 11pt)
  lab(p, 365, 190, $O$, size: 11pt)
  lab(p, 368, 478, $C$, size: 11pt)
  // 旋转箭头 ω
  catmull(p(330, 322), p(355, 340), p(390, 346), p(425, 340), p(447, 330), stroke: 0.9pt, tension: 0.5)
  line(p(438, 335), p(450, 328), stroke: 0.9pt, mark: ar(s: 0.5))
  lab(p, 480, 322, $omega$, size: 10pt)
})

// ───────── 习题 9·6 答案第 4 题 ─────────
#let bk-a9-6(width: 4.6cm) = px-canvas(705, 624, width: width, (p, u) => {
  line(p(65, 440), p(410, 70), stroke: 2pt)
  line(p(248, 258), p(248, 322), stroke: 1.2pt)
  line(p(248, 322), p(605, 322), stroke: 2pt)
  line(p(362, 322), p(365, 520), stroke: 2pt, mark: ar(s: 0.8))
  for (x, y) in ((65, 440), (410, 70), (605, 322)) { circle(p(x, y), radius: 6 * u, fill: black) }
  lab(p, 42, 400, $A$, size: 11pt)
  lab(p, 358, 62, $B$, size: 11pt)
  lab(p, 232, 355, $C$, size: 11pt)
  lab(p, 362, 292, $E$, size: 11pt)
  lab(p, 612, 365, $D$, size: 11pt)
  lab(p, 365, 572, $G$, size: 11pt)
  content(p(28, 468), anchor: "center", text(font: fonts.song, size: 12pt, [甲]))
  content(p(440, 28), anchor: "center", text(font: fonts.song, size: 12pt, [乙]))
  content(p(655, 300), anchor: "center", text(font: fonts.song, size: 12pt, [丙]))
})
