<template>
  <div class="watermark" v-motion :initial="{
    rotate: -45,
    translateX: props.width,
  }" :enter="{
  translateX: 0,
  transition: {
    repeat: Infinity,
    duration: props.duration,
    type: 'keyframes',
    ease: 'linear'
  },
}" />
</template>

<script setup lang="ts">
import { ref, watchEffect } from 'vue';

const props = defineProps({
  width: {
    type: Number,
    default: 180
  },
  height: {
    type: Number,
    default: 180
  },
  text: {
    type: String,
    default: 'Watermark'
  },
  size: {
    type: Number,
    default: 16
  },
  color: {
    type: String,
    default: '#04ffff'
  },
  duration: {
    type: Number,
    default: 20000
  },
})

const WatermarkPic = ref('');

watchEffect(() => {
  const txt = props.text
  const canvas = document.createElement('canvas');
  canvas.width = props.width;
  canvas.height = 100;
  const ctx = canvas.getContext('2d');
  if (ctx) {
    ctx.clearRect(0, 0, props.width, props.height);
    ctx.fillStyle = props.color;
    ctx.globalAlpha = 0.1;
    ctx.font = `${props.size}px sans-serif`
    ctx.fillText(txt, 0, 50);
  }
  WatermarkPic.value = `url(${canvas.toDataURL()})`;
})

</script>

<style>
.watermark {
  position: fixed;
  transform: rotate(-45deg);
  top: -600px;
  right: -600px;
  bottom: -600px;
  left: -600px;
  pointer-events: none;
  background-repeat: repeat;
  background-image: v-bind(WatermarkPic);
}
</style>