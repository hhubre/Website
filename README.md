---

## 🔐 Admin UI — modifier les entrées & uploader des fichiers audio

J'ai ajouté `admin.html` : c'est une interface simple qui te permet d'éditer, créer ou supprimer des entrées et, si tu le souhaites, d'uploader les fichiers audio directement dans le repo via l'API GitHub.

Important — sécurité :
- Pour autoriser l'upload & la mise à jour automatique, tu dois fournir un **Personal Access Token (PAT)** GitHub avec le scope `repo` (ou `public_repo` si repo public). Le PAT est utilisé uniquement dans le navigateur courant et **n'est pas stocké**.
- Si tu exposes le PAT, révoque‑le immédiatement : https://github.com/settings/tokens

Usage rapide :
1. Ouvre `admin.html` localement (http://localhost:8000/admin.html) ou depuis le site déployé.
2. Renseigne : GitHub owner (e.g. hhubre), repo (e.g. Website), branch (main), et ton PAT.
3. Édite/ajoute des entrées. Pour l'audio, tu peux :
	- entrer une URL publique (CDN) dans le champ audio, ou
	- sélectionner un fichier local — il sera uploadé vers `audio/<filename>` dans le repo (via GitHub API) lorsque tu cliquera sur "Commit changes to GitHub".
4. Clique sur "Commit changes to GitHub" pour envoyer `data/entries.json` et tous les fichiers audio ajoutés vers la branche spécifiée.

Limitations / points importants :
- La mise à jour automatique est faite via l'API GitHub et nécessite un PAT avec la permission d'écrire dans le repo. Le token est sensible. 
- Les fichiers audio sont ajoutés au repo dans `audio/` — attention à la taille (éviter fichiers très lourds). GitHub limite la taille (≈100 MB par fichier).
- Les fichiers audio sont ajoutés au repo dans `audio/` — attention à la taille (éviter fichiers très lourds). GitHub limite la taille (≈100 MB par fichier).
- Note: the admin UI enforces a client-side upload limit of 25 MB per file; files larger than 25MB will be blocked (you can use external storage for big files).
- Si tu préfères une solution server-side plus sécurisée (upload vers un stockage et une API serverless qui commit sans exposer PAT au navigateur), je peux t'aider à mettre ça en place (ex. serverless function + secrets dans Vercel).

# Mon site vite fait

Petit site statique minimal — prêt à modifier.

- `index.html` — page principale
- `styles.css` — styles principaux
- `script.js` — peu d'interactivité (formulaire d'exemple)

Pour lancer localement (PowerShell) :
cd 'c:\Users\admin\Music\website'
python -m http.server 8000
# puis ouvrez http://localhost:8000 dans votre navigateur
```

---

## 🚀 Déployer sur GitHub Pages

Voici deux méthodes simples pour publier le site sur GitHub Pages.

1) Créer le dépôt sur GitHub (interface web) puis exécuter **depuis PowerShell** :

```powershell
cd 'C:\Users\admin\Music\website'
git init
git add .
git commit -m "Initial site"
# nommez la branche principale `main`
git branch -M main
git remote add origin https://github.com/<TON_UTILISATEUR>/<NOM_DU_REPO>.git
git push -u origin main
```

2) Créer et pousser directement (avec GitHub CLI `gh`) :

```powershell
cd 'C:\Users\admin\Music\website'
gh repo create <TON_UTILISATEUR>/<NOM_DU_REPO> --public --source=. --remote=origin --push
```

Après le push :
- La workflow GitHub Actions `/.github/workflows/pages.yml` construit et publie le repo vers GitHub Pages automatiquement.
- Tu peux accéder au site à l'adresse `https://<TON_UTILISATEUR>.github.io/<NOM_DU_REPO>/` (ou `https://<TON_UTILISATEUR>.github.io/` si le repo s'appelle `<TON_UTILISATEUR>.github.io`).

Remarque : si tu préfères un déploiement classique (branche `gh-pages`), je peux modifier le workflow pour utiliser `peaceiris/actions-gh-pages` au lieu du flux Actions Pages.

---

### ✅ Commandes prêtes pour ton repo `hhubre/Website`

Si tu veux envoyer le contenu exactement vers https://github.com/hhubre/Website.git depuis ce dossier, ouvre PowerShell dans `C:\Users\admin\Music\website` puis exécute :

```powershell
# initial commit (si pas déjà fait)
git init
git add .
git commit -m "Initial site"
git branch -M main
git remote add origin https://github.com/hhubre/Website.git
git push -u origin main
```

J'ai ajouté un script PowerShell prêt à l'emploi `deploy-to-hhubre-website.ps1` qui automatise ces étapes et tentera d'utiliser `gh` si tu veux créer le repo automatiquement.

```powershell
# exécute depuis le dossier du projet
.\deploy-to-hhubre-website.ps1
# pour forcer la création via gh (si installé et connecté)
.\deploy-to-hhubre-website.ps1 -ForceCreateRepoWithGH
```

