<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useI18n } from 'vue-i18n';
import * as echarts from 'echarts';

const { t } = useI18n();
const chartContainer = ref<HTMLElement | null>(null);
const btcChartContainer = ref<HTMLElement | null>(null);
const ethChartContainer = ref<HTMLElement | null>(null);
const xrpChartContainer = ref<HTMLElement | null>(null);
const loading = ref(true);

const theme = {
  color: [
    '#00a7e7',
    '#ffde59',
    '#c23531',
    '#2f4554',
    '#61a0a8',
    '#d48265',
    '#91c7ae',
    '#749f83',
    '#ca8622',
    '#bda29a',
    '#6e7074',
    '#546570',
    '#c4ccd3'
  ]
};

onMounted(async () => {
  if (chartContainer.value) {
    const marketCapChart = echarts.init(chartContainer.value, theme);
    
    // Impostazioni del grafico
    const marketCapOption = {
      title: {
        text: t('cryptoCharts.marketCap'),
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross',
          label: {
            backgroundColor: '#6a7985'
          }
        }
      },
      legend: {
        data: ['Bitcoin', 'Ethereum', 'XRP', 'LisproCoin', 'Cardano'],
        top: 30
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu', 'Lug', 'Ago', 'Set', 'Ott', 'Nov', 'Dic']
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter: '${value}B'
        }
      },
      series: [
        {
          name: 'Bitcoin',
          type: 'line',
          data: [480, 520, 550, 500, 480, 590, 600, 580, 550, 500, 520, 560]
        },
        {
          name: 'Ethereum',
          type: 'line',
          data: [220, 240, 250, 230, 220, 270, 280, 260, 245, 230, 240, 250]
        },
        {
          name: 'XRP',
          type: 'line',
          data: [40, 42, 45, 41, 38, 47, 50, 48, 45, 42, 44, 46]
        },
        {
          name: 'LisproCoin',
          type: 'line',
          data: [20, 35, 45, 60, 80, 95, 110, 120, 135, 150, 165, 180]
        },
        {
          name: 'Cardano',
          type: 'line',
          data: [30, 32, 34, 32, 30, 36, 38, 37, 35, 33, 34, 36]
        }
      ]
    };

    marketCapChart.setOption(marketCapOption);
  }

  if (btcChartContainer.value) {
    const btcChart = echarts.init(btcChartContainer.value, theme);
    
    const btcOption = {
      title: {
        text: 'Bitcoin (BTC)',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross'
        },
        formatter: function (params: any) {
          const date = params[0].axisValue;
          const price = params[0].data;
          return `${date}<br/>Prezzo: $${price.toLocaleString()}`;
        }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        data: ['Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu', 'Lug', 'Ago', 'Set', 'Ott', 'Nov', 'Dic']
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter: '${value}'
        }
      },
      series: [
        {
          data: [42000, 44000, 46000, 41000, 38000, 50000, 52000, 48000, 45000, 43000, 44000, 47000],
          type: 'line',
          smooth: true,
          lineStyle: {
            width: 3,
            color: '#f7931a'
          },
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: 'rgba(247, 147, 26, 0.5)'
              },
              {
                offset: 1,
                color: 'rgba(247, 147, 26, 0.1)'
              }
            ])
          }
        }
      ]
    };

    btcChart.setOption(btcOption);
  }

  if (ethChartContainer.value) {
    const ethChart = echarts.init(ethChartContainer.value, theme);
    
    const ethOption = {
      title: {
        text: 'Ethereum (ETH)',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross'
        },
        formatter: function (params: any) {
          const date = params[0].axisValue;
          const price = params[0].data;
          return `${date}<br/>Prezzo: $${price.toLocaleString()}`;
        }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        data: ['Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu', 'Lug', 'Ago', 'Set', 'Ott', 'Nov', 'Dic']
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter: '${value}'
        }
      },
      series: [
        {
          data: [3200, 3400, 3600, 3100, 2800, 3700, 3900, 3700, 3500, 3300, 3400, 3500],
          type: 'line',
          smooth: true,
          lineStyle: {
            width: 3,
            color: '#627eea'
          },
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: 'rgba(98, 126, 234, 0.5)'
              },
              {
                offset: 1,
                color: 'rgba(98, 126, 234, 0.1)'
              }
            ])
          }
        }
      ]
    };

    ethChart.setOption(ethOption);
  }

  if (xrpChartContainer.value) {
    const xrpChart = echarts.init(xrpChartContainer.value, theme);
    
    const xrpOption = {
      title: {
        text: 'LisproCoin (LSP)',
        left: 'center'
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'cross'
        },
        formatter: function (params: any) {
          const date = params[0].axisValue;
          const price = params[0].data;
          return `${date}<br/>Prezzo: $${price.toFixed(2)}`;
        }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis: {
        type: 'category',
        data: ['Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu', 'Lug', 'Ago', 'Set', 'Ott', 'Nov', 'Dic']
      },
      yAxis: {
        type: 'value',
        axisLabel: {
          formatter: '${value}'
        }
      },
      series: [
        {
          data: [1.2, 2.1, 2.8, 3.7, 5.2, 6.1, 7.3, 8.0, 9.0, 10.0, 11.0, 12.0],
          type: 'line',
          smooth: true,
          lineStyle: {
            width: 3,
            color: '#00a7e7'
          },
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: 'rgba(0, 167, 231, 0.5)'
              },
              {
                offset: 1,
                color: 'rgba(255, 222, 89, 0.1)'
              }
            ])
          }
        }
      ]
    };

    xrpChart.setOption(xrpOption);
  }

  loading.value = false;

  // Resize dei grafici quando la finestra viene ridimensionata
  window.addEventListener('resize', () => {
    if (chartContainer.value) {
      const chart = echarts.getInstanceByDom(chartContainer.value);
      chart?.resize();
    }
    if (btcChartContainer.value) {
      const chart = echarts.getInstanceByDom(btcChartContainer.value);
      chart?.resize();
    }
    if (ethChartContainer.value) {
      const chart = echarts.getInstanceByDom(ethChartContainer.value);
      chart?.resize();
    }
    if (xrpChartContainer.value) {
      const chart = echarts.getInstanceByDom(xrpChartContainer.value);
      chart?.resize();
    }
  });
});
</script>

