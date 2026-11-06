// 图 1·4 用直尺量物体的长度（原书 p.4）
// 线条图，按原图描绘。坐标是 build/ref 里同区域裁剪图（400 dpi）的像素坐标。
#import "/common/series.typ": *

#let fig-1-4(width: 9cm) = px-canvas(1270, 619, width: width, (p, u) => {
  import cetz.draw: *
  let w = 1.3pt

  // 木块：前面、顶面、右侧面
  line(p(312, 90), p(918, 95), p(912, 295), p(312, 295), close: true, stroke: w)
  line(p(312, 90), p(402, 25), p(1002, 32), p(918, 95), stroke: w)
  line(p(1002, 32), p(1008, 172), p(918, 295), stroke: w)
  // 木块左端的指示线
  line(p(170, 171), p(312, 172), stroke: 2pt)

  // 桌面（木板）：后缘、右端、前面
  line(p(1008, 172), p(1240, 175), p(1248, 262), p(962, 465), stroke: w)
  line(p(1240, 175), p(1160, 300), stroke: w)
  line(p(962, 465), p(962, 535), stroke: w)
  line(p(962, 535), p(1000, 510), stroke: w)
  line(p(18, 462), p(962, 465), stroke: w)
  line(p(18, 535), p(962, 538), stroke: w)
  for x in (885, 938) { line(p(x, 545), p(x, 610), stroke: 0.9pt) }
  line(p(1000, 512), p(1000, 590), stroke: 0.9pt)

  // 直尺：上缘、右端、下缘、断开的左端
  line(p(200, 293), p(1172, 299), p(1068, 405), p(92, 400), p(118, 372), p(150, 346), p(155, 324), p(182, 312), p(200, 293),
    stroke: w)
  // 刻度：每毫米一条斜线，厘米处加长
  let tx(k) = 215 + 15.4 * k
  let top(x) = 293 + (x - 200) * 6 / 972
  for k in range(0, 62) {
    let x = tx(k)
    let len = if calc.rem(k, 10) == 0 { 26 } else if calc.rem(k, 5) == 0 { 20 } else { 14 }
    line(p(x, top(x)), p(x - 5, top(x) + len), stroke: 0.5pt)
  }
  for (x, n) in ((262, 10), (410, 11), (578, 12), (740, 13), (880, 14), (1050, 15)) {
    content(p(x, 353), anchor: "center", text(font: fonts.hei, size: 8pt, style: "italic", str(n)))
  }
})
