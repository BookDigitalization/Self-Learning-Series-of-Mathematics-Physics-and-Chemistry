// 复习题八、单元检查题（第 6～8 章）附图（原书 p.234–237），均用 CeTZ 重绘（单元检查题第 6 题为位图 + 文字补回）。
// 坐标是各页显示图坐标（各图自己的 origin），y 向下；形状按原图描，尺寸为目测近似。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.45)

#let ground(p, x0, x1, y, step: 12, h: 14) = {
  import cetz.draw: *
  line(p(x0, y), p(x1, y), stroke: 0.9pt)
  let n = calc.floor((x1 - x0) / step)
  for k in range(0, n) {
    let x = x0 + k * step
    line(p(x, y + h), p(x + step * 0.7, y + 1), stroke: 0.6pt)
  }
}

// 复习题八 第 4 题（p.234）
#let fig-rev-8-4(width: 7cm) = px-canvas(500, 170, width: width, origin: (860, 785), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  ground(p, 872, 1278, 935, step: 13, h: 12)
  rect(p(982, 862), p(1150, 935), stroke: 0.9pt)
  rect(p(1015, 795), p(1115, 862), stroke: 0.9pt)
  m(1062, 830, $m_1$)
  m(1065, 903, $m_2$)
  m(997, 827, $A$)
  m(957, 903, $B$)
  line(p(1150, 892), p(1310, 892), stroke: 1pt, mark: arr)
  m(1325, 888, $F$)
})

// 复习题八 第 5 题（p.235）
#let fig-rev-8-5(width: 8cm) = px-canvas(540, 260, width: width, origin: (395, 450), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  ground(p, 400, 915, 705, step: 13, h: 12)
  // 两个斜坡
  line(p(442, 705), p(742, 512), stroke: 1.1pt)
  line(p(742, 512), p(848, 705), stroke: 1.1pt)
  line(p(490, 705), p(754, 536), stroke: 0.9pt)
  line(p(754, 536), p(820, 655), stroke: 0.9pt)
  // 滑轮
  circle(p(742, 483), radius: 28 * u, stroke: 0.9pt, fill: white)
  // 物体 m_1、m_2
  line(p(510, 661), p(450, 562), p(525, 520), p(582, 620), close: true, stroke: 0.9pt)
  line(p(792, 603), p(865, 562), p(898, 612), p(822, 653), close: true, stroke: 0.9pt)
  m(520, 598, $m_1$)
  m(845, 607, $m_2$)
  // 细线
  line(p(553, 570), p(716, 466), stroke: 0.8pt)
  line(p(768, 495), p(828, 583), stroke: 0.8pt)
  // 角
  m(565, 683, $alpha_1 = 30°$)
  m(745, 679, $alpha_2 = 60°$)
})

// 复习题八 第 6 题（p.235）
#let fig-rev-8-6(width: 6.5cm) = px-canvas(430, 600, width: width, origin: (970, 150), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(1078, 157), p(1170, 157), stroke: 0.9pt)
  for k in range(0, 8) {
    let x = 1080 + k * 12
    line(p(x + 8, 157), p(x, 167), stroke: 0.6pt)
  }
  rect(p(1118, 160), p(1133, 290), stroke: 0.9pt, radius: 7 * u)
  circle(p(1126, 284), radius: 92 * u, stroke: 0.9pt)
  line(p(1034, 284), p(1034, 683), stroke: 1.1pt)
  line(p(1218, 284), p(1218, 470), stroke: 1.1pt)
  rect(p(1002, 683), p(1067, 742), stroke: 0.9pt)
  rect(p(1183, 470), p(1250, 520), stroke: 0.9pt)
  // 圆环 m（两侧小块）
  rect(p(1150, 455), p(1203, 468), stroke: 0.9pt)
  rect(p(1230, 455), p(1278, 468), stroke: 0.9pt)
  // 虚线：下降后的位置
  line(p(1218, 520), p(1218, 680), stroke: (thickness: 0.8pt, dash: "dashed"))
  rect(p(1183, 680), p(1252, 738), stroke: (thickness: 0.8pt, dash: "dashed"))
  rect(p(1118, 625), p(1200, 640), stroke: (thickness: 0.8pt, dash: "dashed"))
  rect(p(1230, 620), p(1285, 640), stroke: (thickness: 0.8pt, dash: "dashed"))
  line(p(1355, 458), p(1355, 615), stroke: 1pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  m(1372, 545, $h$)
  m(1033, 712, $m_1$)
  m(1216, 494, $m_2$)
  m(980, 722, $A$)
  m(1160, 510, $B$)
  m(1140, 453, $C$)
  m(1296, 453, $m$)
  m(1318, 647, $D$)
})

