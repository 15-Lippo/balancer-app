#!/bin/bash

# Script per ottimizzare il build per GitHub Pages

echo "🚀 Inizializzazione del build per GitHub Pages..."

# Assicurati che tutte le dipendenze siano installate correttamente
echo "📦 Installo le dipendenze..."
npm install

# Se ci sono errori con il package-lock.json, rimuovilo e riprova
if [ $? -ne 0 ]; then
  echo "⚠️ Errore nell'installazione delle dipendenze. Provo a correggere..."
  rm -f package-lock.json
  npm install --no-package-lock
fi

# Configura le variabili d'ambiente per la produzione
echo "⚙️ Configurazione delle variabili d'ambiente..."
export NODE_ENV=production
export VUE_APP_ENV=production

# Crea una copia di sicurezza di .env.local se esiste
if [ -f .env.local ]; then
  cp .env.local .env.local.backup
fi

# Crea un file .env.local ottimizzato per GitHub Pages
cat > .env.local << EOL
VUE_APP_DOMAIN=https://krustycoin0.github.io/ba
VUE_APP_BASE_URL=/ba/
NODE_ENV=production
VUE_APP_ENV=production
EOL

# Esegui il build
echo "🔨 Esecuzione del build..."
npm run build

# Verifica che il build sia stato completato con successo
if [ $? -eq 0 ]; then
  echo "✅ Build completato con successo!"
  
  # Crea un file .nojekyll per evitare l'elaborazione Jekyll su GitHub Pages
  touch dist/.nojekyll
  
  # Crea un file 404.html che reindirizza alla home page
  cat > dist/404.html << EOL
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>LisproCoin App</title>
    <script type="text/javascript">
      // Single-page application routing
      var segmentCount = 1; // Modificare questo valore in base alla profondità del percorso
      var l = window.location;
      l.replace(
        l.protocol + '//' + l.hostname + (l.port ? ':' + l.port : '') +
        l.pathname.split('/').slice(0, 1 + segmentCount).join('/') + '/?p=/' +
        l.pathname.slice(1).split('/').slice(segmentCount).join('/').replace(/&/g, '~and~') +
        (l.search ? '&q=' + l.search.slice(1).replace(/&/g, '~and~') : '') +
        l.hash
      );
    </script>
  </head>
  <body>
    <p>Reindirizzamento alla home page...</p>
  </body>
</html>
EOL

  # Aggiungi un file di script per il reindirizzamento SPA
  cat > dist/redirect-script.js << EOL
(function() {
  // Gestisce il reindirizzamento per GitHub Pages SPA
  var redirect = sessionStorage.redirect;
  delete sessionStorage.redirect;
  if (redirect && redirect != location.href) {
    history.replaceState(null, null, redirect);
  }
})();
EOL

  echo "📚 File aggiuntivi creati per supportare GitHub Pages"
  echo "🎉 Il progetto è pronto per essere distribuito su GitHub Pages!"

  # Ripristina il file .env.local originale
  if [ -f .env.local.backup ]; then
    mv .env.local.backup .env.local
    echo "🔄 File .env.local ripristinato"
  fi
else
  echo "❌ Si è verificato un errore durante il build"
  
  # Ripristina il file .env.local originale in caso di errore
  if [ -f .env.local.backup ]; then
    mv .env.local.backup .env.local
    echo "🔄 File .env.local ripristinato"
  fi
  
  exit 1
fi 