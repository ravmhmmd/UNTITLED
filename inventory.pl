% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : inventory.pl                          |
% |________________________________________________|
%

/* ------------------------- IMPORT FILE YANG DIGUNAKAN -------------------------- */
:- include('facts.pl').

/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(inventory_player/2).

/* --------------------------- INISIALISASI INVENTORY ---------------------------- */
inisialisasi_inventory(Role) :-
    Role =:= 1,
    inventory(1,Inventory_list,Inventory_count),
    asserta(inventory_player(Inventory_list, Inventory_count)),
    write('Kamu memiliki 2 item, Sword of Yalheir dan Yalheirian Knight Armor dalam inventory.'), nl,!.

inisialisasi_inventory(Role) :-
    Role =:= 2,
    inventory(2,Inventory_list,Inventory_count),
    asserta(inventory_player(Inventory_list, Inventory_count)), 
    write('Kamu memiliki 2 item, Bow of Yalheir dan Yalheirian Knight Armor dalam inventory.'), nl,!.

inisialisasi_inventory(Role) :-
    Role =:= 3,
    inventory(3,Inventory_list,Inventory_count),
    asserta(inventory_player(Inventory_list, Inventory_count)),
    write('Kamu memiliki 2 item, Staff of Yalheir dan Yalheirian Knight Armor dalam inventory.'), nl, !.

/* ---------------------- MENAMBAHKAN ITEM BARU KE LIST ------------------------ */
/*** Deklarasi Fakta ***/
addLast(E,[],[E]).

/*** Deklarasi Rules ***/
addLast(E,[H|T],[H|L]) :- addLast(E,T,L).

/* ----------------- MENGHITUNG BANYAKNYA SEMUA ELEMEN LIST -------------------- */
hitungElmt([],0).
hitungElmt([_|Tail], N) :- hitungElmt(Tail, N1), N is N1+1.

/* ----------------- MENGHITUNG BANYAKNYA ELEMEN LIST TERTENTU ----------------- */
/* hitungElmtX(List, Count, Elmt) */
hitungElmtX([],0,X).
hitungElmtX([X|Tail],N,X) :-
    hitungElmtX(Tail,N1,X),
    N is N1+1.
hitungElmtX([Head|Tail],N1,X) :-
    Head \= X,
    hitungElmtX(Tail,N1,X).

/* ----------------------- MEMBUANG ITEM DARI INVENTORY ------------------------ */
/* dumpItem(List, Item, NewList) */
dumpItem([I | Tail], I, Tail).
dumpItem([H | Tail], I, [H | List1]) :-
    dumpItem(Tail, I, List1).

/* ------------------ SEARCH INDEX SUATU ITEM PADA INVENTORY ------------------- */
/* cariIndex([X|_],0,X),!.
cariIndex([_|Tail],N,X) :-
    cariIndex(Tail,N1,X),!,
    N is N1+1. */

/* ------------------------ MENAMBAH ITEM PADA INVENTORY ----------------------- */
insert_item(Nama_item) :-
    inventory_player(Inventory_list, Inventory_count),

    addLast(Nama_item, Inventory_list, New_inventory_list),
    New_inventory_count is Inventory_count+1,

    retract(inventory_player(Inventory_list, Inventory_count)),
    asserta(inventory_player(New_inventory_list, New_inventory_count)), !.

/* ---------------------- MENGGUNAKAN ITEM PADA INVENTORY --------------------- */
/* Item tidak ada pada inventory */
use_item(Nama_item) :-
    inventory_player(Inventory_list,_),
    hitungElmtX(Inventory_list, N, Nama_item),
    N =:= 0,
    write('Anda tidak memiliki item ini di dalam inventory.'), nl.

/* Equip item */
use_item(Nama_item) :-
    inventory_player(Inventory_list,_),
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    hitungElmtX(Inventory_list, N, Nama_item),
    N =\= 0,
    item(_,Nama_item,_,_,_,Y,Z),
    NewAttack is Attack+Y,
    NewDefense is Defense+Z,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, HP, NewAttack, Special, NewDefense, EXP, Gold)),
    write('Anda berhasil menggunakan item tersebut.'),nl,!.

/* Menggunakan potion */
use_item(Nama_item) :-
    inventory_player(Inventory_list, Inventory_count),
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    hitungElmtX(Inventory_list, N, Nama_item),
    N =\= 0,
    potion(_,Nama_item,_,X,_,_),
    NewHP is HP+X,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, NewHP, Attack, Special, Defense, EXP, Gold)),

    dumpItem(Inventory_list, Nama_item, New_inventory_list),
    New_inventory_count is Inventory_count-1,

    retract(inventory_player(Inventory_list, Inventory_count)),
    asserta(inventory_player(New_inventory_list, New_inventory_count)),
    write('Anda berhasil menggunakan potion.'),nl,!.

