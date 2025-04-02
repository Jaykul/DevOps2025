<script setup lang="ts">
import { computed } from 'vue'
import { handleBackground } from '@slidev/client/layoutHelper.ts'
// import ThemeFooter from '../components/ThemeFooter.vue'
// import ThemeHeader from '../components/ThemeHeader.vue'

const props = defineProps<{
  leftHeader?: string
  rightHeader?: string
  leftFooter?: string
  rightFooter?: string
  background?: string
  layoutClass?: string
}>();

const style = computed(() => handleBackground(props.background, true));
</script>

<template>
    <!-- <div class="absolute inset-0 z-1">
      <transition appear name="section">
        <img
          src="../assets/bg-quote.svg"
          alt=""
          v-if="$slidev.nav.currentLayout === 'quote'"
          class="opacity-80"
        />
      </transition>
    </div> -->

  <div class="slidev-layout pa-0 text-[1.1rem]" :class="(style.background || style.backgroundImage) ? layoutClass : 'no-background ' + layoutClass"
      :style="style">
    <theme-header :leftHeader="leftHeader" :rightHeader="rightHeader" />
    <slot />
    <theme-footer
      :leftFooter="leftFooter"
      :rightFooter="rightFooter"
    />
  </div>
</template>

<style lang="pcss">
.slidev-layout {
  background: var(--slidev-theme-default-background);

  h1+p {
    opacity: 1;
  }

  blockquote {
    display: flex;
    align-items: center;
    background: var(--slidev-theme-code-background);
    color: var(--slidev-theme-color);
    border-color: #f141a8;
    border-left-width: 3px;
    font-size: 1.1em;
  }

  h1 {
    @apply text-4xl;
  }

  h2 {
    @apply text-3xl;
  }

  h3 {
    @apply text-2xl;
  }

  h4 {
    @apply text-xl;
  }

  h5 {
    @apply text-base;
  }

  a {
    color: inherit;

    &:hover {
      color: inherit;
    }
  }

  h2+p,
  h2+ul {
    @apply mt-2;
  }

  p+h2,
  ul+h2,
  table+h2,
  p+blockquote,
  h2+blockquote,
  h3+blockquote,
  h4+blockquote,
  h5+blockquote {
    @apply mt-8;
  }

  li input[type="checkbox"] {
    @apply mr-2 h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500;

    appearance: none;
    border: 1px solid var(--slidev-theme-blue);
    height: 1rem;
    width: 1rem;

    &:checked {
      background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='currentcolor' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M12.207 4.793a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0l-2-2a1 1 0 011.414-1.414L6.5 9.086l4.293-4.293a1 1 0 011.414 0z'/%3e%3c/svg%3e");
      border-color: transparent;
      background-color: var(--slidev-theme-blue);
      background-size: 100% 100%;
      background-position: center;
      background-repeat: no-repeat;
    }
  }
}

.content {
  padding-left: 3.5rem;
  padding-right: 3.5rem;
  padding-top: 2.5rem;
  padding-bottom: 3.5rem;
  overflow: hidden;
}
</style>