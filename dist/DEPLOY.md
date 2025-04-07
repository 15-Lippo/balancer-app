# Guida al Deploy di LisproCoin App

Questa guida contiene istruzioni dettagliate per deployare l'applicazione su diverse piattaforme.

## Indice
1. [GitHub Pages](#github-pages)
2. [Vercel](#vercel)
3. [Netlify](#netlify)
4. [Deploy Manuale](#deploy-manuale)

## GitHub Pages

GitHub Pages è un'ottima soluzione gratuita per hostare applicazioni statiche direttamente da un repository GitHub.

### Passi per il deploy:

1. **Clona il repository**
   ```
   git clone https://github.com/Krustycoin0/ba.git
   cd ba
   ```

2. **Installa le dipendenze**
   ```
   npm install
   ```

3. **Configura GitHub Pages nel repository**
   - Vai alle impostazioni del repository
   - Scorri fino alla sezione "GitHub Pages"
   - Seleziona il branch che vuoi pubblicare (solitamente `master` o `main`)
   - Seleziona la cartella "/docs" o "/root" come sorgente
   - Salva le impostazioni

4. **Usa lo script di build ottimizzato**
   ```
   bash gh-pages-build.sh
   ```
   Questo script:
   - Installa le dipendenze necessarie
   - Configura le variabili d'ambiente per GitHub Pages
   - Costruisce l'applicazione
   - Aggiunge file necessari per il funzionamento di una SPA su GitHub Pages

5. **Pusha i contenuti della cartella dist sul branch gh-pages**
   ```
   git add dist -f
   git commit -m "Deploy su GitHub Pages"
   git subtree push --prefix dist origin gh-pages
   ```

6. **Attiva GitHub Pages nelle impostazioni del repository**
   - Vai alle impostazioni del repository
   - Scorri fino alla sezione "GitHub Pages"
   - Seleziona il branch `gh-pages` come sorgente
   - Clicca su "Save"

7. **Utilizza GitHub Actions (opzionale ma consigliato)**
   Il repository contiene già la configurazione per GitHub Actions nel file `.github/workflows/deploy.yml`. Quando fai push sul branch master, l'applicazione verrà automaticamente deployata su GitHub Pages.

## Vercel

Vercel è una piattaforma che offre hosting gratuito ottimizzato per applicazioni frontend con funzionalità avanzate come domini personalizzati, HTTPS, e CDN globale.

### Deploy su Vercel:

1. **Deploy rapido con un click**:
   
   [![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2FKrustycoin0%2Fba)

2. **Deploy manuale**:
   - Crea un account su [Vercel](https://vercel.com/)
   - Installa Vercel CLI: `npm i -g vercel`
   - Naviga nella directory del progetto
   - Esegui: `vercel`
   - Segui le istruzioni per completare il deploy

## Netlify

Netlify è un'altra eccellente piattaforma per il deploy di applicazioni frontend statiche.

### Deploy su Netlify:

1. **Deploy rapido con un click**:
   
   [![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/Krustycoin0/ba)

2. **Deploy manuale**:
   - Crea un account su [Netlify](https://www.netlify.com/)
   - Vai alla dashboard e clicca "New site from Git"
   - Seleziona GitHub e il repository
   - Configura le opzioni di build:
     - Build command: `npm run build`
     - Publish directory: `dist`
   - Clicca "Deploy site"

3. **Configurazione avanzata**:
   Il repository contiene già i file di configurazione per Netlify:
   - `netlify.toml`: Configurazione principale
   - `netlify-build.sh`: Script di build personalizzato
   - `netlify.redirects`: Configurazione delle regole di reindirizzamento

## Deploy Manuale

Se preferisci deployare manualmente l'applicazione su un tuo server o hosting:

1. **Costruisci l'applicazione**:
   ```
   npm run build
   ```

2. **Carica i file**:
   Carica tutti i file dalla directory `dist` sul tuo server web.

3. **Configura il server**:
   - Assicurati che il server sia configurato per servire una Single Page Application
   - Aggiungi una regola di reindirizzamento che reindirizzi tutte le richieste a `index.html`

   **Esempio di configurazione Apache** (.htaccess):
   ```
   <IfModule mod_rewrite.c>
     RewriteEngine On
     RewriteBase /
     RewriteRule ^index\.html$ - [L]
     RewriteCond %{REQUEST_FILENAME} !-f
     RewriteCond %{REQUEST_FILENAME} !-d
     RewriteRule . /index.html [L]
   </IfModule>
   ```

   **Esempio di configurazione Nginx**:
   ```
   location / {
     try_files $uri $uri/ /index.html;
   }
   ```

4. **Verifica l'installazione**:
   Visita il tuo sito per assicurarti che funzioni correttamente.

## Problemi comuni e soluzioni

### Problema: Routes non funzionano dopo il deploy
**Soluzione**: Assicurati che il server sia configurato per gestire una SPA. Per GitHub Pages, utilizza lo script `gh-pages-build.sh` che aggiunge i file necessari per il corretto funzionamento delle routes.

### Problema: Assets (immagini, CSS, JS) non caricati
**Soluzione**: Verifica che le paths siano corrette. Se l'app è hostata in una subdirectory, aggiorna la configurazione Vue (publicPath in vue.config.js).

### Problema: CORS errors quando si accede alle API
**Soluzione**: Controlla che le API permettano richieste dal dominio del tuo sito.

---

Per qualsiasi altro problema, contattare il team di supporto all'indirizzo [contact@lisprocoin.fi](mailto:contact@lisprocoin.fi). 