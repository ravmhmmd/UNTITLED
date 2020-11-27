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
:- dynamic(equip_player/2).

/* --------------------------- INISIALISASI INVENTORY ---------------------------- */
inisialisasi_inventory(Role) :-
    Role =:= 1,
    inventory(1,Inventory_list,Inventory_count),
    equip(1, Weapon, Armor),
    asserta(equip_player(Weapon, Armor)),
    asserta(inventory_player(Inventory_list, Inventory_count)),
    write('Kamu memiliki 2 item, Sword of Yalheir dan Yalheirian Knight Armor dalam inventory.'), nl,!.

inisialisasi_inventory(Role) :-
    Role =:= 2,
    inventory(2,Inventory_list,Inventory_count),
    equip(2, Weapon, Armor),
    asserta(equip_player(Weapon, Armor)),
    asserta(inventory_player(Inventory_list, Inventory_count)), 
    write('Kamu memiliki 2 item, Bow of Yalheir dan Yalheirian Knight Armor dalam inventory.'), nl,!.

inisialisasi_inventory(Role) :-
    Role =:= 3,
    inventory(3,Inventory_list,Inventory_count),
    equip(3, Weapon, Armor),
    asserta(equip_player(Weapon, Armor)),
    asserta(inventory_player(Inventory_list, Inventory_count)),
    write('Kamu memiliki 2 item, Staff of Yalheir dan Yalheirian Knight Armor dalam inventory.'), nl, !.

/* ---------------------- MENAMBAHKAN ITEM BARU KE LIST ------------------------ */
/*** Deklarasi Fakta ***/
addLast(E,[],[E]).

/*** Deklarasi Rules ***/
addLast(E,[H|T],[H|L]) :- addLast(E,T,L).

/* ----------------- MENGHITUNG BANYAKNYA ELEMEN LIST TERTENTU ----------------- */
/* hitungElmtX(List, Count, Elmt) */
hitungElmtX([],0,_).
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

/* ------------------------ MENAMBAH ITEM PADA INVENTORY ----------------------- */
insert_item(Nama_item) :-
    inventory_player(Inventory_list, Inventory_count),

    addLast(Nama_item, Inventory_list, New_inventory_list),
    New_inventory_count is Inventory_count+1,

    retract(inventory_player(Inventory_list, Inventory_count)),
    asserta(inventory_player(New_inventory_list, New_inventory_count)), !.


/* ---------------------- MENGGUNAKAN ITEM PADA INVENTORY --------------------- */
/* Untuk Equip item */
use_item(Nama_item) :-
    inventory_player(Inventory_list,_),
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    item(_,Nama_item,_,_,_,Y,Z),
    NewAttack is Attack+Y,
    NewDefense is Defense+Z,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, HP, NewAttack, Special, NewDefense, EXP, Gold)),
    write('Anda berhasil menggunakan item tersebut, gunakan command "unequip" untuk melepas item.'),nl,!.

/* Untuk Menggunakan potion */
use_item(Nama_item) :-
    inventory_player(Inventory_list, Inventory_count),
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    potion(_,Nama_item,_,X,_,_),
    NewHP is HP+X,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, NewHP, Attack, Special, Defense, EXP, Gold)),

    dumpItem(Inventory_list, Nama_item, New_inventory_list),
    New_inventory_count is Inventory_count-1,

    retract(inventory_player(Inventory_list, Inventory_count)),
    asserta(inventory_player(New_inventory_list, New_inventory_count)),
    write('Anda berhasil menggunakan potion.'),nl,!.

/* Untuk Unequip item */
unused_item(Nama_item) :-
    inventory_player(Inventory_list,_),
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    item(_,Nama_item,_,_,_,Y,Z),
    NewAttack is Attack-Y,
    NewDefense is Defense-Z,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, Level, MaxHP, HP, NewAttack, Special, NewDefense, EXP, Gold)),
    write('Anda tidak lagi menggunakan item tersebut.'),nl,!.

/* ------------------------- EQUIP ------------------------ */
equip :-
    equip_player(Weapon, Armor),
    inventory_player(Inventory_list,_),
    write('Silahkan pilih item (ID Item) : '),
    read(ID_item),nl,
    (
        ID_item >= 13,
        ID_item =< 16,
        (
            Armor == 'x',
            item(ID_item,Nama_item,_,_,_,_,_),
            hitungElmtX(Inventory_list, N, Nama_item),
            (
                N > 0,
                NewArmor = Nama_item,
                retract(equip_player(Weapon, Armor)),
                asserta(equip_player(Weapon, NewArmor)),
                use_item(Nama_item);
                
                N =:= 0,
                write('Anda tidak meiliki armor tersebut dalam inventory.'),nl
            );

            Armor \= 'x',
            write('Anda sudah menggunakan sebuah armor, gunakan command "unequip" untuk melepas armor.')
        );

        ID_item >= 1,
        ID_item =< 12,
        (
            Weapon == 'x',
            item(ID_item,Nama_item,_,_,_,_,_),
            hitungElmtX(Inventory_list, N, Nama_item),
            (
                N > 0,
                NewWeapon = Nama_item,
                retract(equip_player(Weapon, Armor)),
                asserta(equip_player(NewWeapon, Armor)),
                use_item(Nama_item);
                
                N =:= 0,
                write('Anda tidak meiliki weapon tersebut dalam inventory.'),nl
            );

            Weapon \= 'x',
            write('Anda sudah menggunakan sebuah weapon, gunakan command "unequip" untuk melepas weapon.')
        );
        
        ID_item < 1,
        write('ID item tidak valid.');
        
        ID_item > 16,
        write('ID item tidak valid.')  
    ),!.

