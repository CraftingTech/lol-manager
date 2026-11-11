# Vision du Projet : LoL Esports Manager

## 1. Vue d'ensemble (Overview)
Ce projet vise à créer un jeu vidéo de gestion esport profond et immersif, reprenant les codes et la profondeur d'un *Football Manager*, mais appliqué à l'univers compétitif de *League of Legends*. Le joueur incarne le manager/coach d'une structure esportive et doit mener son équipe au sommet. Le jeu exploite des données réelles (noms d'équipes, joueurs, ligues) pour offrir une expérience authentique aux fans d'esport et de jeux de gestion. Le livrable final est destiné à être publié sur Steam.

## 2. Objectifs clés (Goals)
*   **Simulation de gestion complète :** Développer des systèmes profonds pour la gestion du roster (joueurs titulaires et académie), le recrutement (transferts, scouting), et la formation.
*   **Gestion de la structure :** Intégrer la gestion du staff technique, des infrastructures (gaming house, centre d'entraînement), et des relations avec la direction (CEO, investisseurs).
*   **Économie et Notoriété :** Gérer les finances, les sponsors, et l'engagement des fans.
*   **Authenticité :** Intégrer une base de données avec des éléments réels (joueurs, équipes, ligues) de l'écosystème League of Legends.
*   **Publication Steam :** Produire un exécutable final packagé et prêt à être distribué sur la plateforme Steam.
*   **Plaisir de jeu :** Offrir une boucle de gameplay (gameplay loop) divertissante et addictive.

## 3. Hors périmètre (Non-goals)
*(Note : Ces exclusions visent à protéger le périmètre du projet, particulièrement en tant que développeur solo)*
*   **Pas de multijoueur en ligne :** Le jeu est une expérience purement solo (Single-player). Le développement d'une architecture client-serveur complexe est exclu.
*   **Pas de gameplay d'action :** Le joueur ne contrôle pas les champions pendant les matchs. La résolution des parties se fait via un moteur de simulation (statistiques, stratégie, drafts).
*   **Pas de moteur 3D complexe :** La représentation des matchs se fera de manière schématique (ex: 2D, interface textuelle, ou vue radar) plutôt que via des graphismes 3D lourds à produire.
*   **Pas de portage mobile/console :** L'interface et l'expérience sont exclusivement pensées pour PC.
*   **Pas de micro-transactions :** Modèle économique de jeu premium classique.

## 4. Principes d'expérience utilisateur (UX)
*   **PC First (Clavier/Souris) :** L'interface doit tirer parti des grands écrans, de la souris (clics droits, infobulles) et des raccourcis clavier.
*   **Haute densité d'information :** À l'image de *Football Manager*, l'interface doit permettre de naviguer facilement dans des tableaux de données complexes, des statistiques et des profils détaillés.
*   **Navigation sans friction :** Un système d'onglets, de filtres et de recherche performant pour accéder rapidement aux informations (joueurs, classements, finances).
*   **Clarté des retours :** Les actions du joueur (ex: modifier une tactique, investir dans une infrastructure) doivent avoir un impact clair et lisible sur les résultats et le moral de l'équipe.

## 5. Décisions architecturales et Contraintes
*   **Langage imposé :** L'intégralité de la codebase doit être écrite en **Rust**.
*   **Clean Code & Oncle Bob :** Le code doit être expressif et auto-documenté. Le nommage des variables, fonctions et structures doit être suffisamment clair pour rendre les commentaires superflus (Règle d'Oncle Bob : un commentaire est un échec à s'exprimer par le code).
*   **Design Patterns :** Application stricte des design patterns appropriés (ex: ECS (Entity Component System) si pertinent pour le moteur de jeu Rust, Singleton pour les managers d'états globaux, etc.) pour garantir un code maintenable et évolutif.
*   **Exécutable local :** Le jeu doit tourner localement sur la machine de l'utilisateur sans dépendance à un serveur cloud (sauvegardes locales).
*   **Temps :** Projet personnel sans date limite (deadline) stricte, la qualité de l'architecture prime sur la vitesse de livraison.

## 6. Critères de succès
*   **Critère principal :** Le jeu peut être installé sur un PC standard, lancé, et permet de jouer une partie complète de manière stable et fluide.
*   **Qualité du code :** L'agent IA ou les contributeurs peuvent naviguer dans la codebase Rust sans avoir besoin de commentaires pour comprendre la logique métier.
*   **Validation du livrable :** Création réussie de la page Steam et validation de l'exécutable par les processus de publication de Steam.