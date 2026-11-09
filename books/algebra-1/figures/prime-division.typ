// §4·1 例 1、例 2 的连除分解质因数竖式（原书 p.174 分解 224；p.175 分解 4320）
// 竖式不是原书的编号插图，形状简单，用 CeTZ 重画：每行一个除数，数的左边一条竖线、下边一条横线，
// 最后一行是不能再除的商。数右对齐，竖线随数的位数左移。坐标为自定的像素单位（y 向下）。
#import "/common/series.typ": *

// divs：各行除数（字符串）；nums：被除的数，比 divs 多一个（最后一个是最后的商）
#let short-division(divs, nums, width: 2.6cm) = {
  let dw = 8.5   // 一位数字的宽度
  let pitch = 23 // 行距
  let xr = 100   // 数的右边界
  let h = pitch * nums.len() + 6
  px-canvas(130, h, width: width, (p, u) => {
    import cetz.draw: *
    for (i, n) in nums.enumerate() {
      let y = 3 + pitch * i + pitch / 2
      content(p(xr, y), anchor: "east", text(font: fonts.song, size: 10pt, n))
      if i < divs.len() {
        let xb = xr - dw * n.len() - 5
        content(p(xb - 3, y), anchor: "east", text(font: fonts.song, size: 10pt, divs.at(i)))
        // 竖线与数下方的横线（连成 L 形）
        line(p(xb, y - pitch / 2), p(xb, y + pitch / 2), p(xr + 2, y + pitch / 2), stroke: 0.6pt)
      }
    }
  })
}
