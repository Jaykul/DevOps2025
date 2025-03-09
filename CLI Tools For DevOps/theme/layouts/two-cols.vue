<script setup lang="ts">
import { defineComponent } from 'vue'

import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
const props = defineProps({
  leftClass: {
    type: String,
    default: 'col-span-6'
  },
  rightClass: {
    type: String,
    default: 'col-span-6'
  }
});

</script>

<template>
  <theme-layout class="two-columns">
    <div class="content my-auto h-full relative grid grid-cols-12">
      <div class="col-span-12">
        <slot name="header" />
      </div>
      <div class="leftColumn" :class="leftClass">
        <slot name="left" />
      </div>

      <div class="rightColumn" :class="rightClass">
        <slot name="right" />
      </div>
    </div>
  </theme-layout>
</template>
