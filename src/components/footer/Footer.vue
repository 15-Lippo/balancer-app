<template>
  <footer v-once>
    <div
      class="xl:container lg:px-4 xl:mx-auto dark:border-t dark:border-gray-800"
    >
      <div
        class="flex flex-col md:flex-row gap-8 md:justify-between py-12 px-4 lg:px-0 text-primary"
      >
        <div class="flex flex-col gap-8">
          <router-link
            class="font-medium link"
            :to="{ name: 'home', params: { networkSlug } }"
          >
            <AppLogo class="mb-4" />
          </router-link>

          <div class="flex md:hidden flex-col gap-2">
            <p>
              <router-link
                class="text-lg font-medium link"
                :to="{ name: 'home', params: { networkSlug } }"
              >
                {{ $t('pool') }}
              </router-link>
            </p>
            <p>
              <router-link
                class="text-lg font-medium link"
                :to="{ name: 'trade', params: { networkSlug } }"
              >
                {{ $t('swap') }}
              </router-link>
            </p>
            <p>
              <router-link
                class="text-lg font-medium link"
                :to="{ name: 'claim', params: { networkSlug } }"
              >
                {{ $t('claim') }}
              </router-link>
            </p>
            <p>
              <router-link
                class="text-lg font-medium link"
                :to="{ name: 'portfolio', params: { networkSlug } }"
              >
                {{ $t('portfolio') }}
              </router-link>
            </p>
            <p>
              <router-link
                class="text-lg font-medium link"
<<<<<<< HEAD
                :to="{ name: 'crypto-charts', params: { networkSlug } }"
              >
                {{ $t('cryptoCharts.title') }}
=======
                :to="{ name: 'vebal', params: { networkSlug } }"
              >
                {{ $t('vebal') }}
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              </router-link>
            </p>
          </div>

          <div class="flex flex-wrap md:order-3 gap-3 md:gap-4">
            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.Home"
=======
              :href="EXTERNAL_LINKS.Balancer.Home"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
<<<<<<< HEAD
              {{ $t('ecosystem') }}
=======
              {{ $t('about') }}
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>

            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.Docs"
=======
              :href="EXTERNAL_LINKS.Balancer.Docs"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
              {{ $t('docs') }}
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>

            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.Forum"
=======
              :href="EXTERNAL_LINKS.Balancer.Forum"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
              {{ $t('forum') }}
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>

            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.Vote"
=======
              :href="EXTERNAL_LINKS.Balancer.Vote"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
              {{ $t('vote') }}
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>

            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.Grants"
=======
              :href="EXTERNAL_LINKS.Balancer.Grants"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
              {{ $t('grants') }}
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>

            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.BugBounty"
=======
              :href="EXTERNAL_LINKS.Balancer.BugBounty"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
              {{ $t('bugBounty') }}
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>

            <BalLink
<<<<<<< HEAD
              :href="EXTERNAL_LINKS.LisproCoin.Analytics"
=======
              :href="EXTERNAL_LINKS.Balancer.Analytics"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
              external
              noStyle
              class="group link link--external"
            >
              {{ $t('analytics') }}
              <BalIcon name="arrow-up-right" size="sm" class="arrow" />
            </BalLink>
          </div>
        </div>
        <div class="flex flex-col gap-8">
          <div class="md:order-2">
            <div class="flex lg:flex-col md:justify-end">
              <div class="flex gap-3 md:justify-end">
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Twitter"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Twitter"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconTwitter />
                </BalLink>
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Discord"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Discord"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconDiscord />
                </BalLink>
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Medium"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Medium"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconMedium />
                </BalLink>
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Youtube"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Youtube"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconYoutube />
                </BalLink>
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Github"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Github"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconGithub />
                </BalLink>
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Linkedin"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Linkedin"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconLinkedin />
                </BalLink>
                <BalLink
<<<<<<< HEAD
                  :href="EXTERNAL_LINKS.LisproCoin.Social.Mail"
=======
                  :href="EXTERNAL_LINKS.Balancer.Social.Mail"
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
                  external
                  noStyle
                >
                  <IconMail />
                </BalLink>
              </div>
            </div>
          </div>

          <div
            class="flex flex-wrap md:order-3 gap-x-3 lg:gap-x-4 gap-y-2 md:justify-end"
          >
            <p>
              <router-link class="policy" :to="{ name: 'terms-of-use' }">
                {{ $t('policies.termsOfUse') }}
              </router-link>
            </p>
            <p>
              <router-link class="policy" :to="{ name: 'privacy-policy' }">
                {{ $t('policies.privacyPolicy') }}
              </router-link>
            </p>
            <p>
              <router-link class="policy" :to="{ name: 'cookies-policy' }">
                {{ $t('policies.cookiesPolicy') }}
              </router-link>
            </p>
            <p>
              <a
                class="policy"
                @click="isThirdPartyServicesModalVisible = true"
                >{{ $t('policies.thirdPartyServices') }}</a
              >
            </p>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
import { useI18n } from 'vue-i18n';

import { isThirdPartyServicesModalVisible } from '@/App.vue';
import IconDiscord from '@/components/icons/IconDiscord.vue';
import IconGithub from '@/components/icons/IconGithub.vue';
import IconLinkedin from '@/components/icons/IconLinkedin.vue';
import IconMail from '@/components/icons/IconMail.vue';
import IconMedium from '@/components/icons/IconMedium.vue';
import IconTwitter from '@/components/icons/IconTwitter.vue';
import IconYoutube from '@/components/icons/IconYoutube.vue';
import { EXTERNAL_LINKS } from '@/constants/links';

import useNetwork from '@/composables/useNetwork';

import AppLogo from '../images/AppLogo.vue';

export default {
  components: {
    IconTwitter,
    IconDiscord,
    IconMedium,
    IconYoutube,
    IconGithub,
    IconMail,
    IconLinkedin,
    AppLogo,
  },
  setup() {
    const { t } = useI18n();
    const { networkSlug } = useNetwork();

    return {
      EXTERNAL_LINKS,
      t,
      networkSlug,
      isThirdPartyServicesModalVisible,
    };
  },
};
</script>

<style scoped>
footer {
  @apply bg-gray-50 dark:bg-gray-900;
}

footer :deep(.logotype) {
  @apply origin-top-left;

  transform: scale(1.5);
}

.link {
  @apply text-black dark:text-white transition-colors flex items-center no-underline hover:text-purple-600;
}

.link--external {
  @apply text-sm;
}

.link:hover,
.link:focus-visible {
  @apply text-purple-600 dark:text-yellow-500 no-underline;
}

.link:focus:not(:focus-visible) {
  outline: none;
}

.policy {
  @apply text-sm text-gray-600 dark:text-gray-400 hover:text-purple-600 dark:hover:text-yellow-500;
}

.arrow {
  @apply text-gray-300 dark:text-gray-600 group-hover:text-purple-600 dark:group-hover:text-yellow-500;
}

.router-link-active {
  @apply text-blue-600 dark:text-blue-400;
}
</style>
