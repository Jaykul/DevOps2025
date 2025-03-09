
<script setup lang="ts">
import { computed } from 'vue'
import { resolveAssetUrl } from '@slidev/client/layoutHelper.ts'

const props = defineProps<{
  class: string
  content: string
}>();


const image = computed(() => {
  if (props.content.startsWith('/') || props.content.startsWith('http')) {
    return resolveAssetUrl(props.content);
  } else {
    return false;
  }
});


</script>

<template>
  <img v-if="image" :src="props.content" :class="props.class" />
  <div v-else class="mb-0" :class="props.class"><Link class="important-border-none" :to=props.content>{{ props.content }}</Link></div>
</template>
