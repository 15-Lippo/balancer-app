<script setup lang="ts">
import { PoolToken } from '@/services/pool/types';
import useWeb3 from '@/services/web3/useWeb3';
import { computed, toRefs } from 'vue';
import { useTokenBreakdown } from './composables/useTokenBreakdown';
import { bnum } from '@/lib/utils';

/**
 * TYPES
 */
type Props = {
  token: PoolToken;
  shareOfParentInPool?: number;
  parentLevel?: number;
  isWeighted: boolean;
  isDeepPool: boolean;
};

/**
 * PROPS
 */
const props = withDefaults(defineProps<Props>(), {
  parentLevel: 0,
  shareOfParentInPool: 1,
});

const { token, shareOfParentInPool, isWeighted, isDeepPool } = toRefs(props);

/**
 * COMPOSABLES
 */
const { explorerLinks } = useWeb3();

const { balanceLabel, fiatLabel, tokenWeightLabel } = useTokenBreakdown(
  token,
  shareOfParentInPool,
  isDeepPool
);

/**
 * COMPUTED
 */
// The nested level, the top level being 0, the level below that 1, etc.
const currentLevel = computed(() => props.parentLevel + 1);

const nestedPaddingClass = computed(() => {
  switch (currentLevel.value) {
    case 1:
      return 'level-1';
    case 2:
      return 'level-2';
    case 3:
      return 'level-3';
    case 4:
      return 'level-4';
    default:
      return 'pl-4';
  }
});

const isLeaf = computed((): boolean => !token.value.token?.pool);

// If this token is a pool, this is the share of that pool in it's parent.
// e.g. The share of bb-a-DAI in bb-a-USD, since bb-a-DAI can be used in
// multiple pools.
const shareOfTokenInPool = computed((): number => {
  if (isLeaf.value) return 1;

  return bnum(token.value?.balance || '0')
    .div(token.value.token?.pool?.totalShares || 1)
    .times(props.shareOfParentInPool)
    .toNumber();
});
</script>

<template>
  <div
    :class="[
      'grid gap-y-4 px-4 w-full items-center',
      isWeighted ? 'grid-cols-4' : 'grid-cols-3',
      nestedPaddingClass,
    ]"
  >
    <BalLink
      :href="explorerLinks.addressLink(token.address)"
      external
      noStyle
      class="group flex items-center"
    >
      <!-- #Todo: Remove flex-shrink-0 once Tailwind 3 is live -->
      <BalAsset
        :address="token.address"
        :class="
          isDeepPool && currentLevel > 1
            ? 'nested-token'
            : 'flex-shrink-0 mr-2 shrink-0 z-10'
        "
        :size="isDeepPool && currentLevel > 1 ? 28 : 36"
      />
      <span
        class="group-hover:text-purple-500 dark:group-hover:text-yellow-500 transition-colors"
        >{{ token?.symbol || '---' }}</span
      >
      <BalIcon
        name="arrow-up-right"
        size="sm"
        class="ml-1 text-gray-500 group-hover:text-purple-500 dark:group-hover:text-yellow-500 transition-colors"
      />
    </BalLink>
    <div v-if="isWeighted" class="justify-self-end">
      {{ tokenWeightLabel }}
    </div>
    <div class="justify-self-end">
      {{ balanceLabel }}
    </div>
    <div class="justify-self-end">
      {{ fiatLabel }}
    </div>
  </div>

  <template v-if="isDeepPool">
    <TokenBreakdown
      v-for="nestedToken in token.token?.pool?.tokens"
      :key="nestedToken.address"
      :token="nestedToken"
      :shareOfParentInPool="shareOfTokenInPool"
      :parentLevel="currentLevel"
      :isWeighted="isWeighted"
      :isDeepPool="isDeepPool"
    />
  </template>
</template>
<style scoped>
.nested-token {
  @apply flex-shrink-0 mr-2 relative ml-1 sm:ml-0;
}

.nested-token :deep(img) {
  position: relative;
  z-index: 1;
}

.nested-token::after {
  content: '';
  top: 14px;
  left: -15px;
  @apply absolute border border-solid bg-gray-200 border-gray-200 dark:border-gray-700 w-3 dark:bg-gray-700;
}

.nested-token::before {
  content: '';
  height: calc(100% + 14px);
  left: -15px;
  top: -28px;
  @apply absolute border bg-gray-200 border-gray-200 dark:border-gray-700 dark:bg-gray-700;
}

.level-1 {
  @apply pl-4;
}

.level-2 {
  @apply pl-12;
}

.level-3 {
  @apply pl-20 relative -left-1;
}

.level-3 a {
  @apply relative;
}

.level-3 a::before {
  content: '';
  height: calc(100% + 16px);
  left: -36px;
  top: -28px;
  @apply absolute bg-gray-200 border border-gray-200 dark:border-gray-700 dark:bg-gray-700;
}

@media (min-width: 640px) {
  .level-3 a::before {
    left: -43px;
  }
}

.level-3:last-child a::before,
.level-3:nth-last-child(2) a::before {
  content: '';
  @apply border-0;
}

.level-4 {
  @apply pl-24;
}
</style>
