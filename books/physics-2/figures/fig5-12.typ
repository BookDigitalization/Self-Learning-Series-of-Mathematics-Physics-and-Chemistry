// 图 5·12 液体跟器壁接触处液面的两种不同形状（原书 p.173）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (170, 900)。
#import "/common/series.typ": *

#let fig-5-12(width: 7cm) = px-canvas(400, 260, origin: (170, 900), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, a: "center") = content(p(x, y), anchor: a, text(size: 8.5pt, body))
  // 阴影斜线的壁
  let wall(x0, x1, ya, yb) = {
    rect(p(x0, ya), p(x1, yb), stroke: 1pt, fill: none)
    let hh = yb - ya
    for k in range(-hh, x1 - x0, step: 7) {
      let tmin = calc.max(0, -k)
      let tmax = calc.min(hh, x1 - x0 - k)
      if tmin < tmax {
        line(p(x0 + k + tmin, yb - tmin), p(x0 + k + tmax, yb - tmax), stroke: 0.5pt)
      }
    }
  }
  // (a) 水
  wall(179, 231, 922, 1117)
  line(p(231, 945), p(233, 967), p(240, 982), p(254, 992), p(275, 995), p(350, 996), stroke: 1.2pt)
  for (i, y) in range(1008, 1078, step: 17).enumerate() {
    for x in range(250 + calc.rem(i, 2) * 14, 340, step: 36) {
      line(p(x, y), p(x + 18, y), stroke: 0.5pt)
    }
  }
  lab(267, 912, [玻璃])
  line(p(248, 921), p(227, 951), stroke: 0.6pt)
  lab(288, 972, [弯月面])
  line(p(258, 977), p(246, 985), stroke: 0.6pt)
  lab(296, 1090, [水])
  lab(271, 1140, $(a)$)
  // (b) 水银
  wall(379, 431, 922, 1117)
  merge-path(close: true, fill: black, stroke: none, {
    line(p(431, 1000), p(438, 993), p(545, 993), p(550, 1000), p(550, 1034))
    line(p(550, 1034), p(550, 1040), p(535, 1058), p(520, 1040), p(500, 1058), p(480, 1040), p(460, 1058), p(445, 1040), p(431, 1040))
  })
  for (y, a, b) in ((1048, 438, 548), (1056, 440, 548)) {
    line(p(a, y), p(b, y), stroke: 1.2pt)
  }
  lab(475, 912, [玻璃])
  line(p(445, 921), p(431, 945), stroke: 0.6pt)
  lab(483, 965, [弯月面])
  line(p(455, 972), p(440, 990), stroke: 0.6pt)
  lab(496, 1084, [水银])
  lab(481, 1140, $(b)$)
})
