<script lang="ts" setup>
import { ref, watch } from 'vue';
import { useI18n } from 'vue-i18n';
import { useRouter } from 'vue-router';

import AppLogo from '@/components/images/AppLogo.vue';
import useApp from '@/composables/useApp';
import useConfig from '@/composables/useConfig';
import useDarkMode from '@/composables/useDarkMode';
import { sleep } from '@/lib/utils';
import useWeb3 from '@/services/web3/useWeb3';
import useNetwork from '@/composables/useNetwork';
import { Goals, trackGoal } from '@/composables/useFathom';
<<<<<<< HEAD
import { EXTERNAL_LINKS } from '@/constants/links';
=======
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3

/**
 * PROPS & EMITS
 */
const emit = defineEmits(['close']);

/**
 * COMPOSABLES
 */
const { darkMode, toggleDarkMode } = useDarkMode();
const { blockNumber } = useWeb3();
const { networkConfig } = useConfig();
const { version } = useApp();
const { networkSlug } = useNetwork();
const { t } = useI18n();
const router = useRouter();

/**
 * STATE
 */
const blockIcon = ref<HTMLDivElement>();

const navLinks = [
  { label: t('pool'), path: '/', goal: Goals.ClickNavPools },
  { label: t('swap'), path: `/${networkSlug}/trade`, goal: Goals.ClickNavSwap },
  {
    label: t('claim'),
    path: `/${networkSlug}/claim`,
    goal: Goals.ClickNavClaim,
  },
  {
    label: t('portfolio'),
    path: `/${networkSlug}/portfolio`,
    goal: Goals.ClickNavPortfolio,
  },
<<<<<<< HEAD
  { label: t('cryptoCharts.title'), path: `/${networkSlug}/crypto-charts`, goal: Goals.ClickNavPools },
];

