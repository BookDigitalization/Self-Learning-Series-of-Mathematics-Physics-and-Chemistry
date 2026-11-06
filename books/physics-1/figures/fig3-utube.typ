// 图 3·17、3·18、3·19 共用：画 U 形管（CeTZ）。
// 管子是外、内两条 U 形曲线之间的带（带宽 w），液体填在带里。坐标用原页看图工具里的显示坐标（y 向下），由调用方的 q() 换成画布坐标。
#import "/common/series.typ": *

#let arc-pts(cx, cy, rad, a0, a1) = range(0, 19).map(k => {
  let a = a0 + (a1 - a0) * k / 18
  (cx + rad * calc.cos(a), cy + rad * calc.sin(a))
})

// 画 U 形管：外左 xl、外右 xr、管壁带宽 w、管口 ytop、外底 ybot、外圆角半径 r。
// liquids：数组，每项 (左液面 yl, 右液面 yr, 填充色)，先画的在下面。
#let utube(q, xl, xr, w, ytop, ybot, r, liquids) = {
  import cetz.draw: *
  let cyc = ybot - r
  let ri = r - w
  let cxl = xl + r
  let cxr = xr - r
  let outer-arcs = arc-pts(cxl, cyc, r, 180deg, 90deg) + arc-pts(cxr, cyc, r, 90deg, 0deg)
  let inner-arcs-l = arc-pts(cxl, cyc, ri, 180deg, 90deg)
  let inner-arcs-r = arc-pts(cxr, cyc, ri, 90deg, 0deg)
  for (yl, yr, col) in liquids {
    let pts = (
      ((xl, yl), (xl, cyc)) + outer-arcs + ((xr, yr), (xr - w, yr), (xr - w, cyc))
      + inner-arcs-r.rev() + inner-arcs-l.rev() + ((xl + w, yl),)
    )
    line(..pts.map(pt => q(..pt)), close: true, fill: col, stroke: none)
  }
  line(..(((xl, ytop), (xl, cyc)) + outer-arcs + ((xr, ytop),)).map(pt => q(..pt)), stroke: 1.2pt)
  line(..(((xl + w, ytop), (xl + w, cyc)) + inner-arcs-l + inner-arcs-r + ((xr - w, ytop),)).map(pt => q(..pt)), stroke: 1.2pt)
}
