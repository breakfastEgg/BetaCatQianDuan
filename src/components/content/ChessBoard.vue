<style scoped>
.chess-padding{
  padding: 10px;
  margin: 0 auto;
  display: block;
  min-width: 300px;
  min-height: 300px;
  background-color: #deb784;
  border: 2px solid black;
  border-radius: 5px;
}
</style>
<template>
  <canvas class="chess-padding" @click=""></canvas>
</template>
<script>
  const lineNum = 20;
  const lineWidth = 2
  // function oneStep (i, j, k) {
  //   context.beginPath()
  //   context.arc(15 + i * 30, 15 + j * 30, 13, 0, 2 * Math.PI) // 绘制棋子
  //   let g = context.createRadialGradient(
  //     15 + i * 30,
  //     15 + j * 30,
  //     13,
  //     15 + i * 30,
  //     15 + j * 30,
  //     0
  //   ) // 设置渐变
  //   if (k) {
  //     // k=true是黑棋，否则是白棋
  //     g.addColorStop(0, '#0A0A0A') // 黑棋
  //     g.addColorStop(1, '#636766')
  //   } else {
  //     g.addColorStop(0, '#D1D1D1') // 白棋
  //     g.addColorStop(1, '#F9F9F9')
  //   }
  //   context.fillStyle = g
  //   context.fill()
  //   context.closePath()
  // }

  // chess.onclick = function (e) {
  //   let x = e.offsetX // 相对于棋盘左上角的x坐标
  //   let y = e.offsetY // 相对于棋盘左上角的y坐标
  //   let i = Math.floor(x / 30)
  //   let j = Math.floor(y / 30)
  //   if (chessBox[i][j] === 0) { // 原来是==
  //     oneStep(i, j, me)
  //     if (me) {
  //       chessBox[i][j] = 1
  //     } else {
  //       chessBox[i][j] = 2
  //     }
  //     me = !me // 下一步白棋
  //   }
  // }

export default {
  data () {
    return {
      chessBox: [lineNum - 1][lineNum - 1] // 落子情况
    }
  },
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
      this.$el.setAttribute('width', maxLength)
      this.$el.setAttribute('height', maxLength)
      // this.$el.height = this.$el.width = maxLength

      offset = maxLength / (lineNum - 1)

      context.lineWidth = lineWidth
      for (let i = 0; i < lineNum; i++) {
        context.strokeStyle = '#fff'
        context.moveTo(i * offset, 0)
        context.lineTo(i * offset, offset * (lineNum - 1))
        context.stroke()
        context.moveTo(0, i * offset)
        context.lineTo(offset * (lineNum - 1), i * offset)
        context.stroke()
      }
    },
    goChecss () {

    }
  }
}
</script>
