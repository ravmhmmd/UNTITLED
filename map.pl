% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : map.pl                                |
% |________________________________________________|
%
/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(player_loc/2).
:- dynamic(quest_loc/2).
:- dynamic(miniboss_loc/2).
player_loc(1,1).
shop_loc(4,5).
shop_loc(8,12).
dungeon_boss_loc(10,15).

/* ------------------------------------ BATAS ------------------------------------ */
batasAtas(X,_) :-
    X=:=0.
batasKiri(_,Y) :-
    Y=:=0.
batasBawah(X,_) :-
    X=:=11.
batasKanan(_,Y)  :-
    Y=:=16.
    
printElmtMap(X,Y) :-
    batasBawah(X,Y),
    batasKanan(X,Y),
    write('#'),nl,!.
printElmtMap(X,Y) :-
    batasKanan(X,Y),
    write('#'),nl,!.
printElmtMap(X,Y) :-
    batasAtas(X,Y),
    write('# '),!.
printElmtMap(X,Y) :-
    batasKiri(X,Y),
    write('# '),!.
printElmtMap(X,Y) :-
    batasBawah(X,Y),
    write('# '),!.


/* ------------------------------------ PLAYER ------------------------------------ */
printElmtMap(X,Y) :-
    player_loc(X,Y),
    write('P '),!.

/* ------------------------------------- SHOP ------------------------------------- */
printElmtMap(X,Y) :-
    shop_loc(X,Y),
    write('S '),!.

/* --------------------------------- DUNGEON BOSS --------------------------------- */
printElmtMap(X,Y) :-
    dungeon_boss_loc(X,Y),
    write('D '),!.

/* ------------------------------------- QUEST ------------------------------------ */
printElmtMap(X,Y) :-
    quest_loc(X,Y),
    write('Q '),!.
    
/* --------------------------------- BAGIAN DALAM --------------------------------- */
printElmtMap(_,_) :-
    write('- '),!.

/* Merandomkan tempat quest */
randQuest :-
    random(1, 11, X),
    random(1, 16, Y),
    asserta(quest_loc(X,Y)).

/* Merandomkan tempat miniboss */
randMiniboss :-
    random(1, 11, X),
    random(1, 16, Y),
    asserta(miniboss_loc(X,Y)).