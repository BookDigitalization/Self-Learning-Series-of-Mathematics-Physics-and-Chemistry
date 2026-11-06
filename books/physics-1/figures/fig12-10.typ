// 图 12·10 两球碰撞前后（上图）、图 12·11 碰撞时两球的受力（原书 p.396）
// 线条图，按原图重绘（原图的球带点阵阴影，这里用灰色填充表示）。
// 坐标取自 p.396 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-10(width: 7.6cm) = px-canvas(640, 460, origin: (345, 325), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1.5pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let ball(x, y, r) = circle(p(x, y), radius: r * k * u, stroke: 0.9pt, fill: luma(165))
  // 桌面：粗线 + 斜线阴影
  let table(y, depth) = {
    line(p(350, y), p(930, y), stroke: 2pt)
    let x = 352
    while x < 920 {
      line(p(x + depth, y + 2), p(x, y + depth + 2), stroke: 0.4pt)
      x += 9
    }
  }
  // 上图：碰撞前
  table(432, 38)
  ball(432, 398, 36)
  ball(735, 392, 38)
  arr((472, 398), (590, 398))
  arr((772, 395), (885, 395))
  txt(432, 347, $m_2$)
  txt(735, 338, $m_1$)
  txt(582, 372, $v_(02)$)
  txt(873, 363, $v_(01)$)
  // 下图：碰撞后
  table(690, 50)
  ball(435, 672, 33)
  ball(735, 664, 35)
  arr((470, 656), (590, 656))
  arr((772, 655), (886, 653))
  txt(432, 603, $m_2$)
  txt(735, 601, $m_1$)
  txt(585, 625, $v_2$)
  txt(875, 625, $v_1$)
})

#let fig-12-11(width: 5.4cm) = px-canvas(460, 500, origin: (945, 290), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b, w: 1.2pt) = line(p(..a), p(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let ground(y) = {
    line(p(988, y), p(1360, y), stroke: 1.2pt)
    let x = 990
    while x < 1350 {
      line(p(x + 10, y), p(x, y + 9), stroke: 0.6pt)
      x += 14
    }
  }
  // 上：碰撞时第一球受第二球作用
  ground(452)
  circle(p(1100, 387), radius: 62 * k * u, stroke: (thickness: 0.8pt, dash: "dashed"))
  circle(p(1220, 385), radius: 62 * k * u, stroke: 1pt)
  arr((1092, 385), (1160, 385), w: 1.6pt)
  txt(1105, 368, $F_1$)
  txt(1220, 385, $m_1$)
  arr((988, 318), (1050, 318), w: 1.6pt)
  txt(1030, 303, $m_2 v_(02)$)
  arr((1285, 314), (1342, 314), w: 1.6pt)
  txt(1305, 300, $m_1 v_(01)$)
  // 下：第二球受第一球作用
  ground(738)
  circle(p(1090, 675), radius: 60 * k * u, stroke: 1pt)
  circle(p(1215, 672), radius: 60 * k * u, stroke: (thickness: 0.8pt, dash: "dashed"))
  arr((1218, 665), (1152, 665), w: 1.6pt)
  txt(1212, 645, $F_2$)
  txt(1090, 672, $m_2$)
  arr((955, 620), (1040, 620), w: 1.6pt)
  txt(1012, 598, $m_2 v_2$)
  arr((1290, 618), (1335, 618), w: 1.6pt)
  txt(1262, 598, $m_1 v_1$)
})
