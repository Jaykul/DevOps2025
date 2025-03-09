<script setup lang="ts">
import { defineComponent } from 'vue'

import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
</script>
<template>
  <theme-layout layout-class="section">
    <div class="content my-auto h-full relative place-content-center flex flex-col">
      <slot />
    </div>
  </theme-layout>
</template>

<style>
.section .content {
  font-size: 1.1rem;
  line-height: 1;

  p {
    font-size: 1.25rem;
    margin-bottom: 1em;
    line-height: 1.25em;
  }
}
</style>
