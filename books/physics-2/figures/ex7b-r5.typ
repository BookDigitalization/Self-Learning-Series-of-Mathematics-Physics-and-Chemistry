// 复习题七 第 5 题插图（原书 p.283）
// CeTZ 重绘，坐标是原页局部放大图（330 dpi 裁剪）的像素坐标，y 向下。
#import "/common/series.typ": *

#let fig-rev-7-5(width: 11cm) = px-canvas(1066, 648, width: width, (p, u) => {
  import cetz.draw: *
  let sw = 3 * u
  let thin = 1.6 * u
  // 烧杯、水、管：dx 为横向偏移，yw 水面，yt 管顶，ym 管内水银面
  let panel(dx, yw, yt, ym) = {
    let l = 262 + dx
    let r = 412 + dx
    // 烧杯
    line(p(l - 12, 432), p(l, 446), p(l + 4, 625), p(r - 2, 625), p(r, 446), p(r + 13, 432), stroke: sw)
    line(p(l + 2, yw), p(r - 1, yw), stroke: thin)
    // 水面下的短横线表示水
    for k in range(0, 6) {
      let y = yw + 28 + 25 * k
      line(p(l + 14, y), p(l + 40, y), stroke: thin)
      line(p(l + 60, y), p(l + 88, y), stroke: thin)
      line(p(l + 108, y), p(r - 14, y), stroke: thin)
    }
    // 管：壁、顶部半圆、管内水银（浅灰）
    let tl = 342 + dx
    let tr = 362 + dx
    rect(p(tl, ym), p(tr, 568), fill: luma(215), stroke: none)
    line(p(tl, 568), p(tl, yt + 10), stroke: sw)
    line(p(tr, 568), p(tr, yt + 10), stroke: sw)
    arc(p(tl, yt + 10), start: 180deg, stop: 0deg, radius: 10 / 1 * u, stroke: sw)
  }
  panel(0, 480, 150, 235)
  panel(250, 483, 92, 305)
  panel(497, 487, 22, 315)
  let arr(x, y1, y2) = line(p(x, y1), p(x, y2), stroke: thin, mark: (start: ">", end: ">", fill: black, scale: 0.5))
  let tick(x1, x2, y) = line(p(x1, y), p(x2, y), stroke: thin)
  let lab(x, y, body, angle: 0deg) = content(p(x, y), anchor: "center", angle: angle, text(size: 30 * u, body))
  // 左图
  tick(272, 332, 152)
  arr(298, 152, 478)
  tick(364, 410, 237)
  arr(392, 237, 478)
  lab(290, 330, $h_1$)
  lab(393, 365, $h_2$)
  // 中图
  tick(520, 570, 95)
  arr(535, 95, 483)
  tick(600, 645, 305)
  arr(625, 305, 483)
  lab(535, 270, [62 厘米], angle: -90deg)
  lab(658, 380, [26 厘米], angle: -90deg)
  // 右图
  arr(788, 25, 487)
  lab(788, 262, [75 厘米], angle: -90deg)
  tick(862, 898, 315)
  arr(880, 28, 315)
  arr(880, 315, 487)
  lab(880, 170, [75 厘米$-h_2$], angle: -90deg)
  lab(880, 400, $h_2$, angle: -90deg)
})
