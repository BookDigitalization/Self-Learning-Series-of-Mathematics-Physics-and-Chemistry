// 图 4·4（原书 p.124）气体的体积和温度的关系图线（等压线）。
// 坐标图，按数据重绘：t = 0 在 x = 185、每 °C 0.645 像素；V = 0 在 y = 1021、每单位 30.4 像素（200 dpi 页面像素）。
#import "/common/series.typ": *

#let fig-4-4(width: 6.6cm) = px-canvas(400, 320, origin: (120, 735), width: width, (p, u) => {
  import cetz.draw: *
  let gx = t => 185 + 0.645 * t
  let gy = V => 1021 - 30.4 * V
  line(p(gx(0), gy(0)), p(gx(432), gy(0)), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(gx(0), gy(0)), p(gx(0), gy(9.3)), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(gx(0) + 20, gy(9.9)), text(size: 8.5pt)[#text(style: "italic")[V#sub[t]]（米#super[3]）])
  content(p(gx(470), gy(0) + 3), text(size: 8.5pt)[#text(style: "italic")[t]（°C）])
  content(p(gx(0) - 9, gy(0) + 10), text(size: 8pt)[0])
  for k in range(1, 7) {
    line(p(gx(0) - 4, gy(k)), p(gx(0), gy(k)), stroke: 0.6pt)
    content(p(gx(0) - 11, gy(k)), text(size: 8pt, str(k)))
  }
  for t in (91, 182, 273) {
    content(p(gx(t), gy(0) + 13), text(size: 8pt, str(t)))
    let V = 3 + t / 91
    line(p(gx(t), gy(V)), p(gx(t), gy(0)), stroke: 0.6pt)
    line(p(gx(0), gy(V)), p(gx(t), gy(V)), stroke: (thickness: 0.6pt, dash: "dashed"))
  }
  line(p(gx(0), gy(3)), p(gx(383), gy(3 + 383 / 91)), stroke: 1.8pt)
  for t in (91, 182, 273) {
    circle(p(gx(t), gy(3 + t / 91)), radius: 3, fill: white, stroke: 0.7pt)
  }
  // V0 的花括号
  let bx = gx(0) + 21
  line(p(bx - 5, gy(3)), p(bx, gy(3) - 3), p(bx, gy(1.7)), p(bx + 4, gy(1.5)), p(bx, gy(1.3)), p(bx, gy(0) + 4), p(bx - 5, gy(0)), stroke: 0.6pt)
  content(p(bx + 18, gy(1.5)), text(size: 8.5pt)[#text(style: "italic")[V#sub[0]]])
})
