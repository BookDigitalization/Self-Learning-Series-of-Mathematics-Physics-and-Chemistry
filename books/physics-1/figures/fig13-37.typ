// 图 13·37 例 17 圆筒中的杂技演员（原书 p.461）
// 示意图，按原图重绘：转动的圆筒（半径 R，角速度 ω，虚线为转轴），贴在筒壁上的演员（小图示意），
// 压力 f_n（筒壁对人）与反作用力 f（人对筒壁）。原图人体是写实小图，这里用简单图形示意。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-37(width: 5.6cm) = px-canvas(380, 620, origin: (1050, 590), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (cx, rx, ry) = (1203, 122, 38)
  // 筒壁
  line(p(cx - rx, 745), p(cx - rx, 1045), stroke: 1.5pt)
  line(p(cx + rx, 745), p(cx + rx, 1045), stroke: 1.5pt)
  circle(p(cx, 745), radius: (rx * u, ry * u), stroke: 1.5pt)
  // 下底：前半实线、后半虚线
  arc(p(cx - rx, 1045), start: 180deg, stop: 360deg, radius: (rx * u, ry * u), stroke: 1.5pt)
  arc(p(cx + rx, 1045), start: 0deg, stop: 180deg, radius: (rx * u, ry * u), stroke: (thickness: 0.8pt, dash: "dashed"))
  // 转轴
  line(p(cx, 640), p(cx, 1170), stroke: (thickness: 0.8pt, dash: "dashed"))
  arc(p(cx - 55, 640), start: 160deg, stop: 20deg, radius: 60 * u, stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(cx, 745), p(1313, 735), stroke: 1pt)
  // 演员（示意）与力
  circle(p(1318, 862), radius: 6 * u, fill: black, stroke: none)
  line(p(1318, 870), p(1318, 920), stroke: 1.6pt)
  line(p(1318, 885), p(1393, 885), stroke: 1.6pt, mark: arr)
  line(p(1313, 885), p(1283, 885), stroke: 1.6pt, mark: arr)
  lab(1262, 620, $omega$)
  lab(1247, 737, $R$)
  lab(1255, 862, $f_n$)
  lab(1388, 832, $f$)
})
