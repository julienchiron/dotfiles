# dotfiles

Fichiers de configuration personnels de Julien Chiron pour macOS : Bash, Vim, Git
et gestion des skills Claude Code.

Le dépôt est prévu pour être cloné à la racine du répertoire personnel
(`~/.dotfiles`). Le script `install.sh` crée ensuite des liens symboliques vers
les fichiers du dépôt.

## Contenu

```
.dotfiles/
├── install.sh                 # Crée les liens symboliques (sauvegarde l'existant)
├── bash/
│   ├── .bashrc                # Alias, raccourcis, prompt avec branche Git, nvm
│   └── .bash_profile          # Homebrew, PATH (Python, ~/.local/bin), complétion, charge .bashrc
├── git/
│   ├── .gitconfig             # Identité, éditeur, alias, templatedir, branche par défaut « main »
│   └── .git_template/hooks/   # Hooks de génération automatique des tags ctags
│       ├── ctags
│       ├── post-checkout
│       ├── post-commit
│       ├── post-merge
│       └── post-rewrite
├── vim/
│   ├── .vimrc                 # Options, plugins (vim-plug), mappings, débogage, complétion
│   ├── snippets.vim           # Raccourcis de snippets (HTML…)
│   └── snippets/              # Fichiers de snippets
└── claude/
    └── skills/
        └── baid/SKILL.md      # Skill « boîte à idées »
```

## Installation

```bash
git clone <url> ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` renomme tout fichier existant en `*-backup` avant de créer le lien
symbolique. Fichiers liés :

| Source du dépôt              | Cible                  |
| --------------------------- | ---------------------- |
| `git/.gitconfig`            | `~/.gitconfig`         |
| `vim/.vimrc`                | `~/.vimrc`             |
| `bash/.bashrc`              | `~/.bashrc`            |
| `bash/.bash_profile`        | `~/.bash_profile`      |
| `claude/skills`             | `~/.claude/skills`     |

## Détails

### Bash

- Alias `ls`/`ll`/`la` colorisés, `v=vim`.
- Raccourcis Python/Django (`py`, `va`, `djr`, `djm`, `djmk`), `coverage.py` (`coh`).
- Raccourcis fichiers de config (`vb`, `sb`, `vv`).
- `wh` : `whois` sur le contenu du presse-papier.
- Prompt personnalisé colorisé affichant utilisateur, hôte, répertoire et branche Git.
- Chargement de `nvm`.
- `.bash_profile` : `brew shellenv`, PATH Python.org 3.8, complétion `mole`,
  priorité à `~/.local/bin`, puis chargement de `.bashrc`.

### Git

- Alias courts : `co`, `ci`, `f`, `l`, `g` (graphe), `ps`, `pl`, `s`, `sw`, `b`.
- `init.defaultBranch = main`.
- `init.templatedir` pointe vers `git/.git_template` : les hooks régénèrent
  automatiquement le fichier `tags` (ctags) à chaque checkout, commit, merge et rewrite.

### Vim

- Gestion des plugins via [vim-plug](https://github.com/junegunn/vim-plug)
  (installé automatiquement au premier lancement) : vim-surround, vim-fugitive,
  vim-airline (+ themes), gruvbox, vimspector, vim-maximizer, undotree, jedi-vim,
  supertab, ctags.
- Thème `gruvbox`, numéros relatifs, `expandtab` 4 espaces, `listchars`,
  `colorcolumn=80`, `undofile` dans `~/.vim/undodir`, pas de swap ni de backup.
- `<leader>` = espace. Mappings pour la navigation fenêtres/onglets/buffers,
  l'édition du `.vimrc`, Fugitive (`<leader>g*`) et le débogage Vimspector
  (`<leader>d*`).
- Réglages NetRW, jedi-vim (environnement `myvenv`) et supertab.
- `snippets.vim` : insertion de snippets HTML via des mappings `,html`, `,h1`…`,h6`.

### Claude

- `claude/skills/` est lié à `~/.claude/skills`.
- Skill `baid` : ajoute une idée d'évolution dans `BOITE_A_IDEES.md` à la racine
  du dépôt courant.

## Prérequis

- macOS avec Bash comme shell.
- Vim avec `curl` disponible (pour l'auto-installation de vim-plug).
- `ctags` (Universal Ctags) pour les hooks Git.
- Facultatif : Homebrew, `nvm`, `mole`.
