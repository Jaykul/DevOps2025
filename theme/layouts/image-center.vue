<script setup lang="ts">
import { defineComponent } from 'vue'
import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
const props = defineProps<{
  image?: string
}>();
</script>

<template>
  <theme-layout layout-class="image">
    <div class="content col-span-12 m-auto h-full w-full flex flex-col">
      <div class="text-center">
        <slot />
      </div>
      <div v-if="image" class="m-auto w-8/12 rounded-lg manual-shadow">
        <img :src="image" class="rounded-lg" />
      </div>
    </div>
  </theme-layout>
</template>