/* Unequip item */
unused_item(Nama_item) :-
    inventory_player(Inventory_list,_),
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    hitungElmtX(Inventory_list, N, Nama_item),
    N =\= 0,
    item(_,Nama_item,_,_,_,Y,Z),
    NewAttack is Attack-Y,
    NewDefense is Defense-Z,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, HP, NewAttack, Special, NewDefense, EXP, Gold)),
    write('Anda tidak lagi menggunakan item tersebut.'),nl,!.

/* ------------------------- PRINT ITEM PADA INVENTORY ------------------------ */

print_inventory :-
    player(Nama_role,_,_,_,_,_,_,_,_),
    Nama_role == 'swordsman',
    item(1, Sword1,_,_,_,_,_),
    item(5, Sword2,_,_,_,_,_),
    item(6, Sword3,_,_,_,_,_),
    inventory_player(Inventory_list, Inventory_count),
    
    write('LIST ITEM INVENTORY'), nl,

    hitungElmtX(Inventory_list, N1, Sword1),
    (
        N1 > 0,
        write(N1),write(' Sword of Yalheir'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N2, Sword2),
    (
        N2 > 0,
        write(N2),write(' Blade of a Thousand Cuts'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N3, Sword3),
    (
        N3 > 0,
        write(N3),write(' Saber of Hope'), nl;

        true 
    ),

    print_inventory_potion,
    print_inventory_armor,!.


print_inventory :-
    player(Nama_role,_,_,_,_,_,_,_,_),
    Nama_role == 'archer',

    item(2, Arrow1,_,_,_,_,_),
    item(7, Arrow2,_,_,_,_,_),
    item(8, Arrow3,_,_,_,_,_),
    inventory_player(Inventory_list, Inventory_count),

    write('LIST ITEM INVENTORY'),nl,
    hitungElmtX(Inventory_list, N1, Arrow1),
    (
        N1 > 0,
        write(N1),write(' Bow of Yalheir'), nl;

        true
    ),
    
    hitungElmtX(Inventory_list, N2, Arrow2),
    (
        N2 > 0,
        write(N2),write(' Shadowleaf Skeletal Longbow'), nl;

        true
    ),

    hitungElmtX(Inventory_list, N3, Arrow3),
    (
        N3 > 0,
        write(N3),write(' Ironbark Piercer'), nl;

        true
    ),

    print_inventory_potion,
    print_inventory_armor, !.

print_inventory :-
    player(Nama_role,_,_,_,_,_,_,_,_),
    Nama_role == 'sorcerer',

    item(3, Staff1,_,_,_,_,_),
    item(9, Staff2,_,_,_,_,_),
    item(10,Staff3,_,_,_,_,_),
    inventory_player(Inventory_list, Inventory_count),

    write('LIST ITEM INVENTORY'),nl,
    hitungElmtX(Inventory_list, N1, Staff1),
    (
        N1 > 0,
        write(N1),write(' Staff of Yalheir'), nl;

        true 
    ),
    
    hitungElmtX(Inventory_list, N2, Staff2),
    (
        N2 > 0,
        write(N2),write(' Fiery Sagewood Cane'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N3, Staff3),
    (
        N3 > 0,
        write(N3),write(' Maelstrom'), nl;

        true 
    ),

    print_inventory_potion,
    print_inventory_armor,!.

print_inventory_potion :-
    potion(1, Potion1,_,_,_,_),
    potion(2, Potion2,_,_,_,_),
    potion(3, Potion3,_,_,_,_), 
    inventory_player(Inventory_list, Inventory_count),

    hitungElmtX(Inventory_list, N1, Potion1),
    (
        N1 > 0,
        write(N1),write(' Small Health'), nl;

        true 
    ),
    hitungElmtX(Inventory_list, N2, Potion2),
    (
        N2 > 0,
        write(N1),write(' Medium Health'), nl;

        true 
    ),
    hitungElmtX(Inventory_list, N3, Potion3),
    (
        N3 > 0,
        write(N3),write(' Big Health'), nl;

        true
    ).  

print_inventory_armor :-
    item(4, Armor1,_,_,_,_,_),
    item(11, Armor2,_,_,_,_,_),
    item(12, Armor3,_,_,_,_,_),
    inventory_player(Inventory_list, Inventory_count),

    hitungElmtX(Inventory_list, N1, Armor1),
    (
        N1 > 0,
        write(N1),write(' Yalheirian Knight Armor'), nl;

        true
    ),

    hitungElmtX(Inventory_list, N2, Armor2),
    (
        N2 > 0,
        write(N2),write(' Tunic of Timeless Fires'), nl;

        true
    ),

    hitungElmtX(Inventory_list, N3, Armor3),
    (
        N3 > 0,
        write(N3),write(' Hollow Iron Armor'), nl;

        true
    ).  