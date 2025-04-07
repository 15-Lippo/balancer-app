<<<<<<< HEAD
# LisproCoin App

Questa è l'app ufficiale LisproCoin, deployata dal repository principale.

## Informazioni

Questa applicazione è una fork di Balancer App, un'interfaccia frontend per il protocollo Lisprocoin, un protocollo di liquidità automatizzato costruito su Ethereum. Consente agli utenti di scambiare token, fornire liquidità a pool e guadagnare commissioni di trading.

## Caratteristiche

- Scambio di token con slippage minimo
- Fornitura di liquidità a pool diversificati
- Monitoraggio dei propri investimenti
- Votazione per l'allocazione degli incentivi di liquidità con veBAL

## Deployment

Questo repository è il punto di deploy per l'app LisproCoin, accessibile tramite GitHub Pages.

## Licenza

MIT

[![Netlify Status](https://api.netlify.com/api/v1/badges/your-netlify-id/deploy-status)](https://app.netlify.com/sites/lisprocoin/deploys)
[![Vercel](https://therealsujitk-vercel-badge.vercel.app/?app=lisprocoin)](https://lisprocoin.vercel.app)

## Requisiti

- Node.js 14.x o superiore
- NPM 7.x o Yarn 1.22.x

## Installazione

1. Clona il repository
```
git clone https://github.com/Krustycoin0/ba.git
cd ba
```

2. Installa le dipendenze
```
npm install
```
o
```
yarn
```

3. Avvia il server di sviluppo
```
npm run dev
```
o
```
yarn dev
```

## Build per la produzione

```
npm run build
```
o
```
yarn build
```

## Deploy dell'applicazione

### Deploy con Vercel (raccomandato)

Il modo più semplice per deployare l'applicazione è utilizzare Vercel:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2FKrustycoin0%2Fba)

### Deploy manuale su GitHub

Se non hai accesso al repository originale, puoi seguire questi passi:

1. Crea un nuovo repository su GitHub 
2. Prepara un file zip del progetto (escludi node_modules e .git)
3. Scarica il progetto da questa pagina cliccando sul pulsante "Code" -> "Download ZIP"
4. Decomprimi il file e caricalo nel tuo repository personale
5. Segui le istruzioni di deploy sopra indicate

### Deploy con Netlify

Alternativa a Vercel, puoi utilizzare Netlify:

[![Deploy with Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/Krustycoin0/ba)

## Contribuire

Le contribuzioni sono benvenute! Per favore, invia una pull request o apri un issue per discutere i cambiamenti proposti.

## Contatti

- Sito web: [lisprocoin.fi](https://lisprocoin.fi)
- Email: [contact@lisprocoin.fi](mailto:contact@lisprocoin.fi)
- Twitter: [@LisproCoin](https://twitter.com/LisproCoin)
- Discord: [Entra nel server](https://discord.gg/lisprocoin)
=======
# Balancer Frontend App (v2)

Official frontend app for the Balancer protocol (v2).

## Development

To setup the development environment first clone the repo:

```bash
git clone https://github.com/balancer-labs/frontend-v2.git && cd frontend-v2
```

### Local env

Install dependencies:

```bash
npm install
```

Start the app:

```bash
npm run dev
```

The app should be live at [http://localhost:8080](http://localhost:8080)

### Testing

Run unit tests:

```bash
npm run test:unit
```

Run unit tests in watch mode:

```bash
npm run test:unit:watch
```

Run unit tests with coverage:

```bash
npm run test:unit:coverage
```

### Build

Run build:

```bash
npm run build
```

Preview build:

```bash
npm run preview
```

Run build in watch mode:

```bash
npm run build:watch
```

This mode is useful when you need to reproduce/fix bugs/issues in a **production-like** environment.

### Docker

If you'd rather spin up the app in a docker container, first install dependencies to you local folder:

```bash
docker-compose build
docker-compose run --rm web npm i
```

and start the app:

```bash
docker-compose up
```

The app should be live at [http://localhost:8080](http://localhost:8080)

If you are on Apple Silicon, try this:

```bash
export DOCKER_DEFAULT_PLATFORM=linux/amd64
```

source: https://stackoverflow.com/questions/65612411/forcing-docker-to-use-linux-amd64-platform-by-default-on-macos

## Self-Hosting

As we believe in decentralization at all layers, we've made it easy to host your own Balancer Frontend.

### Docker Production Image

We've created a production ready [docker image](./Dockerfile) runs
a pre-built version of Balancer Frontend-v2 using nginx. You'll need your own
[Infura](https://infura.io), [Alchemy](https://www.alchemy.com/), and
[Blocknative](https://blocknative.com) API keys in order to fetch data and
execute transactions.

Here's an example of how to run the container. This can also be found in [scripts/run-docker.sh](./scripts/run-docker.sh).

```bash
docker run \
  -e INFURA_PROJECT_ID=   \ # Required
  -e ALCHEMY_KEY=         \ # Required
  -e BLOCKNATIVE_DAPP_ID= \ # Required
  balancerfi/frontend-v2
```

### One Click Deploys

The frontend can easily be deployed to any static host. Use the buttons below to spin up an instance. You will be prompted to provide your Infura Project ID, Alchemy Key, and Blocknative Dapp ID as these are required for the frontend to work correctly.

[![Deploy to DO](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/balancer-labs/frontend-v2/tree/master)

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/balancer-labs/frontend-v2)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/balancer-labs/frontend-v2)

## Vite setup

This app is powered by [vite](https://vitejs.dev/), which:

- Runs a development dev server with [esbuild](https://esbuild.github.io/).
- Builds production bundle with [Rollup](https://rollupjs.org/guide/en/).

Both tools above rely on native ES modules but our app also depends on libraries like [ethers.js](https://docs.ethers.io/) which use Node.js built-in modules (like Buffer, stream or crypto) that require browser polyfills. Thats why our `vite.config.ts` uses [vite-plugin-node-stdlib-browser](https://github.com/sodatea/vite-plugin-node-stdlib-browser) and [rollup-plugin-polyfill-node](https://www.npmjs.com/package/rollup-plugin-polyfill-node).

### unplugin-vue magic 🪄

We use some Vite plugins to improve the Vue developer experience.

[unplugin-vue-components](https://github.com/antfu/unplugin-vue-components):

Auto imports components located in `src/components/_global` so that they are available from every other component in the application (and from _vitest_).
(It also auto generates a _d.ts_ file for the auto imported components).

### Analyze bundle

Analyze and visualize the bundle dependencies by adding these env vars to your `.env` file before running the build:

```bash
# Local .env file
VITE_BUILD_ANALIZE=true
VITE_BUILD_VISUALIZE=true
```
>>>>>>> 7487bda51304bd4804ce8be1ca2756ab564febd3
