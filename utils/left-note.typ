// 左侧笔记线索函数
// 在页面左侧放置笔记内容
#let left-note(body) = {
  place(
    left,
    dx: -5.5cm,
    block(
      width: 5.0cm,
      // (left, body),
      inset: (left: -1cm, right:0cm, rest: 0em),
      {
        // 添加一个空格来创建首行缩进效果
        h(2em)
        body
      }
    )
  )
}