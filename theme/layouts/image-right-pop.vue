<script setup lang="ts">
import { defineComponent } from 'vue'

import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })

const props = defineProps<{
  image: string
  leftClass?: string
  rightClass?: string
  equal?: Boolean
}>();
</script>

<template>
  <theme-layout layout-class="image image-right image-right-pop">
    <div class="content my-auto h-full relative grid grid-cols-12">
      <div :class="[
              'pt2.5rem pa-3.5rem',
              equal ? 'col-span-6' : 'col-span-8',
              leftClass
            ]">
        <slot />
      </div>
      <div :class="[
            equal ? 'col-span-6' : 'col-span-4',
            'my-auto h-full flex justify-center items-center',
            rightClass
          ]" :style="{
            backgroundImage: `url(${image})`,
            backgroundSize: 'cover',
            backgroundPosition: 'right',
          }">
        <div class="h-full w-full" style="backdropFilter: blur(6px)">&nbsp;</div>
        <div class="absolute right-15">
          <div :style="{
                boxShadow: '0px 10px 30px rgba(0,0,0,0.7)',
                zIndex: '5',
              }">
            <img :src="image" class="w-[450px]" alt="" />
          </div>
        </div>
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
