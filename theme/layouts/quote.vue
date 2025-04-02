<script setup lang="ts">
import { defineComponent } from 'vue'
import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })
const props = defineProps<{
  author: string
}>();
</script>
<template>
  <theme-layout class="quote">
    <div class="content my-auto h-full place-content-center items-center flex flex-col">
      <div data-quote-container class="quote mb-4 text-5xl relative ml-10 mr-10">
        <slot />
      </div>
      <hr class="w-48 border-t-5 mb-2" />
      <p v-if="author" class="italic text-xl font-extralight">{{ author }}</p>
    </div>
  </theme-layout>
</template>

<style scoped>
.quote hr {
  border-color: var(--slidev-theme-green);
}

.quote :deep(p) {
  line-height: 1.2em; /* Ensure line-height is consistent for the quote text */
  @apply text-center relative font-serif;
}

[data-quote-container]::before {
  /* prettier-ignore */
  content: '\“';
  @apply text-8xl absolute top-3 -left-6 font-serif;
  color: var(--slidev-theme-blue);
}

[data-quote-container]::after {
  /* prettier-ignore */
  content: '\„';
  @apply text-8xl absolute bottom-3 -right-6 font-serif;
  color: var(--slidev-theme-blue);
}
</style>