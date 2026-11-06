// 图 15·4 显示流线的实验（原书 p.496–497）
// 整幅用 CeTZ 按原图重绘；坐标取自原扫描裁剪图的像素坐标（1440×513，y 向下）。
// 近似：C 管下端的弯折、水平管两端伸出的细线，按原扫描的笔画推断。
#import "/common/series.typ": *

#let fig-15-4(width: 9.5cm) = px-canvas(1440, 513, width: width, (p, u) => {
  import cetz.draw: *
  let lw = 1.4pt
  let thin = 0.8pt
  // 上方盛红墨水的容器
  merge-path(stroke: lw, {
    line(p(133, 25), p(140, 105))
    bezier(p(140, 105), p(150, 122), p(150, 122), p(215, 127))
  })
  merge-path(stroke: lw, {
    line(p(322, 25), p(318, 108))
    bezier(p(318, 108), p(314, 125), p(300, 126), p(243, 127))
  })
  line(p(165, 40), p(300, 40), stroke: thin)
  // C 管（两壁）
  line(p(215, 127), p(215, 400), stroke: lw)
  line(p(241, 127), p(241, 372), stroke: lw)
  // C 管下端弯向右
  line(p(241, 384), p(385, 384), stroke: lw)
  line(p(215, 400), p(385, 400), stroke: lw)
  line(p(385, 384), p(385, 400), stroke: thin)
  // 阀门 K
  line(p(195, 245), p(275, 245), stroke: lw)
  line(p(270, 222), p(270, 282), stroke: lw)
  // 水平管 L 的上下壁
  line(p(130, 328), p(1272, 328), stroke: lw)
  line(p(115, 485), p(1275, 485), stroke: lw)
  // 管轴方向伸出的细线与红色细线
  line(p(20, 408), p(150, 408), stroke: lw)
  line(p(1252, 410), p(1410, 410), stroke: lw)
  line(p(385, 392), p(1190, 392), stroke: 1pt)
  // 标注
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(320, 240, $K$)
  lab(265, 360, $C$)
  lab(1245, 282, $L$)
})
