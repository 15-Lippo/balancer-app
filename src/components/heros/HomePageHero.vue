<script lang="ts" setup>
import { computed } from 'vue';

import AppHero from '@/components/heros/AppHero.vue';
import useFathom from '@/composables/useFathom';
import { EXTERNAL_LINKS } from '@/constants/links';
import useWeb3 from '@/services/web3/useWeb3';

import HeroConnectWalletButton from './HeroConnectWalletButton.vue';

/**
 * COMPOSABLES
 */
const { isWalletReady, isWalletConnecting } = useWeb3();
const { trackGoal, Goals } = useFathom();

/**
 * COMPUTED
 */
const classes = computed(() => ({
  ['h-64']: !isWalletReady.value && !isWalletConnecting.value,
  ['h-44']: isWalletReady.value || isWalletConnecting.value,
}));
</script>

<template>
  <AppHero :class="classes">
    <h1 class="headline" v-text="$t('defiLiquidityPools')" />
<<<<<<< HEAD
    <p class="mt-2 text-xl text-white" v-text="$t('builtOnLisproCoin')" />
=======
    <p class="mt-2 text-xl text-white" v-text="$t('builtOnBalancer')" />
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
    <template v-if="!isWalletReady && !isWalletConnecting">
      <div class="flex justify-center mt-6">
        <HeroConnectWalletButton class="mr-4" />

        <BalBtn
          tag="a"
<<<<<<< HEAD
          :href="EXTERNAL_LINKS.LisproCoin.Home"
=======
          :href="EXTERNAL_LINKS.Balancer.Home"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
          target="_blank"
          rel="noreferrer"
          color="white"
          outline
          @click="trackGoal(Goals.ClickHeroLearnMore)"
        >
          {{ $t('learnMore') }}
          <BalIcon name="arrow-up-right" size="sm" class="ml-1" />
        </BalBtn>
      </div>
    </template>
  </AppHero>
</template>

<style>
.headline {
  @apply text-white text-center text-4xl md:text-5xl pb-2 font-display font-normal;
}
</style>