// 复习题八 第 8 题（p.235）
#let fig-rev-8-8(width: 8.5cm) = px-canvas(620, 170, width: width, origin: (620, 1140), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(632, 1155), p(632, 1290), stroke: 1.2pt)
  for k in range(0, 10) {
    let y = 1160 + k * 13
    line(p(632, y + 8), p(622, y + 18), stroke: 0.6pt)
  }
  ground(p, 630, 1160, 1290, step: 13, h: 11)
  line(p(632, 1175), p(917, 1175), stroke: 0.9pt)
  circle(p(917, 1223), radius: 50 * u, stroke: 0.9pt)
  line(p(917, 1273), p(737, 1273), stroke: 0.9pt)
  rect(p(695, 1250), p(737, 1290), stroke: 0.9pt)
  m(716, 1270, $m_2$)
  line(p(1028, 1223), p(920, 1223), stroke: 0.8pt, mark: arr)
  rect(p(1028, 1153), p(1108, 1288), stroke: 0.9pt)
  for k in range(0, 16) {
    let y = 1288 - k * 9
    line(p(1029, y), p(1107, y - 22), stroke: 0.4pt)
  }
  rect(p(1048, 1204), p(1090, 1232), fill: white, stroke: none)
  m(1070, 1218, $m_1$)
  line(p(1108, 1220), p(1215, 1220), stroke: 0.9pt, mark: arr)
  m(1185, 1193, $F$)
  m(808, 1153, $A$)
})

// 单元检查题 第 5 题（p.236）
#let fig-unit-8-5(width: 4.5cm) = px-canvas(290, 200, width: width, origin: (385, 1445), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(410, 1589), p(605, 1589), stroke: 1pt)
  rect(p(470, 1493), p(540, 1587), stroke: 0.9pt)
  rect(p(487, 1457), p(525, 1494), stroke: 0.9pt)
  m(547, 1470, $m$)
  m(565, 1533, $M$)
  m(398, 1583, $P$)
  line(p(620, 1600), p(620, 1560), stroke: 0.9pt, mark: arr)
  m(642, 1585, $a$)
})

// 单元检查题 第 6 题（p.236）：位图（rev8-u6.png，已涂去 m_1 m_2 m_3）+ 文字
// 像素坐标：(显示图 x-940)×2.1314，(y-1085)×2.1314。
#let fig-unit-8-6(width: 5.5cm) = px-canvas(747, 1205, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev8-u6.png", width: 747 * u))
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  m(230, 356, $m_2$)
  m(627, 486, $m_1$)
  m(358, 497, $m_3$)
})

// 单元检查题 第 8 题（p.237）
#let fig-unit-8-8(width: 4.5cm) = px-canvas(260, 490, width: width, origin: (1100, 230), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(1200, 240), p(1315, 240), stroke: 0.9pt)
  for k in range(0, 9) {
    let x = 1202 + k * 12
    line(p(x + 8, 240), p(x, 250), stroke: 0.6pt)
  }
  circle(p(1260, 298), radius: 48 * u, stroke: 0.9pt)
  line(p(1212, 298), p(1218, 437), stroke: 1pt)
  line(p(1308, 298), p(1305, 705), stroke: 1pt)
  line(p(1218, 437), p(1150, 475), stroke: 0.9pt)
  line(p(1218, 437), p(1285, 475), stroke: 0.9pt)
  rect(p(1150, 475), p(1285, 678), stroke: 0.9pt)
  m(1125, 583, $M$)
  // 人
  circle(p(1257, 575), radius: 5 * u, stroke: 0.8pt)
  line(p(1257, 580), p(1257, 620), stroke: 0.8pt)
  line(p(1257, 620), p(1243, 672), stroke: 0.8pt)
  line(p(1257, 620), p(1271, 672), stroke: 0.8pt)
  line(p(1257, 598), p(1305, 588), stroke: 0.8pt)
  m(1230, 607, $m$)
})
