<style scoped>
  .chessboard {
    -webkit-box-shadow: .1rem .1rem .05rem rgba(0,0,0,.5),
                  -.1rem -.1rem .05rem rgba(0,0,0,.5) ;

            box-shadow: .1rem .1rem .05rem rgba(0,0,0,.5),
                  -.1rem -.1rem .05rem rgba(0,0,0,.5) ;
    height: calc(19rem + 0.04rem);
    width: calc(19rem + 0.04rem);
    background: #daca39;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0.04rem, white), color-stop(0, transparent)), -webkit-gradient(linear, left top, right top, color-stop(0.04rem, white), color-stop(0, transparent));
    background-image: -webkit-linear-gradient(white 0.04rem, transparent 0), -webkit-linear-gradient(left, white 0.04rem, transparent 0);
    background-image: linear-gradient(white 0.04rem, transparent 0), linear-gradient(90deg, white 0.04rem, transparent 0);
    -webkit-background-size: 1rem 1rem;
            background-size: 1rem 1rem;
}

.chess {
    position: relative;
    height: 1rem;
    width: 1rem;
    border-radius: 0.5rem;
    -webkit-box-shadow: .01rem .01rem .1rem rgba(0, 0, 0, .5), 0 0 .05rem rgba(240, 240, 240, .5), .05rem .05rem .01rem rgba(255, 255, 255, .15) inset, .1rem .1rem .1rem rgba(255, 255, 255, .05) inset, -.05rem -.05rem .25rem rgba(0, 0, 0, .15) inset, -.1rem -.1rem .35rem rgba(0, 0, 0, .05) inset;
            box-shadow: .01rem .01rem .1rem rgba(0, 0, 0, .5), 0 0 .05rem rgba(240, 240, 240, .5), .05rem .05rem .01rem rgba(255, 255, 255, .15) inset, .1rem .1rem .1rem rgba(255, 255, 255, .05) inset, -.05rem -.05rem .25rem rgba(0, 0, 0, .15) inset, -.1rem -.1rem .35rem rgba(0, 0, 0, .05) inset;
}

.chess-white {
    left:.5rem;
    top:.5rem;
    background: #EEE;
}

.chess-black {
    background: #000;
    left:10.5rem;
    top:10.5rem;
}
</style>
<template>
  <div class="chessboard">
    <div class="chess chess-white"></div>
    <div class="chess chess-black"></div>
  </div>
</template>
<script>
export default {
}
</script>
