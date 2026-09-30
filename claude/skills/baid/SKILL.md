---
name: baid
description: >-
  Ajoute une idée d'évolution saisie par l'utilisateur dans le fichier
  BOITE_A_IDEES.md à la racine du dépôt courant (le crée s'il n'existe pas).
  À déclencher dès que l'utilisateur veut « noter une idée », « mettre de côté »
  une évolution, « ajouter à la boîte à idées », capturer une piste à explorer
  plus tard, ou dit « idée : … » / « pense à … pour plus tard » à propos d'une
  fonctionnalité. Ne pas déclencher pour créer une vraie tâche de sprint /
  backlog : dans ce cas c'est le backlog ou le cahier des charges du projet.
---

# Boîte à idées

Capture rapide d'une idée d'évolution dans `BOITE_A_IDEES.md`, à la racine du
dépôt courant (celui du répertoire de travail). Le but est de ne rien perdre :
on note en une ligne, on priorise plus tard.

## Procédure

1. **Reformuler l'idée** en une phrase courte, à l'infinitif, autoportante
   (compréhensible sans le contexte de la conversation). Garder les détails
   utiles donnés par l'utilisateur (contrainte, motivation, alternative écartée)
   sur la même ligne ou en sous-puce indentée.

2. **Vérifier `BOITE_A_IDEES.md` à la racine du dépôt courant.**

   - **S'il n'existe pas**, le créer avec ce contenu, puis ajouter l'idée sous
     `## Idées` :

     ```markdown
     # Boîte à idées

     Idées d'évolution à explorer / implémenter plus tard. Pas de priorisation ici :
     quand une idée est retenue, la transformer en tâche dans le backlog / cahier
     des charges du projet, puis la retirer d'ici.

     Légende d'état : ✅ terminé · 🔸 en cours · ⬜ à faire · ⏸️ suspendu

     Chaque idée porte un identifiant `ID-xx` stable et croissant. Ne pas réutiliser
     un `ID` libéré : la prochaine idée prend toujours le numéro suivant le plus haut.

     ## Idées

     - **ID-01** ⬜ <idée reformulée>
     ```

   - **S'il existe**, ajouter une nouvelle puce à la fin de la section `## Idées`,
     en conservant le format des lignes déjà présentes. Ne pas réécrire ni
     réordonner les idées existantes.

3. **Format d'une entrée** : puce `- **ID-xx** <icône> <texte>`, où `ID-xx` est le
   numéro suivant le plus haut déjà présent dans le fichier (formaté sur deux
   chiffres, ex. `ID-07`), et l'icône d'état est `⬜` (à faire) par défaut,
   cohérente avec la légende du fichier (et, s'il y en a un, celle du backlog /
   cahier des charges du projet). Si le fichier ne numérote pas encore ses
   entrées, commencer à `ID-01`. Détails éventuels en sous-puces indentées de
   deux espaces.

   ```markdown
   - **ID-13** ⬜ Utiliser la watchlist IBKR à la place du pont Google Sheet pour
     les cotations en différé.
   ```

4. **Ne rien faire d'autre** : pas de commit, pas de mise à jour du backlog ou
   du cahier des charges, pas de lint. C'est une capture, pas une planification.
   Confirmer à l'utilisateur la ligne ajoutée.

## Exemples

**Exemple 1** (dernier ID du fichier = `ID-12`)
Entrée : « note une idée : on pourrait exporter le journal des trades en CSV »
Action : ajouter `- **ID-13** ⬜ Exporter le journal des trades en CSV.` à la fin
de la section `## Idées`.

**Exemple 2** (dernier ID du fichier = `ID-13`)
Entrée : « pense pour plus tard à un mode sombre, mais seulement si Tailwind le
gère proprement »
Action :
```markdown
- **ID-14** ⬜ Ajouter un mode sombre.
  - Seulement si la gestion via Tailwind reste propre (pas de surcharge CSS lourde).
```