/* ------------------------- UNEQUIP ------------------------ */
unequip :-
    equip_player(Weapon, Armor),
    print_equip,
    write('Silahkan pilih item (ID Item) : '),
    read(ID_item),nl,
    item(ID_item,Nama_item,_,_,_,_,_),
    (
        ID_item >= 13,
        ID_item =< 16,
        (
            Armor == Nama_item,
            NewArmor = 'x',
            retract(equip_player(Weapon, Armor)),
            asserta(equip_player(Weapon, NewArmor)),
            unused_item(Nama_item);

            Armor \= Nama_item,
            write('Anda tidak sedang menggunakan armor tersebut.'),nl
        );

        ID_item >= 1,
        ID_item =< 12,
        (
            Weapon == Nama_item,
            NewWeapon = 'x',
            retract(equip_player(Weapon, Armor)),
            asserta(equip_player(NewWeapon, Armor)),
            unused_item(Nama_item);

            Weapon \= Nama_item,
            write('Anda tidak sedang menggunakan weapon tersebut.'),nl
        );

        ID_item < 1,
        write('ID item tidak valid.');
        
        ID_item > 16,
        write('ID item tidak valid.')  
            
            
    ),!.      
  
/* ------------------------- PRINT EQUIPPED ITEMS ------------------------ */
print_equip :-
    equip_player(Weapon, Armor),
    write('|   Weapon : '),
    (
        Weapon == 'x',
        write('                             |'),nl;

        item(ID_item, Weapon,_,_,_,_,_),
        (
            ID_item =:= 1,
            write('Sword of Yalheir             |');

            ID_item =:= 2,
            write('Blade of a Thousand Cuts     |');

            ID_item =:= 3,
            write('Saber of Hope                |');

            ID_item =:= 4,
            write('Aetherius Blade              |');

            ID_item =:= 5,
            write('Bow of Yalheir               |');

            ID_item =:= 6,
            write('Shadowleaf Skeletal Longbow  |');

            ID_item =:= 7,
            write('Ironbark Piercer             |');

            ID_item =:= 8,
            write('Bolter of the King           |');

            ID_item =:= 9,
            write('Staff of Yalheir             |');

            ID_item =:= 10,
            write('Fiery Sagewood Cane          |');

            ID_item =:= 11,
            write('Maelstrom                    |');

            ID_item =:= 12,
            write('Soul of Holy Might           |')
        ),nl
    ),
    
    write('|   Armor  : '),
    (
        Armor == 'x',
        write('                             |'),nl;

        item(ID_item, Armor,_,_,_,_,_), 
        (
            ID_item =:= 13,
            write('Yalheirian Knight Armor      |');

            ID_item =:= 14,
            write('Tunic of Timeless Fires      |');

            ID_item =:= 15,
            write('Hollow Iron Armor            |');

            ID_item =:= 16,
            write('Vest of Cursed Dreams        |')
        ),nl      
    ).

/* ------------------------- USE POTION ------------------------ */
potion :- 
    inventory_player(Inventory_list,Inventory_count),
    write('Pilih potion yang ingin digunakan (ID Potion) : '),
    read(ID_item),
    (
        ID_item =:= 1; ID_item =:= 2; ID_item =:= 3,
        potion(ID_item, Potion,_,_,_,_),
        hitungElmtX(Inventory_count, N, Potion),
        (
            N > 0,
            use_item(Potion);

            N =:= 0,
            write('Anda tidak meiliki potion tersebut dalam inventory.')
        );

        ID_item =\= 1,
        ID_item =\= 2,
        ID_item =\= 3,
        write('ID Potion tidak valid, silakan ulangi kembali.')
    ),!.

/* ------------------------- PRINT ITEM PADA INVENTORY ------------------------ */
inventory :-
    write('|=========================================|'),nl,
    write('|                                         |'),nl,
    write('|                INVENTORY                |'),nl,
    write('|                                         |'),nl,
    write('|-----------------------------------------|'),nl,
    write('|          Nama Item            | ID Item |'),nl,
    write('|-----------------------------------------|'),nl,

    player(Nama_role,_,_,_,_,_,_,_,_),
    (
        Nama_role == 'swordsman',
        inventory_swordsman;

        Nama_role == 'archer',
        inventory_archer;

        Nama_role == 'sorcerer',
        inventory_sorcerer
    ),    
    inventory_armor,
    inventory_potion,

    write('|=========================================|'),nl,
    write('|                                         |'),nl,
    write('|             EQUIPPED ITEMS              |'),nl,
    write('|                                         |'),nl,
    write('|-----------------------------------------|'),nl,

    print_equip,

    write('|=========================================|'),nl,nl,
    write('Gunakan command "equip" untuk menggunakan item dan "potion" untuk menggunakan potion.'),!.