const ecosystemLinks = [
  { label: t('build'), url: EXTERNAL_LINKS.LisproCoin.Home },
  { label: t('blog'), url: EXTERNAL_LINKS.LisproCoin.Social.Medium },
  { label: t('docs'), url: EXTERNAL_LINKS.LisproCoin.Docs },
  { label: t('vote'), url: EXTERNAL_LINKS.LisproCoin.Vote },
  { label: t('analytics'), url: EXTERNAL_LINKS.LisproCoin.Analytics },
  { label: t('forum'), url: EXTERNAL_LINKS.LisproCoin.Forum },
  {
    label: t('grants'),
    url: EXTERNAL_LINKS.LisproCoin.Grants,
=======
  { label: 'veBAL', path: `/${networkSlug}/vebal`, goal: Goals.ClickNavVebal },
];

const ecosystemLinks = [
  { label: t('build'), url: 'https://balancer.fi/build' },
  { label: t('blog'), url: 'https://medium.com/balancer-protocol' },
  { label: t('docs'), url: 'https://docs.balancer.fi/' },
  { label: t('governance'), url: 'https://vote.balancer.fi/#/' },
  { label: t('analytics'), url: 'https://dune.xyz/balancerlabs' },
  { label: t('forum'), url: 'https://forum.balancer.fi/' },
  {
    label: t('grants'),
    url: 'http://grants.balancer.community',
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
  },
];

const socialLinks = [
<<<<<<< HEAD
  { component: 'TwitterIcon', url: EXTERNAL_LINKS.LisproCoin.Social.Twitter },
  { component: 'DiscordIcon', url: EXTERNAL_LINKS.LisproCoin.Social.Discord },
  { component: 'MediumIcon', url: EXTERNAL_LINKS.LisproCoin.Social.Medium },
  {
    component: 'YoutubeIcon',
    url: EXTERNAL_LINKS.LisproCoin.Social.Youtube,
  },
  { component: 'GithubIcon', url: EXTERNAL_LINKS.LisproCoin.Social.Github },
=======
  { component: 'TwitterIcon', url: 'https://twitter.com/BalancerLabs' },
  { component: 'DiscordIcon', url: 'https://discord.balancer.fi/' },
  { component: 'MediumIcon', url: 'https://medium.com/balancer-protocol' },
  {
    component: 'YoutubeIcon',
    url: 'https://www.youtube.com/channel/UCBRHug6Hu3nmbxwVMt8x_Ow',
  },
  { component: 'GithubIcon', url: 'https://github.com/balancer-labs/' },
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
];

/**
 * METHODS
 */
async function navTo(path: string, goal: string) {
  trackGoal(goal);
  router.push(path);
  emit('close');
}

/**
 * WATCHERS
 */
watch(blockNumber, async () => {
  blockIcon.value?.classList.add('block-change');
  await sleep(300);
  blockIcon.value?.classList.remove('block-change');
});
</script>

<template>
  <div class="opacity-0 fade-in-delay">
    <div
      class="flex flex-col justify-center px-4 h-20 border-b border-gray-800"
    >
      <AppLogo forceDark />
    </div>

    <div class="grid mt-2 text-lg grid-col-1">
      <div
        v-for="link in navLinks"
        :key="link.label"
        class="side-bar-link"
        @click="navTo(link.path, link.goal)"
      >
        {{ link.label }}
      </div>
    </div>

    <div class="grid mt-5 text-sm grid-col-1">
      <span class="px-4 pb-1 font-medium text-secondary">Ecosystem</span>
      <BalLink
        v-for="link in ecosystemLinks"
        :key="link.url"
        :href="link.url"
        class="flex items-center side-bar-link"
        external
        noStyle
      >
        {{ link.label }}
        <BalIcon name="arrow-up-right" size="sm" class="ml-1 text-secondary" />
      </BalLink>
    </div>

    <div class="px-4 mt-6">
      <div class="mt-2 side-bar-btn" @click="toggleDarkMode">
        <MoonIcon v-if="!darkMode" class="mr-2" />
        <SunIcon v-else class="mr-2" />
        <span>{{ darkMode ? 'Light' : 'Dark' }} mode</span>
      </div>
    </div>

    <div class="grid grid-rows-1 grid-flow-col auto-cols-min gap-2 px-4 mt-4">
      <BalLink
        v-for="link in socialLinks"
        :key="link.component"
        :href="link.url"
        class="social-link"
        noStyle
        external
      >
        <component :is="link.component" />
      </BalLink>
      <BalLink
<<<<<<< HEAD
        href="mailto:contact@lisprocoin.fi"
=======
        href="mailto:contact@balancer.finance"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
        class="social-link"
        noStyle
      >
        <EmailIcon />
      </BalLink>
    </div>

    <div class="px-4 mt-6 text-xs">
      <div class="flex items-center">
        <div
          ref="blockIcon"
          class="w-2 h-2 bg-green-500 rounded-full block-icon"
        />
        <span class="ml-2 text-gray-300">
          {{ networkConfig.name }}: Block {{ blockNumber }}
        </span>
      </div>
      <BalLink
<<<<<<< HEAD
        :href="`https://github.com/lisprocoin/frontend-v2/releases/tag/${version}`"
=======
        :href="`https://github.com/balancer-labs/frontend-v2/releases/tag/${version}`"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
        class="flex items-center mt-2 text-gray-300"
        external
        noStyle
      >
        App: v{{ version }}
        <BalIcon name="arrow-up-right" size="xs" class="ml-1" />
      </BalLink>
    </div>
  </div>
</template>

<style scoped>
.side-bar-link {
  @apply transition duration-300 p-4 py-1.5 hover:bg-gray-850 cursor-pointer;
}

.side-bar-btn {
  @apply flex items-center bg-gray-850 hover:bg-gray-800 rounded-lg p-2 cursor-pointer transition;
}

.social-link {
  @apply w-11 h-11 xs:w-12 xs:h-12  rounded-full bg-gray-850 hover:bg-gray-800 flex items-center justify-center
    text-white cursor-pointer;
}

.social-link > svg {
  @apply w-6 h-6;

  fill: white;
}

.block-icon {
  box-shadow: 0 0 3px 2px theme('colors.green.500');
  transition: box-shadow 0.3s ease-in-out;
}

.block-change {
  box-shadow: 0 0 6px 4px theme('colors.green.500');
}
</style>
