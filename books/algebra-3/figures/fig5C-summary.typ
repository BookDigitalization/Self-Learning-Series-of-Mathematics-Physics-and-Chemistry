// 本章提要表（原书 p.209–210）“图像”栏的六幅小图：y=x、y=x⁻¹、y=x²、y=x^(1/2)、y=x³、y=x^(1/3)。
// 坐标取自 200 dpi 页面图（显示宽 1596 的缩放图）：各图原点及各方向的轴长如下，未精量；
// 曲线用解析式画，系数按扫描上曲线端点的高度取（原图手绘，端点高度不严格对应解析式）。
//   y=x：原点 (1238, 977)，轴 x∈[−126, 157]，y∈[−128, 145]，直线 (−75,−75)–(82,80)。
//   y=x⁻¹：原点 (1235, 1335)，k=840 像素²（x 从 8 到 105，y 从 105 到 8），左支对称。
//   y=x²：原点 (1232, 1700)，Y=0.0578 x²，x∈[−45, 45]。
//   y=x^(1/2)：原点 (1240, 2005)，Y=3.36 √x，x∈[0, 128]。
//   y=x³（p.210）：原点 (1190, 645)，Y=0.0017 x³，x∈[−40, 40]。
//   y=x^(1/3)（p.210）：原点 (1188, 975)，Y=±8.2 |x|^(1/3)，x∈[−115, 115]。
#import "/common/series.typ": *

// 小图画布：xl、xr 为原点左右的轴长，yu、yd 为原点上下的轴长；
// body(q) 在以原点为 (0,0)、y 向上的像素坐标里画曲线。
#let mini(xl, xr, yu, yd, body, width: 2.5cm) = {
  let pad = 16
  let w = xl + xr + 2 * pad + 8
  let h = yu + yd + 2 * pad
  px-canvas(w, h, origin: (0, 0), width: width, (p, u) => {
    import cetz.draw: *
    let ar = (end: "stealth", fill: black, scale: 0.5)
    let q(a, b) = p(xl + pad + a, yu + pad - b)
    let t(a, b, c, size: 7pt) = content(q(a, b), text(font: fonts.song, size: size, c))
    line(q(-xl, 0), q(xr, 0), stroke: 0.5pt, mark: ar)
    line(q(0, -yd), q(0, yu), stroke: 0.5pt, mark: ar)
    t(xr + 9, 0, $x$, size: 6.5pt)
    t(7, yu + 5, $y$, size: 6.5pt)
    t(9, -9, $O$, size: 6pt)
    body(q)
  })
}

#let samples(n, a, b, f) = range(n + 1).map(i => { let x = a + (b - a) * i / n; f(x) })

#let icon-lin() = mini(126, 157, 145, 128, q => {
  import cetz.draw: *
  line(q(-75, -75), q(82, 80), stroke: 1.4pt)
})

#let icon-inv() = mini(123, 150, 150, 120, q => {
  import cetz.draw: *
  let k = 840
  line(..samples(60, 7.6, 105, x => q(x, k / x)), stroke: 1.4pt)
  line(..samples(60, -105, -7.6, x => q(x, k / x)), stroke: 1.4pt)
})

#let icon-sq() = mini(117, 153, 140, 60, q => {
  import cetz.draw: *
  line(..samples(40, -45, 45, x => q(x, 0.0578 * x * x)), stroke: 1.4pt)
})

#let icon-sqrt() = mini(125, 175, 145, 120, q => {
  import cetz.draw: *
  line(..samples(60, 0, 128, x => q(x, 3.36 * calc.sqrt(x))), stroke: 1.4pt)
})

#let icon-cube() = mini(122, 160, 175, 120, q => {
  import cetz.draw: *
  line(..samples(60, -40, 40, x => q(x, 0.0017 * calc.pow(x, 3))), stroke: 1.4pt)
})

#let icon-croot() = mini(120, 157, 125, 115, q => {
  import cetz.draw: *
  let f(x) = if x < 0 { -8.2 * calc.pow(-x, 1 / 3) } else { 8.2 * calc.pow(x, 1 / 3) }
  line(..samples(80, -115, 115, x => q(x, f(x))), stroke: 1.4pt)
})
