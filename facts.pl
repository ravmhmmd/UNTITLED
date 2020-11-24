% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : facts.pl                              |
% |________________________________________________|
%

/* ------------------------------------ FAKTA ------------------------------------ */

/* ---------------------------------- Role Hero -----------------------------------*/
/* role(ID_hero, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold). */
hero(1, swordsman, 1, 200, 200, 60, 100, 10, 0, 150).
hero(2, archer, 1, 200, 200, 50, 90, 15, 0, 150).
hero(3, sorcerer, 1, 200, 200, 40, 80, 20, 0, 150).

/* ------------------------------------ Enemy ------------------------------------ */
/* enemy(ID_enemy, Nama_enemy, Level, MaxHP, HP, Attack, Special, Defense). */

/* Wave 1 */
/* spawn secara random selama permainan */
enemy(1, goblin, 1, 100, 100, 35, 70, 10).
enemy(4, slime, 1, 100, 100, 25, 50, 15).
enemy(7, wolf, 1, 100, 100, 30, 60, 20).

/* Wave 2 */
/* spawn secara random selama permainan, mulai dimunculkan setelah Minibos 2 */
enemy(2, goblin, 5, 300, 300, 80, 160, 25).
enemy(5, slime, 5, 300, 300, 60, 120, 35).
enemy(8, wolf, 5, 300, 300, 70, 140, 45).

/* Wave 3 (Last) */
/* spawn secara random selama permainan, mulai dimunculkan setelah Minibos 4 */
enemy(3, goblin, 9, 500, 500, 150, 250, 55).
enemy(6, slime, 9, 500, 500, 130, 230, 65).
enemy(9, wolf, 9, 500, 500, 140, 240, 75).

/* Miniboss 1 */
enemy(10, hydra, 2, 300, 300, 40, 80, 30).

/* Miniboss 2 */
enemy(13, chimera, 4, 500, 500, 75, 150, 40).

/* Miniboss 3 */
enemy(11, ultimate_hydra, 6, 700, 700, 100, 200, 50).

/* Miniboss 4 */
enemy(14, ultimate_chimera, 8, 900, 900, 120, 280, 60).

/* Miniboss 5 */
enemy(12, supermega_hydra, 10, 1100, 1100, 150, 300, 80).
enemy(15, supermega_chimera, 10, 1100, 1100, 150, 300, 80).

/* Boss */
enemy(16, dragon, 15, 2000, 2000, 200, 300, 100).

/* --------------------------------- Role Enemy ---------------------------------- */
miniboss(hydra).
miniboss(chimera).
miniboss(ultimate_hydra).
miniboss(ultimate_chimera).
miniboss(supermega_hydra).
miniboss(supermega_chimera).
boss(dragon).

/* ------------------------------------ Item ------------------------------------- */
/* item(ID_item, Nama_item, Kategori, HP, Attack, Defense). */

/* Item Potion (Universal) */
potion(1, small_Health, potion, x, y, z).
potion(2, medium_Health, potion, x, y, z).
potion(3, big_Health, potion, x, y, z).

/* Item Swordsman */
item(1, namapedang1, swordsman, x, y, z).  %default
item(2, namapedang2, swordsman, x, y, z).
item(3, namapedang3, swordsman, x, y, z).

/* Item Archer */
item(4, namapanah1, archer, x, y, z).  %default
item(5, namapanah2, archer, x, y, z).
item(6, namapanah3, archer, x, y, z).

/* Item Sorcerer */
item(7, namatongkat1, sorcerer, x, y, z).  %default
item(8, namatongkat2, sorcerer, x, y, z).
item(9, namatongkat3, sorcerer, x, y, z).

/* Item Armor (Universal) */
item(101, namaarmor1, swordsman, x, y, z).  %default
item(111, namaarmor2, swordsman, x, y, z).
item(121, namaarmor3, swordsman, x, y, z).

item(102, namaarmor1, archer, x, y, z).  %default
item(112, namaarmor2, archer, x, y, z).
item(122, namaarmor3, archer, x, y, z).

item(103, namaarmor1, sorcerer, x, y, z).  %default
item(113, namaarmor2, sorcerer, x, y, z).
item(123, namaarmor3, sorcerer, x, y, z).



/* Item Legendary (didapatkan dengan menyelesaikan hidden quest) */
item(16, namapedanglegend, swordsman, x, y, z).
item(17, namapanahlegend, archer, x, y, z).
item(18, namatongkatlegend, sorcerer, x, y, z).
item(191, namaarmorlegend, swordsman, x, y, z).
item(192, namaarmorlegend, archer, x, y, z).
item(192, namaarmorlegend, sorcerer, x, y, z).




/* ------------------------- note ------------------------- */

/* player naik level 1 kali sebelum lawan minibos dan 1 kali
   setelah lawan minibos(?), jadi waktu lawan minibos 1
   hero level 2, lawan minibos 2 hero level 4. */

/* hero max level 12 */

/* setiap naik level hero yg nambah max health +100 */

/* 
   setiap enemy drop exp(?)
   spc attack pake mana atau per brp turn(?)

   item per class ada brp macem + hidden item
*/
