<script setup lang="ts">
import { defineComponent } from 'vue'

import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
const props = defineProps<{
  image: string
  leftClass?: string
  rightClass?: string
  imageClass?: string
  bleed?: Boolean
  equal?: Boolean
}>();

</script>

<template>
  <theme-layout class="image image-right">
    <div class="content my-auto h-full relative grid grid-cols-12">
      <div :class="[
            'pt2.5rem pa-3.5rem',
            equal ? 'col-span-6' : 'col-span-8',
            leftClass,
          ]">
        <slot />
      </div>
      <div v-if="bleed" :class="[
            equal ? 'col-span-6' : 'col-span-4',
            'my-auto h-full flex justify-center items-center',
            rightClass,
          ]" :style="{
            backgroundImage: `url(${image})`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
          }">
        <p />
      </div>
      <div v-else :class="[
            equal ? 'col-span-6' : 'col-span-4',
            'my-auto h-full flex justify-center items-center',
            rightClass,
          ]">
        <img class="my-auto mx-auto w-auto" :src="image" :class="imageClass" />
      </div>
    </div>
  </theme-layout>
</template>

<style scoped>
.content {
  padding: 0;
  background: var(--slidev-theme-image-background);
}
</style>
