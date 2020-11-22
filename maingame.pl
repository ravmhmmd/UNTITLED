% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : maingame.pl                           |
% |________________________________________________|
%

/* ------------------------- IMPORT FILE YANG DIGUNAKAN -------------------------- */
:- include('facts.pl').
:- include('map.pl').

/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(inGame/0).   % saat pemain memulai permainan

/* ---------------------------------- COMMANDS ----------------------------------- */

/* Play */
start :-
    inGame,
    write('Permainan sudah dimulai'),!.
start :-
    asserta(inGame).

/* Map */
map :-
    Xmin is 0,
    Ymin is 0,
    Xmax is 11,
    Ymax is 16,
    forall(between(Xmin, Xmax, I), (
        forall(between(Ymin, Ymax, J), (
            printElmtMap(I,J)
        ))
    )),
    write('Keterangan : '),nl,
    write('P    : Player'),nl,
    write('S    : Shop'),nl,
    write('D    : Dungeon Boss'),nl,
    write('Q    : Quest'),nl,
    write('M    : Miniboss'),nl,
    write('-    : Empty Space'),nl,!.

/* W, A, S, D */
w :-
    player(X,_),
    X=:=1,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke atas.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

w :-
    retract(player(X,Y)),
    NX is X-1,
    asserta(player(NX,Y)),
    map,!.

a :-
    player(_,Y),
    Y=:=1,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke kiri.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

a :-
    retract(player(X,Y)),
    NY is Y-1,
    asserta(player(X,NY)),
    map,!.

s :-
    player(X,_),
    X=:=10,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke bawah.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

s :-
    retract(player(X,Y)),
    NX is X+1,
    asserta(player(NX,Y)),
    map,!.

d :-
    player(X,Y),
    Y=:=15,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke kanan.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

d :-
    retract(player(X,Y)),
    NY is Y+1,
    asserta(player(X,NY)),
    map,!.

/* Quit */
quit :-
    halt.

/* Help */
help :-
    write(' _____________________________________________________________________'), nl,
    write(' |    1. start.    : Memulai permainan                               |'), nl,
    write(' |    2. map.      : Menampilkan peta                                |'), nl,
    write(' |    3. status.   : Menampilkan kondisi pemain                      |'), nl,
    write(' |    4. w.        : Bergerak ke atas 1 langkah                      |'), nl,
    write(' |    5. a.        : Bergerak ke kiri 1 langkah                      |'), nl,
    write(' |    6. s.        : Bergerak ke bawah 1 langkah                     |'), nl,
    write(' |    7. d.        : Bergerak ke kanan 1 langkah                     |'), nl,
    write(' |    8. save.     : Menyimpan permainan                             |'), nl,
    write(' |    9. load.     : Memuat permainan                                |'), nl,
    write(' |   10. quit.     : Keluar dari permainan                           |'), nl,
    write(' |   11. help.     : Menampilkan bantuan                             |'), nl,
    write(' |___________________________________________________________________|'), nl, nl.

