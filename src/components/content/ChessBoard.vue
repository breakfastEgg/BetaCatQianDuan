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
  <canvas class="chess-padding" @click="chess" @mousemove="scaleJudge"></canvas>
</template>
<script>
const lineNum = 20
const lineWidth = 1

export default {
  data () {
    return {
      chessBox: new Array(lineNum - 1), // 落子情况
      offsetOfTwoLine: 0,
      radiusOfChess: 0,
      me: false,
      scaleParam: 3,
      canIChess: false,
      paddingOfCanvas: 10
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
      const parentPadding = 16

      let context = this.$el.getContext('2d')
      let maxLength
      let offsetOfTwoLine
      let chessHeight
      let chessWidth

      chessHeight = this.$parent.$el.clientHeight - 2 * (parentPadding + this.paddingOfCanvas)
      chessWidth = this.$parent.$el.clientWidth - 2 * (parentPadding + this.paddingOfCanvas)

      maxLength = chessHeight >= chessWidth ? chessWidth : chessHeight
      this.$el.height = this.$el.width = maxLength

      offsetOfTwoLine = this.offsetOfTwoLine = maxLength / lineNum

      context.lineWidth = lineWidth
      for (let i = 0; i < lineNum; i++) {
        let a = (i + 1/2) * offsetOfTwoLine
        let b = offsetOfTwoLine * (lineNum - 1/2)
        let halfOffset = offsetOfTwoLine / 2
        context.strokeStyle = '#fff'
        context.moveTo(a, halfOffset)
        context.lineTo(a, b )
        context.stroke()
        context.moveTo(halfOffset, a)
        context.lineTo(b, a)
        context.stroke()
      }
    },

    oneStep (i, j, k) {
      let offsetOfTwoLine = this.offsetOfTwoLine
      let halfOffset = offsetOfTwoLine / 2
      let context = this.$el.getContext('2d')
      let g = context.createRadialGradient(
        (i + 1/2) * offsetOfTwoLine,
        (j + 1/2) * offsetOfTwoLine,
        offsetOfTwoLine / 2,
        (i + 1/2) * offsetOfTwoLine,
        (j + 1/2) * offsetOfTwoLine,
        0
      ) // 设置渐变

      context.beginPath()
      context.arc((i + 1/2) * offsetOfTwoLine, (j + 1/2) * offsetOfTwoLine, halfOffset, 0, 2 * Math.PI) // 绘制棋子

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
      let halfOffset = this.offsetOfTwoLine / 2
      let i = Math.floor((x - halfOffset) / this.offsetOfTwoLine)
      let j = Math.floor((y - halfOffset) / this.offsetOfTwoLine)

      if (!this.canIChess) {
        return false
      }

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

    scaleJudge (e) {
      let halfOffset = this.offsetOfTwoLine / 2
      let x = e.offsetX - this.paddingOfCanvas - halfOffset// 相对于棋盘左上角的x坐标
      let y = e.offsetY - this.paddingOfCanvas - halfOffset// 相对于棋盘左上角的y坐标
      let multi = this.offsetOfTwoLine / this.scaleParam
      let absX = Math.abs((Math.round(x / this.offsetOfTwoLine) * this.offsetOfTwoLine) - x)
      let absY = Math.abs((Math.round(y / this.offsetOfTwoLine) * this.offsetOfTwoLine) - y)

      if (absX <= multi && absY <= multi) {
        this.canIChess = true
        this.$el.style.cursor = 'pointer'
      } else {
        this.canIChess = false
        this.$el.style.cursor = 'default'
      }
    }
  }
}
</script>
