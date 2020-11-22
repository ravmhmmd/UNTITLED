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
:- dynamic(player/2).
asserta(player(1,1)).
(player(1,1)).
shop(4,5).
shop(8,12).
dungeon_boss(10,15).
quest(8,3).

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
    player(X,Y),
    write('P '),!.

/* ------------------------------------- SHOP ------------------------------------- */
printElmtMap(X,Y) :-
    shop(X,Y),
    write('S '),!.

/* --------------------------------- DUNGEON BOSS --------------------------------- */
printElmtMap(X,Y) :-
    dungeon_boss(X,Y),
    write('D '),!.

/* ------------------------------------- QUEST ------------------------------------ */
printElmtMap(X,Y) :-
    quest(X,Y),
    write('Q '),!.
    
/* --------------------------------- BAGIAN DALAM --------------------------------- */
printElmtMap(_,_) :-
    write('- '),!.
