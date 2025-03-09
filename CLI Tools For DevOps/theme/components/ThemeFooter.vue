<script setup lang="ts">
import ThemeItem from './ThemeItem.vue'

const props = defineProps<{
  leftFooter?: string
  rightFooter?: string
}>();
</script>

<template>
  <footer v-if="leftFooter || rightFooter" class="absolute bottom-0 pb-.5em px-.5em h-2.5em mt-auto mx-0 flex justify-between w-full dark:text-white ">
    <ThemeItem
      class="leftFooter mb-0"
      :content="leftFooter ? leftFooter : ''" />
    <ThemeItem
      class="rightFooter mb-0"
      :content="rightFooter ? rightFooter : ''" />
  </footer>
</template>