// 本章提要表（原书 p.245）“图像”栏的两幅图（左 a>1，右 0<a<1），以及表中定义域/值域之间交叉的两根箭头。
// 坐标取自 200 dpi 页面图（带 100 像素网格），页面像素坐标，未精量：
//   左图（a>1）：原点 (355, 1962)，单位长度约 39 像素；x 轴 220–790，y 轴 1552–2160；
//     y=a^x 取 a=2.1（x 从 −3.2 到 2.95，右端与扫描上端点一致）；y=log_a x 取同一 a（x 从 0.11 到 8.46，
//     原图右端略高于解析式约 15 像素，因为原图是手绘）；y=x 画 x 从 −3.08 到 7.69。
//   右图（0<a<1）：原点 (980, 1958)，单位长度约 39.5 像素；x 轴 835–1410，y 轴 1575–2160；
//     y=a^x 取 a=0.49（x 从 −2.96 到 3.04）；y=log_a x 取同一 a（x 从 0.109 到 8.1）；y=x 画 x 从 −3.04 到 7.34。
//   原图中曲线、坐标轴略有倾斜，一律画成水平、竖直。
#import "/common/series.typ": *

#let fig-6-summary(width: 12.6cm) = px-canvas(1260, 760, origin: (200, 1500), width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let t(x, y, body, size: 8pt) = content(p(x, y), text(font: fonts.song, size: size, body))
  let samples(n, a, b, f) = range(n + 1).map(i => { let x = a + (b - a) * i / n; f(x) })

  // 一幅图：ox, oy 为原点，un 为单位长度，a 为底数
  let panel(ox, oy, un, a, xs, ye, ticks-x, ticks-y, exp-range, log-range, line-range) = {
    let q(x, y) = p(ox + un * x, oy - un * y)
    // 坐标轴
    line(p(xs.at(0), oy), p(xs.at(1), oy), stroke: 0.6pt, mark: ar)
    line(p(ox, ye.at(0)), p(ox, ye.at(1)), stroke: 0.6pt, mark: ar)
    for k in ticks-x { if k != 0 { line(p(ox + un * k, oy - 5), p(ox + un * k, oy + 5), stroke: 0.5pt) } }
    for k in ticks-y { if k != 0 { line(p(ox - 5, oy - un * k), p(ox + 5, oy - un * k), stroke: 0.5pt) } }
    // y = x：点划线
    line(q(line-range.at(0), line-range.at(0)), q(line-range.at(1), line-range.at(1)),
      stroke: (thickness: 1.4pt, dash: "dash-dotted"))
    // y = a^x
    line(..samples(80, exp-range.at(0), exp-range.at(1), x => q(x, calc.pow(a, x))), stroke: 1.8pt)
    // y = log_a x
    line(..samples(120, log-range.at(0), log-range.at(1), x => q(x, calc.ln(x) / calc.ln(a))), stroke: 1.8pt)
  }

  // 左图 a>1
  panel(355, 1962, 39, 2.1, (220, 790), (2160, 1552), range(-3, 11), range(-2, 9),
    (-3.2, 2.95), (0.11, 8.46), (-3.08, 7.69))
  // 右图 0<a<1
  panel(980, 1958, 39.5, 0.49, (835, 1410), (2160, 1575), range(-4, 11), range(-2, 9),
    (-2.96, 3.04), (0.109, 8.1), (-3.04, 7.34))

  // 标注：左图
  t(495, 1590, $y = a^x$)
  t(667, 1627, $y = x$)
  t(760, 1842, $y = log_a x$)
  t(490, 2095, $a > 1$, size: 9pt)
  t(340, 1522, $y$)
  t(360, 2185, $y'$)
  t(810, 1955, $x$)
  t(367, 1976, $O$, size: 7pt)
  // 标注：右图
  t(865, 1592, $y = a^x$)
  t(1280, 1635, $y = x$)
  t(1370, 2078, $y = log_a x$)
  t(1155, 2148, $0 < a < 1$, size: 9pt)
  t(977, 1550, $y$)
  t(980, 2188, $y'$)
  t(1402, 1955, $x$)
  t(992, 1974, $O$, size: 7pt)
})

// 定义域与值域之间交叉的两根箭头：左上 → 右下，左下 → 右上。
#let cross-arrows(width: 0.9cm) = px-canvas(70, 90, width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.45)
  line(p(6, 10), p(64, 80), stroke: 0.5pt, mark: ar)
  line(p(6, 80), p(64, 10), stroke: 0.5pt, mark: ar)
})
