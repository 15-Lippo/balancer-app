<script lang="ts" setup>
import { computed } from 'vue';

import useDarkMode from '@/composables/useDarkMode';
import useTailwind from '@/composables/useTailwind';

/**
 * TYPES
 */
type Props = {
  forceDark?: boolean;
};

/**
 * PROPS & EMITS
 */
const props = withDefaults(defineProps<Props>(), {
  forceDark: false,
});

/**
 * COMPOSABLES
 */
const { darkMode } = useDarkMode();
const tailwind = useTailwind();

/**
 * COMPUTED
 */
const logoSrc = computed(() => {
  return darkMode.value || props.forceDark 
    ? '/src/assets/images/logo-dark.svg' 
    : '/src/assets/images/logo-light.svg';
});
</script>

<template>
  <div class="flex items-center sm:mr-4 app-logo">
    <img :src="logoSrc" alt="LisproCoin Logo" width="120" height="auto" class="logo-img" />
  </div>
</template>

<style scoped>
.app-logo {
  @apply origin-top-left relative;
}

.logo-img {
  transition: transform 0.2s ease-out;
}

.logo-img:hover {
  transform: scale(1.05);
}
</style>
