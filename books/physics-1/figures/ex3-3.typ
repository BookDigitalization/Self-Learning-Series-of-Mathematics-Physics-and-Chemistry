// 习题 3·3 附图（原书 p.63）
// 第 2 题：U 形管（粗细不匀），线条图，用 CeTZ 重绘（原图斜线填充改为灰色填充）。坐标取自原页 200 dpi 预览图在看图工具里的显示坐标，画布原点为显示图 (350,1430)，宽 410、高 380。
// 第 5 题：汽锅与水位计，写实插画，沿用原扫描裁剪 ex3-3-5.png（已涂去 B），字母用 CeTZ 补回；坐标是 PNG 像素坐标（640×1227），原页显示图 (975,1290) 起，×2.1314。
#import "/common/series.typ": *

#let fig-ex-3-3-2(width: 5.4cm) = px-canvas(410, 380, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 350, y - 1430)
  let dash = (thickness: 0.6pt, dash: "dashed")
  let ah = (end: "stealth", fill: black, scale: 0.4)
  // 水银（深灰）：左管 1635 以下、底部、右管 1710 以下
  line(q(360, 1635), q(480, 1635), q(480, 1745), q(703, 1745), q(703, 1710), q(745, 1710), q(745, 1795), q(360, 1795),
    close: true, fill: luma(140), stroke: none)
  // 右管里的水（浅灰）
  rect(q(703, 1445), q(745, 1710), fill: luma(225), stroke: none)
  // 管壁
  line(q(358, 1440), q(358, 1795), q(745, 1795), q(745, 1440), stroke: 1.3pt)
  line(q(480, 1440), q(480, 1745), q(703, 1745), q(703, 1440), stroke: 1.3pt)
  // 水银面的两条水平虚线和 0.5 厘米
  line(q(482, 1635), q(680, 1635), stroke: dash)
  line(q(482, 1710), q(703, 1710), stroke: dash)
  line(q(572, 1592), q(572, 1635), stroke: 0.7pt, mark: ah)
  line(q(572, 1755), q(572, 1710), stroke: 0.7pt, mark: ah)
  content(q(565, 1662), anchor: "center", frame: "rect", fill: white, stroke: none, padding: 1pt,
    text(size: 8pt, [0.5 厘米]))
})

#let fig-ex-3-3-5(width: 3.6cm) = px-canvas(640, 1227, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-3-5.png", width: 640 * u))
  content(p(38, 522), anchor: "center", text(size: 9pt, $B$))
})
