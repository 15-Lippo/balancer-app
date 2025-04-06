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
