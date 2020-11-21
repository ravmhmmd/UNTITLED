/* Tugas Besar Logika Komputasional - IF 2121 */
/* Kelas 01 | Kelompok 08 */
/* Rahmah Khoirussyifa’ Nurdini     13519013 */
/* Syarifah Aisha G.Y.              13519089 */
/* Delisha Azza Naadira             13519133 */
/* Muhammad Rayhan Ravianda         13519201 */

/* --------------------------- FAKTA --------------------------- */

/* Role Hero */
/* role(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold). */
hero(swordsman, 1, 200, 200, 60, 100, 10, 0, 150).
hero(archer, 1, 200, 200, 50, 90, 15, 0, 150).
hero(sorcerer, 1, 200, 200, 40, 80, 20, 0, 150).

/* Enemy */
/* enemy(Nama_enemy, Level, MaxHP, HP, Attack, Special, Defense). */

/* Wave 1 */
/* spawn secara random selama permainan */
enemy(goblin, 1, 100, 100, 35, 70, 10).
enemy(slime, 1, 100, 100, 25, 50, 15).
enemy(wolf, 1, 100, 100, 30, 60, 20).

/* Wave 2 */
/* spawn secara random selama permainan, mulai dimunculkan setelah Minibos 2 */
enemy(goblin, 5, 300, 300, 80, 160, 25).
enemy(slime, 5, 300, 300, 60, 120, 35).
enemy(wolf, 5, 300, 300, 70, 140, 45).

/* Wave 3 (Last) */
/* spawn secara random selama permainan, mulai dimunculkan setelah Minibos 4 */
enemy(goblin, 9, 500, 500, 150, 250, 55).
enemy(slime, 9, 500, 500, 130, 230, 65).
enemy(wolf, 9, 500, 500, 140, 240, 75).

/* Miniboss 1 */
enemy(hydra, 2, 300, 300, 40, 80, 30).

/* Miniboss 2 */
enemy(chimera, 4, 500, 500, 75, 150, 40).

/* Miniboss 3 */
enemy(ultimate_hydra, 6, 700, 700, 100, 200, 50).

/* Miniboss 4 */
enemy(ultimate_chimera, 8, 900, 900, 120, 280, 60).

/* Miniboss 5 */
enemy(supermega_hydra, 10, 1100, 1100, 150, 300, 80).
enemy(supermega_chimera, 10, 1100, 1100, 150, 300, 80).

/* Boss */
enemy(dragon, 15, 2000, 2000, 200, 300, 100).

/* Role Enemy */
miniboss(hydra).
miniboss(chimera).
miniboss(ultimate_hydra.
miniboss(ultimate_chimera).
miniboss(supermega_hydra).
miniboss(supermega_chimera).
boss(dragon).





/* ------------------------- note ------------------------- */

/* player naik level 1 akli sebelum lawan minibos dan 1 kali
   setelah lawan minibos(?), jadi waktu lawan minibos 1
   hero level 2, lawan minibos 2 hero level 4. */

/* hero max level 12 */

/* setiap naik level hero yg nambah max health +100 */

