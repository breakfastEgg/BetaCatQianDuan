//  deb784棋盘颜色
<style scoped>
.chessPadding{
  padding: 10px;
  margin: 0 auto
}
</style>
<template>
  <canvas class="chessPadding"></canvas>
</template>
<script>
let chess = function (id) {
  let canvas = document.querySelector(`#${id}`)
  let context = canvas.getContext('2d')
  let me = true
  let chessBox = [] // 用于存放棋盘中落子的情况

  for (let i = 0; i < 15; i++) {
    chessBox[i] = []
    for (let j = 0; j < 15; j++) {
      chessBox[i][j] = 0 // 初始值为0
    }
  }

  function drawChessBoard () {
    for (let i = 0; i < 15; i++) {
      context.strokeStyle = '#D6D1D1'
      context.moveTo(15 + i * 30, 15) // 垂直方向画15根线，相距30px
      context.lineTo(15 + i * 30, 435)
      context.stroke()
      context.moveTo(15, 15 + i * 30) // 水平方向画15根线，相距30px;棋盘为14*14；
      context.lineTo(435, 15 + i * 30)
      context.stroke()
    }
  }

  drawChessBoard() // 绘制棋盘

  function oneStep (i, j, k) {
    context.beginPath()
    context.arc(15 + i * 30, 15 + j * 30, 13, 0, 2 * Math.PI) // 绘制棋子
    let g = context.createRadialGradient(
      15 + i * 30,
      15 + j * 30,
      13,
      15 + i * 30,
      15 + j * 30,
      0
    ) // 设置渐变
    if (k) {
      // k=true是黑棋，否则是白棋
      g.addColorStop(0, '#0A0A0A') // 黑棋
      g.addColorStop(1, '#636766')
    } else {
      g.addColorStop(0, '#D1D1D1') // 白棋
      g.addColorStop(1, '#F9F9F9')
    }
    context.fillStyle = g
    context.fill()
    context.closePath()
  }

  chess.onclick = function (e) {
    let x = e.offsetX // 相对于棋盘左上角的x坐标
    let y = e.offsetY // 相对于棋盘左上角的y坐标
    let i = Math.floor(x / 30)
    let j = Math.floor(y / 30)
    if (chessBox[i][j] === 0) { // 原来是==
      oneStep(i, j, me)
      if (me) {
        chessBox[i][j] = 1
      } else {
        chessBox[i][j] = 2
      }
      me = !me // 下一步白棋
    }
  }
}

export default {
  mounted () {
    this.$nextTick(function () {
      this.resizeCanvas()
    })
    window.onresize = () => {
      this.resizeCanvas()
    }
  },
  methods: {
    resizeCanvas () {
      const paddingOfCanvas = 10
      const parentPadding = 16

      let context = this.$el.getContext('2d')
      let offset
      let maxLength
      let chessHeight
      let chessWidth

      chessHeight = this.$parent.$el.clientHeight - 2 * (parentPadding + paddingOfCanvas)
      chessWidth = this.$parent.$el.clientWidth - 2 * (parentPadding + paddingOfCanvas)

      maxLength = chessHeight >= chessWidth ? chessWidth : chessHeight
      this.$el.height = this.$el.width = maxLength

      offset = maxLength / 14

      for (let i = 0; i < 15; i++) {
        context.strokeStyle = '#D6D1D1'
        context.moveTo(i * offset, 0)
        context.lineTo(i * offset, offset * 14)
        context.stroke()
        context.moveTo(0, i * offset)
        context.lineTo(offset * 14, i * offset)
        context.stroke()
      }
    }
  }
}
</script>
