% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : gui.pl                                |
% |________________________________________________|
%

start_page :-
    nl,
    nl,
    nl,
    write('   |#####|     |#####|     |######|     |#####|     |###############|     |#####|     |###############|     |#####|               |###############|     |#############|'), nl,
    write('   |#####|     |#####|     |#######|    |#####|     |###############|     |#####|     |###############|     |#####|               |###############|     |###############|'), nl,
    write('   |#####|     |#####|     |#####||##|  |#####|          |#####|          |#####|          |#####|          |#####|               |#####|               |#####|     |#####|'), nl,
    write('   |#####|     |#####|     |#####| |##| |#####|          |#####|          |#####|          |#####|          |#####|               |##########|          |#####|     |#####|'), nl,
    write('   |#####|     |#####|     |#####| |##| |#####|          |#####|          |#####|          |#####|          |#####|               |##########|          |#####|     |#####|'), nl,
    write('    |####|     |####|      |#####|  |##||#####|          |#####|          |#####|          |#####|          |#####|               |#####|               |#####|     |#####|'), nl,
    write('     |#############|       |#####|    |#######|          |#####|          |#####|          |#####|          |###############|     |###############|     |###############|'), nl,
    write('       |#########|         |#####|     |######|          |#####|          |#####|          |#####|          |###############|     |###############|     |#############|'), nl,
    nl,
    write('                                                                      A ROLE PLAYING GAME BY ONEWEEKDEV'), nl,
    nl,
    write('                                                                       |=============================|'), nl,
    write('                                                                       |      Masukkan Command :     |'), nl,
    write('                                                                       |          1. start.          |'), nl,
    write('                                                                       |          2. load.           |'), nl,
    write('                                                                       |          3. help.           |'), nl,
    write('                                                                       |          4. quit.           |'), nl,
    write('                                                                       |          5. credit.         |'), nl,
    write('                                                                       |=============================|'), nl,!.

pilih_job_page :-
    write(' |============================|'), nl,
    write(' | Pilih role yang diinginkan |'), nl,
    write(' |============================|'), nl,
    write(' |       1. swordsman.        |'), nl,
    write(' |     Max HP      : 200      |'), nl,
    write(' |     Attack      : 60       |'), nl,
    write(' |     Spc. Attack : 100      |'), nl,
    write(' |     Defense     : 10       |'), nl,
    write(' |----------------------------|'), nl,
    write(' |       2. archer.           |'), nl,
    write(' |     Max HP      : 200      |'), nl,
    write(' |     Attack      : 50       |'), nl,
    write(' |     Spc. Attack : 90       |'), nl,
    write(' |     Defense     : 15       |'), nl,
    write(' |----------------------------|'), nl,
    write(' |       3. sorcerer.         |'), nl,
    write(' |     Max HP      : 200      |'), nl,
    write(' |     Attack      : 40       |'), nl,
    write(' |     Spc. Attack : 80       |'), nl,
    write(' |     Defense     : 20       |'), nl,
    write(' |============================|'), nl, nl,
    write('Role yang dipilih (masukkan angka) : '),!.

 /* --------------------------------------- SHOP ---------------------------------------- */
shop_page :-
    write('Selamat datang di Toko Sir Harheil.'), nl,  nl,
    write('Semua potion dan item yang anda butuhkan dapat anda temui disini.'), nl, nl,
    write('Apa yang anda butuhkan ?'), nl, nl,
    write(' |========================|'), nl,
    write(' |     1. beliPotion.     |'), nl,
    write(' |     2. beliItem.       |'), nl,
    write(' |     3. keluarToko.     |'), nl,
    write(' |========================|'), nl, nl, 
    write('Masukan command : '), !.

beliPotion_page :-
    write('|===============================================================|'), nl,
    write('|                  List Potion yang tersedia :                  |'), nl,
    write('|---------------------------------------------------------------|'), nl,
    write('|      1. Small Health                                          |'), nl,
    write('|         Efek    : Menambah HP sebanyak 25% dari MAX HP        |'), nl,
    write('|         Harga   : 50 Gold                                     |'), nl,
    write('|      2. Medium Health                                         |'), nl,
    write('|         Efek    : Menambah HP sebanyak 50% dari MAX HP        |'), nl,
    write('|         Harga   : 75 Gold                                     |'), nl,
    write('|      3. Big Health                                            |'), nl,
    write('|         Efek    : Menambah HP sebanyak MAX HP                 |'), nl,
    write('|         Harga   : 150 Gold                                    |'), nl,
    write('|===============================================================|'), nl, nl,
    write('Potion yang ingin dibeli (masukan angka) : '),!.

