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
