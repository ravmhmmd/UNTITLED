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
    write(' _________      ___     ___     _________      ___     ___     ___'), nl,
    write('|xxxxxxxxx|    |xxx|   |xxx|   |xxxxxxxxx|    |xxx|   |xxx|   |xxx|'), nl,
    write('      |xxx|    |xxx|   |xxx|   |xxx|  |xx|    |xxx|   |xxx|   |xxx|'), nl,
    write('      |xxx|    |xxx|   |xxx|   |xxx|  |xx|    |xxx|   |xxx|   |xxx|'), nl,
    write('      |xxx|    |xxx|   |xxx|   |xxx|  |xx|    |xxx|   |xxx|   |xxx|'), nl,
    write(' _____|xxx|    |xxx|___|xxx|   |xxx|  |xx|    |xxx|___|xxx|   |xxx|'), nl,
    write('|xxxxxxxx|      |xxxxxxxxx|    |xxxxxxxx|      ||xxxxxxxx|    |xxxxxxxxxxx|'), nl,
    nl,
    write('                     |=============================|'), nl,
    write('                     |      Masukkan Command :     |'), nl,
    write('                     |          1. start.          |'), nl,
    write('                     |          2. load.           |'), nl,
    write('                     |          3. help.           |'), nl,
    write('                     |          4. quit.           |'), nl,
    write('                     |=============================|'), nl,!.

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
    