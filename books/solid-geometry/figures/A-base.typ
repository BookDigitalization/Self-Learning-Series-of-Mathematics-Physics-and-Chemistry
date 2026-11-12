// 段 A 共用小工具（geo.typ 的 seg / poly 已带 stroke，不能再传线型，这里的版本可传 s:）
#import "/common/geo.typ": *
#let k = 0.0152cm
#let A-seg(p, a, b, s: lw) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: s)
}
#let A-poly(p, pts, close: true, s: lw) = {
  import cetz.draw: *
  line(..pts.map(q => p(..q)), close: close, stroke: s)
}
#let A-dd = (paint: black, thickness: 0.6pt, dash: "dash-dotted")
#let A-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