inventory_swordsman :-
    item(1, Sword1,_,_,_,_,_),
    item(2, Sword2,_,_,_,_,_),
    item(3, Sword3,_,_,_,_,_),
    item(4, Sword4,_,_,_,_,_),

    inventory_player(Inventory_list,_),

    hitungElmtX(Inventory_list, N1, Sword1),
    (
        N1 > 0,
        write('|  '),write(N1),write(' Sword of Yalheir                1    |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N2, Sword2),
    (
        N2 > 0,
        write('|  '),write(N2),write(' Blade of a Thousand Cuts        2    |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N3, Sword3),
    (
        N3 > 0,
        write('|  '),write(N3),write(' Saber of Hope                   3    |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N4, Sword4),
    (
        N4 > 0,
        write('|  '),write(N4),write(' Aetherius Blade                 4    |'), nl;

        true 
    ).

inventory_archer :-
    item(5, Arrow1,_,_,_,_,_),
    item(6, Arrow2,_,_,_,_,_),
    item(7, Arrow3,_,_,_,_,_),
    item(8, Arrow4,_,_,_,_,_),

    inventory_player(Inventory_list,_),

    hitungElmtX(Inventory_list, N1, Arrow1),
    (
        N1 > 0,
        write('|  '),write(N1),write(' Bow of Yalheir                  5    |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N2, Arrow2),
    (
        N2 > 0,
        write('|  '),write(N2),write(' Shadowleaf Skeletal Longbow     6    |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N3, Arrow3),
    (
        N3 > 0,
        write('|  '),write(N3),write(' Ironbark Piercer                7    |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N4, Arrow4),
    (
        N4 > 0,
        write('|  '),write(N4),write(' Bolter of the King              8    |'), nl;

        true 
    ).

inventory_sorcerer :-
    item(9, Staff1,_,_,_,_,_),
    item(10, Staff2,_,_,_,_,_),
    item(11,Staff3,_,_,_,_,_),
    item(12,Staff4,_,_,_,_,_),
    inventory_player(Inventory_list,_),

    hitungElmtX(Inventory_list, N1, Staff1),
    (
        N1 > 0,
        write('|  '),write(N1),write(' Staff of Yalheir                9    |'), nl;

        true 
    ),
    
    hitungElmtX(Inventory_list, N2, Staff2),
    (
        N2 > 0,
        write('|  '),write(N2),write(' Fiery Sagewood Cane             10   |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N3, Staff3),
    (
        N3 > 0,
        write('|  '),write(N3),write(' Maelstrom                       11   |'), nl;

        true 
    ),

    hitungElmtX(Inventory_list, N4, Staff3),
    (
        N4 > 0,
        write('|  '),write(N4),write(' Soul of Holy Might              12   |'), nl;

        true 
    ).

inventory_armor :-
    item(13, Armor1,_,_,_,_,_),
    item(14, Armor2,_,_,_,_,_),
    item(15, Armor3,_,_,_,_,_),
    item(16, Armor4,_,_,_,_,_),

    inventory_player(Inventory_list,_),

    hitungElmtX(Inventory_list, N1, Armor1),
    (
        N1 > 0,
        write('|  '),write(N1),write(' Yalheirian Knight Armor         13   |'), nl;

        true
    ),

    hitungElmtX(Inventory_list, N2, Armor2),
    (
        N2 > 0,
        write('|  '),write(N2),write(' Tunic of Timeless Fires         14   |'), nl;

        true
    ),

    hitungElmtX(Inventory_list, N3, Armor3),
    (
        N3 > 0,
        write('|  '),write(N3),write(' Hollow Iron Armor               15   |'), nl;

        true
    ),

    hitungElmtX(Inventory_list, N4, Armor4),
    (
        N4 > 0,
        write('|  '),write(N4),write(' Vest of Cursed Dreams           16   |'), nl;

        true
    ).

inventory_potion :-
    potion(1, Potion1,_,_,_,_),
    potion(2, Potion2,_,_,_,_),
    potion(3, Potion3,_,_,_,_), 
    inventory_player(Inventory_list,_),

    hitungElmtX(Inventory_list, N1, Potion1),
    (
        N1 > 0,
        write('|  '),write(N1),write(' Small Health Potion             1    |'), nl;

        true 
    ),
    hitungElmtX(Inventory_list, N2, Potion2),
    (
        N2 > 0,
        write('|  '),write(N2),write(' Medium Health Potion            2    |'), nl;

        true 
    ),
    hitungElmtX(Inventory_list, N3, Potion3),
    (
        N3 > 0,
        write('|  '),write(N3),write(' Big Health Potion               3    |'), nl;

        true
    ).