# Istruzioni per completare il deployment

Abbiamo preparato il codice per il deploy su GitHub Pages nel repository Krustycoin0/ba.git, ma il push non è stato completato a causa di permessi insufficienti. Segui questi passaggi per completare il deployment:

## 1. Autenticazione GitHub

È necessario avere le credenziali corrette per accedere al repository `Krustycoin0/ba.git`. Esistono due opzioni:

### Opzione A: Usare un token di accesso personale (PAT)

1. Accedi al tuo account GitHub
2. Vai a Settings > Developer settings > Personal access tokens > Tokens (classic)
3. Genera un nuovo token con i permessi `repo`
4. Copia il token generato

Quindi configura Git usando:

```bash
git config --global credential.helper store
git push -u origin main
```

Quando richiesto, inserisci il tuo username GitHub e il token come password.

### Opzione B: Configurare le chiavi SSH

1. Genera una chiave SSH: `ssh-keygen -t ed25519 -C "tua-email@esempio.com"`
2. Aggiungi la chiave al tuo account GitHub (Settings > SSH and GPG keys)
3. Configura il remote per usare SSH:
   ```bash
   git remote set-url origin git@github.com:Krustycoin0/ba.git
   ```
4. Fai il push: `git push -u origin main`

## 2. Configurazione di GitHub Pages

Dopo aver fatto il push del codice al repository:

1. Vai alle impostazioni del repository su GitHub (Settings)
2. Scorri fino alla sezione "Pages"
3. In "Source", seleziona il branch "main"
4. Salva le impostazioni e attendi il deployment

## 3. Verifica del deployment

Il sito sarà accessibile all'indirizzo: `https://krustycoin0.github.io/ba/`

## Note importanti

- I file sono stati configurati per funzionare correttamente con il percorso `https://krustycoin0.github.io/ba/`
- È stata creata la configurazione per GitHub Pages incluso il file 404.html per gestire correttamente le route SPA
- La configurazione dei file ambientali è stata ottimizzata per GitHub Pages

Per qualsiasi problema, controlla i log di GitHub Actions o le impostazioni di Pages nella sezione repository. 