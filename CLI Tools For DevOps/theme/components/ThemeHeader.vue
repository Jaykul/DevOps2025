<script setup lang="ts">
import ThemeItem from './ThemeItem.vue'

const props = defineProps<{
  leftHeader?: string
  rightHeader?: string
}>();
</script>

<template>
  <header v-if="leftHeader || rightHeader" class="absolute top-0 pt-.5em px-.5em h-2.5em mt-auto mx-0 flex justify-between w-full dark:text-white">
    <ThemeItem
      class="leftHeader mt-0"
      :content="leftHeader ? leftHeader : ''" />
    <ThemeItem
      class="rightHeader mt-0"
      :content="rightHeader ? rightHeader : ''" />
  </header>
</template>

<!-- <script setup lang="ts">
import { computed } from 'vue'
import { resolveAssetUrl } from '@slidev/client/layoutHelper.ts'

const props = defineProps({
  logoHeader: {
    type: String,
  },
})
const logoSrc = computed(() => resolveAssetUrl(props.logoHeader))
</script> -->

