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
    <img :src="image" class="rounded-lg" />
  </theme-layout>
</template>
