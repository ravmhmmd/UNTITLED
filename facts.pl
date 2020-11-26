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
/* enemy(ID_enemy, Nama_enemy, Level, MaxHP, HP, Attack, Special, Defense, DropEXP, DropGold). */

/* Wave 1 */
/* spawn secara random selama permainan */
enemy(1, goblin, 1, 100, 100, 35, 70, 10, 20, 50).
enemy(2, slime, 1, 100, 100, 25, 50, 15, 20, 50).
enemy(3, wolf, 1, 100, 100, 30, 60, 20, 20, 50).

/* Wave 2 */
/* spawn secara random selama permainan, mulai dimunculkan setelah Minibos 2 */
enemy(4, goblin, 5, 300, 300, 80, 160, 25, 30, 60).
enemy(5, slime, 5, 300, 300, 60, 120, 35, 30, 60).
enemy(6, wolf, 5, 300, 300, 70, 140, 45, 30, 60).

/* Wave 3 (Last) */
/* spawn secara random selama permainan, mulai dimunculkan setelah Minibos 4 */
enemy(7, goblin, 9, 500, 500, 150, 250, 55, 50, 80).
enemy(8, slime, 9, 500, 500, 130, 230, 65, 50, 80).
enemy(9, wolf, 9, 500, 500, 140, 240, 75, 50, 80).

/* Miniboss 1 */
enemy(10, hydra, 2, 300, 300, 40, 80, 30, 100, 150).

/* Miniboss 2 */
enemy(11, chimera, 6, 500, 500, 75, 150, 40, 150, 200).

/* Miniboss 3 */
enemy(12, supermega_hydra, 10, 1100, 1100, 150, 300, 80).
enemy(13, supermega_chimera, 10, 1100, 1100, 150, 300, 80).

/* Miniboss 4 */
enemy(14, devil_of_yalheir, 12, 1300,1300, 170, 300, 90).

/* Boss */
enemy(15, dragon_of_yalheir, 15, 2000, 2000, 200, 300, 100).

miniboss(chimera).
miniboss(supermega_hydra).
miniboss(supermega_chimera).
miniboss(devil_of_yalheir).
boss(dragon_of_yalheir).

/* ------------------------------------ Item ------------------------------------- */
/* item(ID_item, Nama_item, Level, Kategori, HP, Attack, Defense). */

/* Item Potion (Universal) */
potion(1, small_Health, potion, 50, 0, 0).
potion(2, medium_Health, potion, 150, 0, 0).
potion(3, big_Health, potion, 300, 0, 0).

/* Item Swordsman */
item(1, sword_of_yalheir, 1, swordsman, 0, 20, 0).  %default
item(5, blade_of_a_thousand_cuts, 2, swordsman, 0, 60, 0).
item(6, saber_of_hope, 3, swordsman, 0, 100, 0).

/* Item Archer */
item(2, bow_of_yalheir, 1, archer, 0, 20, 0).  %default
item(7, shadowleaf_skeletal_longbow, 2, archer, 0, 60, 0).
item(8, ironbark_piercer, 3, archer, 0, 100, 0).

/* Item Sorcerer */
item(3, staff_of_yalheir, 1, sorcerer, 0, 20, 0).  %default
item(9, fiery_sagewood_cane, 2, sorcerer, 0, 60, 0).
item(10, maelstrom, 3, sorcerer, 0, 100, 0).

/* Item Armor (Universal) */
item(4, yalheirian_knight_armor, 1, swordsman, 0, 0, 15).  %default
item(11, tunic_of_timeless_fires, 2, swordsman, 0, 0, 30).
item(12, hollow_iron_armor, 3, swordsman, 0, 0, 50).

item(4, yalheirian_knight_armor, 1, archer, 0, 0, 15).  %default
item(11, tunic_of_timeless_fires, 2, archer, 0, 0, 30).
item(12, hollow_iron_armor, 3, archer, 0, 0, 50).

item(4, yalheirian_knight_armor, 1, sorcerer, 0, 0, 15).  %default
item(11, tunic_of_timeless_fires, 2, sorcerer, 0, 0, 30).
item(12, hollow_iron_armor, 3, sorcerer, 0, 0, 50).


/* Item Legendary (didapatkan dengan menyelesaikan hidden quest) */
item(13, aetherius_blade, 17, swordsman, 0, 999, 0).
item(14, bolter_of_the_king, 17, archer, 0, 999, 0).
item(15, soul_of_holy_might, 17, sorcerer, 0, 999, 0).
item(16, vest_of_cursed_dreams, 17, swordsman, 0, 0, 999).
item(16, vest_of_cursed_dreams, 17, archer, 0, 0, 999).
item(16, vest_of_cursed_dreams, 17, sorcerer, 0, 0, 999).




/* ------------------------- note ------------------------- */

/* hero max level 12 */

/* setiap naik level hero yg nambah max health +100 */

/* 
   setiap enemy drop exp(?)
   spc attack pake mana atau per brp turn(?)

/* 