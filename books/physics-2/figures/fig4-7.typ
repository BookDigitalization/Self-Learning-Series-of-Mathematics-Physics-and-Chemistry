// 图 4·7（原书 p.130）体积不变时气体的压强和温度的关系图线（等体积线）。
// 坐标图，按数据重绘：t = 0 在 x = 380、每 °C 0.48 像素；P = 0 在 y = 373、每单位 23.5 像素（200 dpi 页面像素）。
// 原图横轴 182 处的刻度数字印得像 132，按表（91、182、273）取 182。
#import "/common/series.typ": *

#let fig-4-7(width: 7.6cm) = px-canvas(400, 260, origin: (150, 160), width: width, (p, u) => {
  import cetz.draw: *
  let gx = t => 380 + 0.48 * t
  let gy = P => 373 - 23.5 * P
  let it = s => text(size: 8.5pt, style: "italic", s)
  line(p(gx(-300), gy(0)), p(gx(400), gy(0)), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(gx(0), gy(0) + 0), p(gx(0), gy(7.6)), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(gx(0) + 38, gy(8.4)), text(size: 8.5pt)[#text(style: "italic")[P#sub[t]]（大气压）])
  content(p(gx(-300) - 8, gy(0) + 1), text(size: 8.5pt)[−#text(style: "italic")[t#sub[0]]])
  content(p(gx(430) + 14, gy(0) + 2), text(size: 8.5pt)[#text(style: "italic")[t#sub[0]]（°C）])
  for (t, s) in ((-273, [−273]), (-182, [−182]), (-91, [−91]), (0, [0]), (91, [91]), (182, [182]), (273, [273])) {
    content(p(gx(t), gy(0) + 12), text(size: 8pt, s))
  }
  // 虚线（延长部分）与实线
  line(p(gx(-273), gy(0)), p(gx(0), gy(3)), stroke: (thickness: 1.6pt, dash: (5pt, 3pt)))
  line(p(gx(0), gy(3)), p(gx(327), gy(3 + 327 / 91)), stroke: 1.8pt)
  // A、B、C 三点及竖线、竖排文字
  for (t, P, name, lab) in ((91, 4, "A", [4 大气压]), (182, 5, "B", [5 大气压]), (273, 6, "C", [6 大气压])) {
    line(p(gx(t), gy(P)), p(gx(t), gy(0)), stroke: 0.6pt)
    circle(p(gx(t), gy(P)), radius: 3, fill: white, stroke: 0.7pt)
    content(p(gx(t) - 5, gy(P) + 14), text(size: 9pt, style: "italic", name))
    content(p(gx(t) + 11, gy(0) - 38), angle: -90deg, text(size: 8pt, lab))
  }
  content(p(gx(0) + 14, gy(0) - 40), angle: -90deg, text(size: 8pt)[#text(style: "italic")[P#sub[0]]= 3 大气压])
  line(p(gx(0) + 5, gy(3) + 1), p(gx(0) + 5, gy(0) + 3), stroke: 0.5pt)
})
