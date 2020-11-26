% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : shop.pl                               |
% |________________________________________________|
%
/* ------------------------------- IMPORT MODULE --------------------------------- */
:- use_module(library(random)).

/* ------------------------- IMPORT FILE YANG DIGUNAKAN -------------------------- */
:- include('inventory.pl').

/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(player/9).

/* -------------------------------- MASUK TOKO ----------------------------------- */

/* beliPotion. */
beliPotion :-                   % masi error
    beliPotion_page,
    read(NoPotion), nl,
    pilih_potion(NoPotion),!.

pilih_potion(NoPotion) :-
    NoPotion =:= 1,
    ID_item is NoPotion,
    potion(ID_item, Nama_item, Kategori, HP, Attack, Defense),
    player(_,_,_,_,_,_,_,_,Gold),
    (
        Gold < 50,
        write('Pembelian gagal, Gold yang anda miliki tidak mencukupi.'), nl;

        Gold >= 50,
        LastGold is Gold-50,
        retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
        asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, LastGold)),
        write('Pembelian berhasil.'), nl,
        insert_item(Nama_item)
    ),!.

pilih_potion(NoPotion) :-
    NoPotion =:= 2,
    ID_item is NoPotion,
    potion(ID_item, Nama_item, Kategori, HP, Attack, Defense),
    player(_,_,_,_,_,_,_,_,Gold),
    (
        Gold < 75,
        write('Pembelian gagal, Gold yang anda miliki tidak mencukupi.'), nl;

        Gold >= 75,
        LastGold is Gold-75,
        retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
        asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, LastGold)),
        write('Pembelian berhasil.'), nl,
        insert_item(Nama_item)
    ),!.

pilih_potion(NoPotion) :-
    NoPotion =:= 3,
    ID_item is NoPotion,
    potion(ID_item, Nama_item, Kategori, HP, Attack, Defense),
    player(_,_,_,_,_,_,_,_,Gold),
    (
        Gold < 150,
        write('Pembelian gagal, Gold yang anda miliki tidak mencukupi.'), nl;

        Gold >= 150,
        LastGold is Gold-150,
        retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
        asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, LastGold)),
        write('Pembelian berhasil.'), nl,
        insert_item(Nama_item)
    ),!.

/* beliItem. */                                 % blom kelar
beliItem :-
    beliItem_page,
    read(Comm_gacha), nl,
    (
        Comm_gacha = 'gacha', call(gacha)
    ),
    nl.

gacha :-
    player(Nama_role,_,_,_,_,_,_,_,Gold),
    Gold < 150,
    write('Pembelian gagal, Gold yang anda miliki tidak mencukupi.'), nl, !.

gacha :-
    player(Nama_role,_,_,_,_,_,_,_,Gold),
    Gold >= 150,
    LastGold is Gold-150,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, LastGold)),
    random(0, 100, N),
    (
        N < 30,
        write('Maaf, anda belum dapat item apapun.'), nl;

        N < 55,
        (
            Nama_role = 'swordsman',
            write('Anda mendapatkan Blade of a Thousand Cuts <Level 2 Sword>!'), nl,
            item(5, NamaItem,_,_,_,_,_),
            insert_item(NamaItem);

            Nama_role = 'archer',
            write('Anda mendapatkan Shadowleaf Skeletal Longbow <Level 2 Bow>!'), nl,
            item(7, NamaItem,_,_,_,_,_),
            insert_item(NamaItem);            

            Nama_role = 'sorcerer',
            write('Anda mendapatkan Fiery Sagewood Cane <Level 2 Staff>!'), nl,
            item(9,NamaItem,_,_,_,_,_),
            insert_item(NamaItem)
        );

        N < 80,
        write('Anda mendapatkan Tunic of Timeless Fires <Level 2 Armor>'), nl,
        item(11,NamaItem,_,_,_,_,_),
        insert_item(NamaItem);


        N < 89,
        (
            Nama_role = 'swordsman',
            write('Anda mendapatkan Saber of Hope <Level 3 Sword>!'), nl,
            item(6,NamaItem,_,_,_,_,_),
            insert_item(NamaItem);

            Nama_role = 'archer',
            write('Anda mendapatkan Ironbark Piercer <Level 3 Bow>!'), nl,
            item(8,NamaItem,_,_,_,_,_),
            insert_item(NamaItem);

            Nama_role = 'sorcerer',
            write('Anda mendapatkan Maelstrom <Level 3 Staff>!'), nl,
            item(10,NamaItem,_,_,_,_,_),
            insert_item(NamaItem)
        );

        N < 98,
        write('Anda mendapatkan Hollow Iron Armor <Level 3 Armor>'), nl,
        item(12,NamaItem,_,_,_,_,_),
        insert_item(NamaItem);

        N < 99,
        (
            Nama_role = 'swordsman',
            write('Anda mendapatkan Aetherius Blade <Level 17 Sword>!'), nl,
            item(13,NamaItem,_,_,_,_,_),
            insert_item(NamaItem);

            Nama_role = 'archer',
            write('Anda mendapatkan Bolter of the King <Level 17 Bow>!'), nl,
            item(14,NamaItem,_,_,_,_,_),
            insert_item(NamaItem);

            Nama_role = 'sorcerer',
            write('Anda mendapatkan Soul of Holy Might <Level 17 Staff>!'), nl,
            item(15,NamaItem,_,_,_,_,_),
            insert_item(NamaItem)
        );

        N < 100,
        write('Anda mendapatkan Vest of Cursed Dreams <Level 17 Armor>!'), nl,
        item(16,NamaItem,_,_,_,_,_),
        insert_item(NamaItem)
    ),
    write('Pembelian berhasil.'), nl.

/* keluarToko. */
keluarToko :-
    keluarToko_page.