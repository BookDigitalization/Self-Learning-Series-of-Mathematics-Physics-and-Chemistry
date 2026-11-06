// 图 14·6（原书 p.486）平抛速度不同时的轨迹：椭圆 I、II、III、圆周 IV、椭圆 V、抛物线 VI。
// 线条图，按原图近似重绘（轨迹为示意曲线，位置与形状取自原图，非精确描摹）。
// 坐标取 200 dpi 页面图的“显示图”像素（宽 1568）。原图中轨迹上的小箭头只在 V、VI 上画出。
#import "/common/series.typ": *

#let fig-14-6(width: 9cm) = px-canvas(700, 840, origin: (460, 100), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9.5pt, body))
  let O = (780, 425)
  let P = (780, 155)
  // 椭圆曲线（以 P 为顶，中心在 x=780）
  let ell(cy, rx, stroke) = {
    let ry = cy - 155
    let pts = range(0, 73).map(i => {
      let a = i / 72 * 360deg
      p(780 + rx * calc.sin(a), cy - ry * calc.cos(a))
    })
    line(..pts, close: true, stroke: stroke)
  }
  // 地球
  circle(p(..O), radius: 232, stroke: 1.5pt)
  // I、II、III（虚线）
  ell(315, 105, (thickness: 0.8pt, dash: "dashed"))
  ell(390, 195, (thickness: 0.8pt, dash: "dashed"))
  ell(405, 215, (thickness: 0.8pt, dash: "dashed"))
  // IV：圆周
  circle(p(..O), radius: 270, stroke: 0.9pt)
  // V：大椭圆
  ell(525, 285, 1.2pt)
  // VI：抛物线形轨迹
  let pts = range(0, 31).map(i => {
    let t = i / 30
    p(780 + 350 * t, 155 + 163 * calc.pow(t, 1.6))
  })
  line(..pts, stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // v₀ 方向的点划线
  line(p(..P), p(1160, 155), stroke: (thickness: 0.8pt, dash: "dash-dotted"))
  // 地心连线与 R
  line(p(..O), p(..P), stroke: 0.9pt)
  line(p(..O), p(568, 568), stroke: 1.1pt, mark: (end: "stealth", fill: black, scale: 0.45))
  // 标注
  lab(785, 130, $P$)
  lab(870, 130, $v_0$)
  lab(792, 175, $Q$)
  lab(806, 232, $O_1$)
  lab(806, 315, $O_2$)
  lab(806, 358, $O_3$)
  lab(802, 428, $O$)
  lab(805, 596, $O_5$)
  lab(703, 500, $R$)
  lab(843, 222, $A$)
  lab(890, 242, $B$)
  lab(980, 345, $C$)
  lab(866, 443, [I])
  lab(940, 500, [II])
  lab(890, 645, [III])
  lab(978, 637, [IV])
  lab(1080, 650, [V])
  lab(1108, 262, [VI])
  lab(800, 892, $P'$)
})
