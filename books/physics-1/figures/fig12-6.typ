// 图 12·6 子弹穿过木板（原书 p.390）
// 线条图，按原图重绘。坐标取自 p.390 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-6(width: 4.6cm) = px-canvas(260, 220, origin: (390, 1555), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 木板与地面
  rect(p(462, 1518), p(538, 1703), stroke: th)
  line(p(425, 1703), p(585, 1703), stroke: th)
  let x = 425
  while x < 575 {
    line(p(x + 10, 1703), p(x, 1713), stroke: 0.5pt)
    x += 14
  }
  // 子弹（穿过前、穿过后），中间虚线
  line(p(465, 1608), p(540, 1608), stroke: (thickness: 0.6pt, dash: "dashed"))
  let bullet(x0, x1) = {
    line(p(x0, 1600), p(x1 - 12, 1600), p(x1, 1608), p(x1 - 12, 1616), p(x0, 1616), close: true, stroke: th)
  }
  bullet(420, 462)
  bullet(540, 578)
  arr((360, 1608), (415, 1608))
  arr((585, 1608), (632, 1608))
  txt(432, 1572, $v_1$)
  txt(432, 1632, $m$)
  txt(562, 1580, $v_2$)
  txt(558, 1632, $m$)
})
