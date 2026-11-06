// 图 1·3 刻度尺（原书 p.4）
// 直尺用 CeTZ 重绘；卷尺是写实插画，沿用原扫描裁剪（fig1-3-tape.png）。
// 坐标是原书 p.4 的页面像素坐标（render-pages.py --dpi 200 的显示图，宽 1568）。
#import "/common/series.typ": *

#let fig-1-3(width: 12cm) = px-canvas(850, 268, origin: (405, 700), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor,
    text(font: fonts.hei, size: 8pt, weight: "medium", body))

  // 直尺：外框 + 刻度。0 刻度在 x = 427，1 厘米 = 74 像素
  rect(p(410, 750), p(863, 826), stroke: 1.3pt)
  let x0 = 427
  let pitch = 7.4
  for k in range(0, 58) {
    let x = x0 + pitch * k
    let len = if calc.rem(k, 10) == 0 { 16 } else if calc.rem(k, 5) == 0 { 11 } else { 6 }
    line(p(x, 752), p(x, 752 + len), stroke: 0.5pt)
  }
  content(p(x0 + 3, 806), anchor: "west", text(size: 8.5pt)[0 #h(0.15em) #text(size: 6.5pt)[cm]])
  for k in range(1, 6) {
    content(p(x0 + 74 * k, 806), anchor: "center", text(size: 8.5pt, str(k)))
  }
  lab(627, 880, [直尺])

  // 卷尺
  content(p(925, 700), anchor: "north-west", image("fig1-3-tape.png", width: 320 * u))
  lab(1225, 936, [卷尺])
})
