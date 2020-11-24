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
        write('Pembelian berhasil.'), nl
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
        write('Pembelian berhasil.'), nl
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
        write('Pembelian berhasil.'), nl
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
    write('Pembelian berhasil.'), nl, !.

/* keluarToko. */
keluarToko :-
    keluarToko_page. 