// 图 13·9 平抛运动的轨迹（原书 p.423）
// 示意图，按原图重绘：坐标轴 Ox（向右）、Oy（向下），轨迹 O A1 B1 C1 D1 E1，地面 E′。
// 坐标是页面显示图（宽 1568）上的像素坐标；轨迹取抛物线 y ∝ x²，与原图各点吻合。
#import "/common/series.typ": *

#let fig-13-9(width: 9cm) = px-canvas(560, 700, origin: (860, 360), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.7pt, dash: "dashed")
  let (ox, oy) = (900, 388)
  let xs = (978, 1055, 1130, 1208, 1285)
  let ys = (407, 465, 561, 695, 868)
  // 坐标轴
  line(p(ox, oy), p(1400, oy), stroke: 1.4pt, mark: arr)
  line(p(ox, oy), p(ox, 1045), stroke: 1.8pt, mark: arr)
  lab(1414, 384, $x$)
  lab(899, 1068, $y$)
  // 地面
  line(p(ox, 868), p(1365, 868), stroke: 1.4pt)
  for k in range(0, 24) {
    let x = 905 + k * 20
    line(p(x, 869), p(x - 8, 880), stroke: 0.5pt)
  }
  // 虚线
  for i in range(0, 5) {
    line(p(xs.at(i), oy), p(xs.at(i), ys.at(i)), stroke: dsh)
    line(p(ox, ys.at(i)), p(xs.at(i), ys.at(i)), stroke: dsh)
  }
  // 轨迹
  let tr(x) = 388 + 480 * calc.pow((x - 900) / 385, 2)
  line(..range(0, 39).map(k => { let x = 900 + k * 10; p(x, tr(x)) }), stroke: 1.6pt)
  lab(886, 386, $O$)
  for (i, n) in ("A", "B", "C", "D", "E").enumerate() {
    lab(xs.at(i) + 0, 372, text(size: 9pt, eval("$" + n + "$")))
    lab(880, ys.at(i) + (if i == 0 { 8 } else { 0 }), text(size: 9pt, eval("$" + n + "'$")))
  }
  lab(978, 432, $A_1$)
  lab(1048, 487, $B_1$)
  lab(1117, 585, $C_1$)
  lab(1190, 718, $D_1$)
  lab(1303, 853, $E_1$)
})