beliItem_page :-
    write('|============================================================|'), nl,
    write('|                     Pembelian Item                         |'), nl,
    write('|------------------------------------------------------------|'), nl,
    write('|       Item dapat dibeli dengan sistem gacha, yaitu         |'), nl,
    write('|       pemain mengeluarkan uang dengan harga yang           |'), nl,
    write('|       sudah ditetapkan, dan item yang akan pemain          |'), nl,
    write('|       dapatkan akan diberikan secara random.               |'), nl,
    write('|                                                            |'), nl,
    write('|       Harga   : 150 Gold                                   |'), nl,
    write('|                                                            |'), nl,
    write('|       untuk melanjutkan pembelian masukan command :        |'), nl,
    write('|       "gacha."                                             |'), nl,
    write('|============================================================|'), nl, nl,
    write('Masukan command : '),!.

keluarToko_page :-
    write('Terima kasih sudah mampir, semoga puas dengan pelayanan kami.'), nl, map,nl, !.

/* credit page */
credit_page :-
    write('|===========================================================================================|'), nl,
    write('|                                                                                           |'), nl,
    write('|                                         UNTITLED                                          |'), nl,
    write('|                             A ROLE PLAYING GAME BY ONEWEEKDEV                             |'), nl,
    write('|                                                                                           |'), nl,
    write('|-------------------------------------------------------------------------------------------|'), nl,
    write('|                                                                                           |'), nl,
    write('|   UNTITLED adalah sebuah game dengan genre RPG buatan ONEWEEKDEV. Game ini menceritakan   |'), nl,
    write('|   tentang seorang pangeran yang diberi misi untuk menyelamatkan seorang putri dari desa   |'), nl,
    write('|   Yalheir yang diculik oleh DRAGON OF YALHEIR.                                            |'), nl,
    write('|                                                                                           |'), nl,
    write('|-------------------------------------------------------------------------------------------|'), nl,
    write('|                                                                                           |'), nl,
    write('|   ONEWEEKDEV merupakan sebuah grup yang berdiri pada November 2020, berisikan mahasiswa   |'), nl,
    write('|   Institut Teknologi Bandung, dalam rangka menyelesaikan Tugas Besar IF2121.   Grup ini   |'), nl,
    write('|   beranggotakan :                                                                         |'), nl,
    write('|      1. Rahmah Khoirussyifa’ Nurdini - 13519013                                           |'), nl,
    write('|      2. Syarifah Aisha G.Y.          - 13519089                                           |'), nl,
    write('|      3. Delisha Azza Naadira         - 13519133                                           |'), nl,
    write('|      4. Muhammad Rayhan Ravianda     - 13519201                                           |'), nl,
    write('|                                                                                           |'), nl,
    write('|===========================================================================================|'), nl, !.

/* victory */
victory_page :-
    write('|#####|       |#####|     |#####|     |###########|     |###############|     |#############|     |###############|       |#####|     |#####| '), nl,
    write(' |#####|     |#####|      |#####|     |###########|     |###############|     |#############|     |####|     |#####|       |#####|   |#####|  '), nl,
    write('  |#####|   |#####|       |#####|     |###|                  |#####|          |####     ####|     |####|      |#####|       |#####| |#####|   '), nl,
    write('   |#####| |#####|        |#####|     |###|                  |#####|          |####     ####|     |####|     |#####|          |####|####|     '), nl,
    write('     |####|####|          |#####|     |###|                  |#####|          |####     ####|     |###############|             |#####|       '), nl,
    write('      |#######|           |#####|     |###########|          |#####|          |#############|     |####|      |####|            |#####|       '), nl,
    write('       |#####|            |#####|     |###########|          |#####|          |#############|     |####|      |####|            |#####|       '), nl,
    nl,
    nl,
    write('Anda berhasil mengalahkan DRAGON OF YALHEIR.'),nl,
    nama_player(Nama),
    nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,
    write(Nama), write(' : Aku sudah mengalahkanmu, sekarang kamu sudah tidak bisa berbuat apa-apa lagi.'),nl,sleep(2),
    write(Nama), write(' : Dimana kamu menahan sang putri?'),nl,
    write('DRAGON OF YALHEIR : Hah? Apa yang kamu maksud?'),nl,
    write(Nama), write(' : Jangan pura-pura bodoh! Aku tahu kamu telah menculik sang putri!'),nl,
    write('DRAGON OF YALHEIR : Akulah sang putri! '),nl,
    write(Nama), write(' : Apa yang kamu bicarakan ?!'),nl,
    write('DRAGON OF YALHEIR : Ya, akulah sang putri. Aku telah membohongimu selama ini. '),nl,
    write(Nama), write(' : NANIIII ?!!'),nl,
    nl, sleep(3),
    write('To be continued....'),nl,
    nl, sleep(3),
    write(' ---  GAME OVER ---'),nl.