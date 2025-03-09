<script setup lang="ts">
import { defineComponent } from 'vue'
import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
</script>

<template>
  <theme-layout class="default">
    <div class="content my-auto h-full">
      <slot />
    </div>
  </theme-layout>
</template>

<!-- <style scoped>
.content {
  p {
    font-size: 1.25rem;
  }
}
</style> -->