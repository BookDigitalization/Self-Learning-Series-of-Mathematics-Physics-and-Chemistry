// 图 4·5（原书 p.127）观察气体的压强随温度变化而变化的实验装置：烧瓶、温度计、水银压强计。
// 装置示意图，按原图简化重绘。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-4-5(width: 9.4cm) = px-canvas(450, 450, origin: (545, 805), width: width, (p, u) => {
  import cetz.draw: *
  // 玻璃管：粗黑线上叠细白线
  let tube(..pts, w: 6pt) = {
    line(..pts.pos().map(a => p(..a)), stroke: (thickness: w, paint: black, cap: "round", join: "round"))
    line(..pts.pos().map(a => p(..a)), stroke: (thickness: w - 2.2pt, paint: white, cap: "round", join: "round"))
  }
  // 水槽
  line(p(570, 962), p(570, 1194), p(797, 1194), p(797, 962), stroke: 1.6pt)
  line(p(573, 1005), p(794, 1005), stroke: 0.6pt)
  for y in (1018, 1032, 1046, 1060, 1074, 1088, 1102, 1116, 1130, 1144, 1158, 1172, 1184) {
    line(p(580, y), p(625, y), stroke: 0.5pt)
    line(p(765, y), p(790, y), stroke: 0.5pt)
  }
  for y in (1026, 1046, 1066, 1086, 1106, 1126, 1146, 1166) {
    line(p(655, y), p(690, y), stroke: 0.5pt)
  }
  // 烧瓶、瓶塞
  circle(p(729, 1088), radius: 67, stroke: 1.2pt, fill: white)
  line(p(718, 1024), p(718, 1000), stroke: 1pt)
  line(p(740, 1024), p(740, 1000), stroke: 1pt)
  rect(p(700, 1000), p(739, 975), stroke: 1pt, fill: white)
  line(p(700, 988), p(739, 988), stroke: 0.5pt)
  for y in (1048, 1064, 1080, 1096, 1112, 1128) {
    line(p(700, y), p(740, y), stroke: 0.4pt)
  }
  // 连接管
  tube((727, 975), (727, 915), (860, 915), (880, 935), (880, 1000), w: 7pt)
  // 水银压强计（U 形管）：左管自 y=960，右管自 y=884，半圆形弯头
  let arcpts = (cx, yb, r) => range(0, 17).map(k => {
    let th = calc.pi * (1 - k / 16)
    (cx + r * calc.cos(th), yb + r * calc.sin(th))
  })
  let upts = ((880, 960),) + arcpts(902, 1182, 22) + ((924, 884),)
  tube(..upts, w: 7pt)
  // 汞柱：左管自 y=992 至弯头，右管自弯头至 y=1088
  let hgpts = ((880, 992),) + arcpts(902, 1182, 22) + ((924, 1088),)
  line(..hgpts.map(a => p(..a)), stroke: (thickness: 3.4pt, cap: "butt", join: "round"))
  // 温度计
  tube((606, 825), (606, 1060), w: 6pt)
  circle(p(606, 1064), radius: 4.5, fill: black, stroke: none)
  line(p(606, 1010), p(606, 1060), stroke: (thickness: 1.8pt))
  for y in range(840, 1000, step: 12) {
    line(p(609, y), p(613, y), stroke: 0.4pt)
  }
  // 标注
  content(p(649, 878), anchor: "west", text(size: 9pt)[温度计])
  line(p(640, 880), p(612, 886), stroke: 0.5pt)
  content(p(822, 1017), anchor: "west", text(size: 9pt)[水银])
  content(p(822, 1035), anchor: "west", text(size: 9pt)[压强计])
  line(p(842, 1010), p(877, 995), stroke: 0.5pt)
})
