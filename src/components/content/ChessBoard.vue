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
  <canvas class="chess-padding" @click="chess" @mouseover="scaleJudge"></canvas>
</template>
<script>
const lineNum = 20
const lineWidth = 1

export default {
  data () {
    return {
      chessBox: new Array(lineNum - 1), // 落子情况
      offset: 0,
      me: false
    }
  },
  mounted () {
    let i = 0
    let j = 0

    this.$nextTick(function () {
      this.resizeCanvas()
    })
    window.onresize = () => {
      this.resizeCanvas()
    }

    for (i; i < lineNum; i++) {
      j = 0
      this.chessBox[i] = new Array(lineNum - 1)
      for (j; j < lineNum; j++) {
        this.chessBox[i][j] = 0
      }
    }
  },
  methods: {
    resizeCanvas () {
      const paddingOfCanvas = 10
      const parentPadding = 16

      let context = this.$el.getContext('2d')
      let maxLength
      let offset
      let chessHeight
      let chessWidth

      chessHeight = this.$parent.$el.clientHeight - 2 * (parentPadding + paddingOfCanvas)
      chessWidth = this.$parent.$el.clientWidth - 2 * (parentPadding + paddingOfCanvas)

      maxLength = chessHeight >= chessWidth ? chessWidth : chessHeight
      // this.$el.setAttribute('width', maxLength)
      // this.$el.setAttribute('height', maxLength)
      this.$el.height = this.$el.width = maxLength

      offset = this.offset = maxLength / (lineNum - 1)

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

    oneStep (i, j, k) {
      let offset = this.offset
      let context = this.$el.getContext('2d')
      let g = context.createRadialGradient(
        i * offset,
        j * offset,
        offset / 2,
        i * offset,
        j * offset,
        0
      ) // 设置渐变

      context.beginPath()
      context.arc(i * offset, j * offset, offset / 2, 0, 2 * Math.PI) // 绘制棋子

      if (k) {
        // k=true是黑棋，否则是白棋
        g.addColorStop(0, '#0A0A0A') // 黑棋
        g.addColorStop(1, '#636766')
      } else {
        g.addColorStop(0, '#D1D1D1') // 白棋
        g.addColorStop(1, '#fff')
      }
      context.fillStyle = g
      context.fill()
      context.closePath()
    },

    chess (e) {
      let x = e.offsetX // 相对于棋盘左上角的x坐标
      let y = e.offsetY // 相对于棋盘左上角的y坐标
      let i = Math.floor(x / this.offset)
      let j = Math.floor(y / this.offset)

      if (this.chessBox[i][j] === 0) { // 原来是==
        this.oneStep(i, j, this.me)
        if (this.me) {
          this.chessBox[i][j] = 1
        } else {
          this.chessBox[i][j] = 2
        }
        this.me = !this.me // 下一步白棋
      }
    },

    scaleJudge () {

    }
  }
}
</script>