<template>
  <div class="crypto-charts">
    <div class="xl:container xl:mx-auto px-4 py-8">
      <div class="mb-8">
        <h1 class="text-3xl font-bold mb-4">{{ t('cryptoCharts.title') }}</h1>
        <p class="text-gray-600 dark:text-gray-400">{{ t('cryptoCharts.description') }}</p>
      </div>

      <div v-if="loading" class="flex justify-center items-center h-64">
        <BalLoadingIcon class="w-12 h-12" />
      </div>

      <div v-else class="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <div class="chart-container bg-white dark:bg-gray-800 rounded-lg shadow-lg p-4">
          <div ref="chartContainer" class="h-80"></div>
        </div>

        <div class="chart-container bg-white dark:bg-gray-800 rounded-lg shadow-lg p-4">
          <div ref="btcChartContainer" class="h-80"></div>
        </div>

        <div class="chart-container bg-white dark:bg-gray-800 rounded-lg shadow-lg p-4">
          <div ref="ethChartContainer" class="h-80"></div>
        </div>

        <div class="chart-container bg-white dark:bg-gray-800 rounded-lg shadow-lg p-4">
          <div ref="xrpChartContainer" class="h-80"></div>
        </div>
      </div>

      <div class="mt-8 bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6">
        <h2 class="text-xl font-bold mb-4">{{ t('cryptoCharts.marketInsights') }}</h2>
        <p class="mb-4">
          {{ t('cryptoCharts.marketInsightsDesc1') }}
        </p>
        <p class="mb-4">
          {{ t('cryptoCharts.marketInsightsDesc2') }}
        </p>
        <p>
          {{ t('cryptoCharts.marketInsightsDesc3') }}
        </p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.chart-container {
  transition: transform 0.3s;
}

.chart-container:hover {
  transform: translateY(-5px);
}
</style> 