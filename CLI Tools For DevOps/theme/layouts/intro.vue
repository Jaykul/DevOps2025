<script setup lang="ts">
import { defineComponent } from 'vue'
import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
</script>

<template>
  <theme-layout class="intro">
    <div class="content my-auto h-full relative grid grid-cols-12 p-0 opacity-100">
      <div class="absolute h-full w-full bg-black opacity-55"></div>
      <div class="h-full">
        <slot />
      </div>
    </div>
  </theme-layout>
</template>

<style scoped>
h1 {
  @apply text-6xl leading-20;
}

h1+p {
  @apply -mt-2 opacity-50 mb-4;
}
</style>