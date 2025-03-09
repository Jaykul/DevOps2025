<script setup lang="ts">
import { defineComponent } from 'vue'
import ThemeLayout from './theme-layout.vue'

const components = defineComponent({ ThemeLayout })

</script>

<template>
  <theme-layout class="cover">
    <div class="content my-auto h-full relative place-content-center items-center flex flex-col">
      <slot />
    </div>
  </theme-layout>
</template>

<style>
.cover .content {
  opacity: 1.0;
  position: relative;

  &::before {
    background: rgba(15, 19, 30, 0.4);
    content: " ";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 0;
  }

  &.no-background {
    &::before {
      display: none;
    }
  }

  h1+p {
    opacity: 0.7;
    padding-left: 1.25em;
  }

  > * {
    z-index: 1;
  }

  /* >div>div {
    z-index: 1;

    p {
      margin: 1em 0 0;
      font-size: 1.5em;
      line-height: 1.5;
    }

    h2 {
      margin: 0.5em 0 0;
      padding-left: 0.5em;
    }

    code {
      color: var(--slidev-theme-color);
    }
  } */

  h1 {
    @apply text-6xl leading-20;
  }

  h1+p {
    @apply -mt-2 opacity-50 mb-4;
  }
}
</style>