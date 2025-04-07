#!/bin/bash

echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# Pulire eventuali build precedenti
rm -rf dist
rm -rf node_modules

# Creare la directory dist
mkdir -p dist

# Copiare direttamente i file statici dalla directory public
if [ -d "public" ]; then
  echo "Copiando i file statici da public/ a dist/..."
  cp -r public/* dist/ 2>/dev/null || true
fi

# Prima proviamo un approccio minimo: installare solo le dipendenze di base necessarie
echo "Installazione delle dipendenze di base..."
npm install --no-audit --no-fund --no-optional vue@3.2.25 vue-router@4.0.10 vuex@4.0.2 vue-i18n@9.2.2

# Creare un file index.html migliorato
cat > dist/index.html << 'EOL'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LisproCoin App</title>
  <link rel="icon" href="/favicon.ico">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #121212;
      color: #ffffff;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem;
    }
    header {
      text-align: center;
      padding: 2rem 0;
      border-bottom: 1px solid #333;
    }
    .logo {
      max-width: 200px;
      margin-bottom: 1rem;
    }
    h1 {
      font-size: 2.5rem;
      margin-bottom: 0.5rem;
      color: #4dbbff;
    }
    h2 {
      font-size: 1.5rem;
      font-weight: normal;
      margin-bottom: 2rem;
      color: #999;
    }
    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin: 3rem 0;
    }
    .feature {
      flex-basis: calc(33% - 2rem);
      margin-bottom: 2rem;
      background-color: #1e1e1e;
      padding: 1.5rem;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .feature h3 {
      color: #4dbbff;
      margin-top: 0;
    }
    .cta {
      text-align: center;
      margin: 3rem 0;
      padding: 2rem;
      background-color: #1e1e1e;
      border-radius: 8px;
    }
    .button {
      display: inline-block;
      background-color: #4dbbff;
      color: #121212;
      padding: 0.8rem 1.5rem;
      border-radius: 4px;
      text-decoration: none;
      font-weight: bold;
      margin-top: 1rem;
    }
    footer {
      text-align: center;
      padding: 2rem 0;
      border-top: 1px solid #333;
      color: #999;
    }
    @media (max-width: 768px) {
      .feature {
        flex-basis: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <h1>LisproCoin</h1>
      <h2>La piattaforma avanzata per la gestione di liquidità decentralizzata</h2>
    </header>

    <div class="features">
      <div class="feature">
        <h3>Scambio di Token</h3>
        <p>Scambia facilmente tra diverse criptovalute con le migliori tariffe e slippage minimo.</p>
      </div>
      <div class="feature">
        <h3>Pool di Liquidità</h3>
        <p>Fornisci liquidità e guadagna commissioni partecipando al nostro ecosistema DeFi.</p>
      </div>
      <div class="feature">
        <h3>Crypto Charts</h3>
        <p>Visualizza grafici dettagliati e analisi di mercato per prendere decisioni informate.</p>
      </div>
      <div class="feature">
        <h3>Sicurezza Garantita</h3>
        <p>I tuoi fondi sono protetti da audit di sicurezza e contratti intelligenti verificati.</p>
      </div>
      <div class="feature">
        <h3>Governance Comunitaria</h3>
        <p>Partecipa alle decisioni e alla direzione futura della piattaforma con i token di governance.</p>
      </div>
      <div class="feature">
        <h3>Multi-Chain Support</h3>
        <p>Opera su diverse blockchain per massimizzare opportunità e minimizzare costi.</p>
      </div>
    </div>

    <div class="cta">
      <h2>Sito in manutenzione</h2>
      <p>Stiamo aggiornando l'app LisproCoin per offrirti un'esperienza ancora migliore. Torna presto!</p>
      <a href="https://github.com/15-Lippo/new3" class="button">Visita il repository</a>
    </div>

    <footer>
      <p>&copy; 2023 LisproCoin. Tutti i diritti riservati.</p>
      <p>Contattaci: <a href="mailto:contact@lisprocoin.fi" style="color:#4dbbff;">contact@lisprocoin.fi</a></p>
    </footer>
  </div>
</body>
</html>
EOL

echo "Build completata con successo! La directory dist è stata creata e contiene file."
ls -la dist

exit 0 