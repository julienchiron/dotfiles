# TODO

## À faire

- [ ] Aligner le PATH Python de `.bash_profile` (3.8) avec l'alias `python=python3`
      du `.bashrc` (versions incohérentes).
- [ ] Ajouter une config macOS (`macos/.defaults` ou équivalent) ?
- [ ] Lier d'autres skills / configuration Claude Code (settings, hooks).
- [ ] Documenter la désinstallation (restauration des `*-backup`).

## Fait (historique des modifications)

### 2026-09
- Gestion des skills Claude Code : ajout du skill `baid` (boîte à idées) et lien
  `claude/skills` → `~/.claude/skills` dans `install.sh`.
- Nettoyage de la config Bash : suppression d'alias SSH obsolètes,
  mise à jour de `.bash_profile` (priorité `~/.local/bin`, complétion `mole`),
  `.DS_Store` ajouté au `.gitignore`.

### 2024-03
- Support de `.bash_profile` : ajout du fichier, chargement de `.bashrc` depuis
  `.bash_profile`, lien créé par `install.sh`.
- Ajout d'un alias supplémentaire dans `.bashrc`.

### 2021-06
- Support ctags : hooks Git (`ctags`, `post-checkout`, `post-commit`,
  `post-merge`, `post-rewrite`), `templatedir` dans `.gitconfig`, génération de
  `tags` et `set path+=**` dans Vim.
- Ajout de supertab et de raccourcis `coverage.py`.
- Branche Git affichée dans le prompt Bash.

### 2021-05
- Support des snippets Vim (`snippets.vim`, snippets HTML) + correction du chemin.
- Gros nettoyage du `.vimrc`.
- Raccourcis Python/Django (Bash + Vim), venv (`va`), YCM puis jedi-vim.
- Raccourcis de navigation buffers, réglages divers Vim et Git.

### 2021-04
- Commit initial, `README.md`, `TODO.md`.
- `.vimrc` : options de base, support des plugins (vim-plug), molokai.
- `.gitconfig` : identité, éditeur, alias.
- Support Bash (`.bashrc`), `.gitignore`.
- `install.sh` : création des liens symboliques avec sauvegarde préalable des
  fichiers existants en `*-backup`.
