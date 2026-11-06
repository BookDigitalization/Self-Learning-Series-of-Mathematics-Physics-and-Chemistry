// 单元检查题（第 4～5 章）的三幅附图（原书 p.158、p.159）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568）。
#import "/common/series.typ": *

#let _mk = (end: "stealth", fill: black, scale: 0.45)

// 第 2 题 (5)（p.158）：某同学作的 v-t 图（原点取 (340, 440)）
#let fig-unit-2-5(width: 5.4cm) = px-canvas(520, 500, origin: (340, 440), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(360, 733), p(830, 733), stroke: 0.9pt, mark: _mk)
  line(p(497, 905), p(497, 460), stroke: 0.9pt, mark: _mk)
  line(p(497, 733), p(580, 845), p(720, 845), p(655, 733), stroke: 1.5pt)
  lab(485, 470, $v$); lab(826, 752, $t$)
})

// 第 2 题 (6)（p.158）：四个 v-t 图（或 s-t 图）（原点取 (350, 1070)）
#let fig-unit-2-6(width: 12cm) = px-canvas(1060, 230, origin: (350, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let ax(xa, xb, y0, xv, ytop, ybot) = {
    line(p(xa, y0), p(xb, y0), stroke: 0.8pt, mark: _mk)
    line(p(xv, ybot), p(xv, ytop), stroke: 0.8pt, mark: _mk)
  }
  // (1) v = 常数
  ax(370, 568, 1238, 392, 1100, 1272)
  line(p(392, 1158), p(515, 1158), stroke: 1.6pt)
  lab(385, 1105, $v$); lab(562, 1252, $t$)
  // (2) 匀速一段后突然为零
  ax(625, 832, 1238, 652, 1100, 1272)
  line(p(652, 1158), p(715, 1158), stroke: 1.6pt)
  line(p(715, 1158), p(715, 1238), stroke: (thickness: 1.4pt, dash: "dashed"))
  line(p(715, 1238), p(830, 1238), stroke: 1.6pt)
  lab(640, 1105, $v$); lab(822, 1252, $t$)
  // (3) s-t：过原点的直线
  ax(915, 1092, 1238, 937, 1090, 1272)
  line(p(937, 1238), p(1013, 1100), stroke: 1.6pt)
  lab(920, 1098, $s$); lab(1085, 1252, $t$)
  // (4) s-t：折线
  ax(1170, 1352, 1238, 1195, 1100, 1272)
  line(p(1195, 1195), p(1240, 1157), p(1305, 1157), p(1318, 1238), stroke: 1.6pt)
  lab(1175, 1103, $s$); lab(1345, 1252, $t$)
})

// 第 3 题 (1)（p.159）：物体的运动轨迹图（原点取 (540, 130)）
#let fig-unit-3-1(width: 7cm) = px-canvas(640, 570, origin: (540, 130), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (x0, y0) = (818, 420)
  let k = 40.7
  let px(x) = x0 + x * k
  let py(y) = y0 - y * k
  line(p(565, y0), p(1120, y0), stroke: 0.8pt, mark: _mk)
  line(p(x0, 680), p(x0, 140), stroke: 0.8pt, mark: _mk)
  for v in (-6, -4, -2, 2, 4, 6) {
    line(p(px(v), y0 - 5), p(px(v), y0 + 5), stroke: 0.6pt)
    line(p(x0 - 5, py(v)), p(x0 + 5, py(v)), stroke: 0.6pt)
    lab(px(v), y0 + 20, if v < 0 { $-#str(-v)$ } else { str(v) })
    lab(x0 - 18, py(v), if v < 0 { $-#str(-v)$ } else { str(v) })
  }
  lab(x0 - 14, y0 + 20, $0$)
  lab(890, 152, text(font: fonts.song, size: 8.5pt)[$y$（千米）])
  lab(1150, 445, text(font: fonts.song, size: 8.5pt)[$x$（千米）])
  // 轨迹：O → 向南 → 向东 → 向北 → 向西
  line(p(px(0), py(0)), p(px(0), py(-4)), p(px(6), py(-4)), p(px(6), py(4)), p(px(-3), py(4)), p(px(-3), py(0)), stroke: 1.5pt)
})
