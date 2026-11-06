// 图 9·9（原书 p.244）绕过两个滑轮的绳子悬挂重物。CeTZ 重绘（示意）。坐标取自页面显示图，原点 (520,880)。
// 原图木板有木纹，这里只画几条纹线示意。
#import "/common/series.typ": *

#let fig-9-9(width: 10cm) = px-canvas(740, 540, origin: (520, 880), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, ..a) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, body), ..a)
  // 木板
  rect(p(540, 900), p(1222, 968), stroke: 1pt, fill: luma(235))
  line(p(540, 945), p(1222, 945), stroke: 0.6pt)
  for y in (915, 925, 935) {
    line(p(560, y), p(1200, y + 3), stroke: 0.3pt + luma(120))
  }
  // 滑轮与吊杆
  line(p(658, 968), p(658, 1005), stroke: 1.5pt)
  line(p(1130, 968), p(1130, 1005), stroke: 1.5pt)
  circle(p(658, 1024), radius: 20 * u, stroke: 1pt, fill: white)
  circle(p(658, 1024), radius: 8 * u, stroke: 0.8pt)
  circle(p(1130, 1026), radius: 22 * u, stroke: 1pt, fill: white)
  circle(p(1130, 1026), radius: 9 * u, stroke: 0.8pt)
  // 绳子
  let o = (1000, 1193)
  line(p(637, 1024), p(636, 1265), stroke: 1.4pt)
  line(p(678, 1018), p(..o), stroke: 1.4pt)
  line(p(1110, 1040), p(..o), stroke: 1.4pt)
  line(p(1152, 1030), p(1155, 1270), stroke: 1.4pt)
  line(p(..o), p(1000, 1298), stroke: 1.4pt)
  // 重物
  circle(p(636, 1297), radius: 33 * u, stroke: 1pt, fill: luma(225))
  circle(p(1155, 1315), radius: 45 * u, stroke: 1pt, fill: luma(225))
  rect(p(954, 1298), p(1040, 1378), stroke: 1pt, fill: luma(225))
  // 直角标记与字母
  line(p(979, 1180), p(990, 1156), stroke: 0.7pt)
  line(p(990, 1156), p(1013, 1168), stroke: 0.7pt)
  lab(988, 1130, text(size: 9pt, $alpha$))
  lab(978, 1212, text(size: 9pt, $O$))
  lab(637, 1352, [15 公斤])
  lab(1157, 1385, [20 公斤])
})
