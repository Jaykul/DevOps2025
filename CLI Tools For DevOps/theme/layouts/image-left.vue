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
  <theme-layout layout-class="image image-left">
    <div class="content my-auto h-full relative grid grid-cols-12">
      <div v-if="bleed" :class="[
            equal ? 'col-span-6' : 'col-span-4',
            'my-auto h-full flex justify-center items-center',
            leftClass
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
        leftClass
      ]">
        <img :src="image" class="my-auto mx-auto w-auto" :class="imageClass" />
      </div>
      <div :class="[
        'pt2.5rem pa-3.5rem',
        equal ? 'col-span-6' : 'col-span-8',
        rightClass
      ]">
        <slot />
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