Après push, vérifie dans GitHub : Actions → Pages pour t'assurer que le workflow `Deploy static site to GitHub Pages` s'est exécuté et que GitHub Pages a publié ton site.

---

## 🛠 Installer Git sur Windows (automatique)

Si PowerShell te dit `git n'est pas reconnu`, j'ai ajouté un script pour installer Git automatiquement : `install-git-windows.ps1`.

Prérequis : Ouvrir PowerShell en MODE ADMINISTRATEUR (clic droit → Exécuter en tant qu'administrateur) puis depuis le dossier du projet exécuter :

```powershell
# place-to-run: C:\Users\admin\Music\website
.\install-git-windows.ps1

# Si tu veux que le script tente de créer le repo avec GitHub CLI (gh) si présent:
.\install-git-windows.ps1 -ForceCreateRepoWithGH
```

Le script essaiera, dans cet ordre :
- `winget` (préféré)
- `choco` (Chocolatey)
- téléchargement et exécution de l'installateur officiel Git for Windows (fallback)

Après installation : ferme puis rouvre PowerShell / VS Code pour que `git` soit trouvé dans PATH, puis vérifie :

```powershell
git --version
```
<<<<<<< HEAD
# Website
=======
# Mon site vite fait

Petit site statique minimal — prêt à modifier.

Fichiers importants:
- `index.html` — page principale
- `styles.css` — styles principaux
- `script.js` — peu d'interactivité (formulaire d'exemple)

Pour lancer localement (PowerShell) :

```powershell
cd 'c:\Users\admin\Music\website'
python -m http.server 8000
# puis ouvrez http://localhost:8000 dans votre navigateur
```

---

## 🚀 Déployer sur GitHub Pages

Voici deux méthodes simples pour publier le site sur GitHub Pages.

1) Créer le dépôt sur GitHub (interface web) puis exécuter **depuis PowerShell** :

```powershell
cd 'C:\Users\admin\Music\website'
git init
git add .
git commit -m "Initial site"
# nommez la branche principale `main`
git branch -M main
git remote add origin https://github.com/<TON_UTILISATEUR>/<NOM_DU_REPO>.git
git push -u origin main
```

2) Créer et pousser directement (avec GitHub CLI `gh`) :

```powershell
cd 'C:\Users\admin\Music\website'
gh repo create <TON_UTILISATEUR>/<NOM_DU_REPO> --public --source=. --remote=origin --push
```

Après le push :
- La workflow GitHub Actions `/.github/workflows/pages.yml` construit et publie le repo vers GitHub Pages automatiquement.
- Tu peux accéder au site à l'adresse `https://<TON_UTILISATEUR>.github.io/<NOM_DU_REPO>/` (ou `https://<TON_UTILISATEUR>.github.io/` si le repo s'appelle `<TON_UTILISATEUR>.github.io`).

Remarque : si tu préfères un déploiement classique (branche `gh-pages`), je peux modifier le workflow pour utiliser `peaceiris/actions-gh-pages` au lieu du flux Actions Pages.

---

### ✅ Commandes prêtes pour ton repo `hhubre/Website`

Si tu veux envoyer le contenu exactement vers https://github.com/hhubre/Website.git depuis ce dossier, ouvre PowerShell dans `C:\Users\admin\Music\website` puis exécute :

```powershell
# initial commit (si pas déjà fait)
git init
git add .
git commit -m "Initial site"
git branch -M main
git remote add origin https://github.com/hhubre/Website.git
git push -u origin main
```

J'ai ajouté un script PowerShell prêt à l'emploi `deploy-to-hhubre-website.ps1` qui automatise ces étapes et tentera d'utiliser `gh` si tu veux créer le repo automatiquement.

```powershell
# exécute depuis le dossier du projet
.\deploy-to-hhubre-website.ps1
# pour forcer la création via gh (si installé et connecté)
.\deploy-to-hhubre-website.ps1 -ForceCreateRepoWithGH
```

Après push, vérifie dans GitHub : Actions → Pages pour t'assurer que le workflow `Deploy static site to GitHub Pages` s'est exécuté et que GitHub Pages a publié ton site.

---

## 🛠 Installer Git sur Windows (automatique)

Si PowerShell te dit `git n'est pas reconnu`, j'ai ajouté un script pour installer Git automatiquement : `install-git-windows.ps1`.

Prérequis : Ouvrir PowerShell en MODE ADMINISTRATEUR (clic droit → Exécuter en tant qu'administrateur) puis depuis le dossier du projet exécuter :

```powershell
# place-to-run: C:\Users\admin\Music\website
.\install-git-windows.ps1

# Si tu veux que le script tente de créer le repo avec GitHub CLI (gh) si présent:
.\install-git-windows.ps1 -ForceCreateRepoWithGH
```

Le script essaiera, dans cet ordre :
- `winget` (préféré)
- `choco` (Chocolatey)
- téléchargement et exécution de l'installateur officiel Git for Windows (fallback)

Après installation : ferme puis rouvre PowerShell / VS Code pour que `git` soit trouvé dans PATH, puis vérifie :

```powershell
git --version
```



>>>>>>> 74885ad (Initial site)
