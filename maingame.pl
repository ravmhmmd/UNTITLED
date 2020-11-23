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
:- include('gui.pl').

/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(inGame/0).       % saat pemain memulai permainan
:- dynamic(nama_player/1).  % nama player
:- dynamic(player/9).       % stat player

/* ----------------------------- INISIALISASI GAME ------------------------------- */
:- initialization(start_page).

/* -------------------------------- FUNGSI LAIN ---------------------------------- */
input_nama :-
    write('Masukkan username yang akan digunakan : '), nl,
    read(Nama),
    asserta(nama_player(Nama)), nl,
    write('Halo '), write(Nama), write(', selamat datang di <nama desanya>.'), nl,!.

pilih_job(Role) :-
    Role =:= 1,
    hero(1, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),!.

pilih_job(Role) :-
    Role =:= 2,
    hero(2, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),!.

pilih_job(Role) :-
    Role =:= 3,
    hero(3, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),!.

/* ---------------------------------- COMMANDS ----------------------------------- */

/* Play */
start :-
    inGame,
    write('Permainan sudah dimulai'),!.
start :-
    asserta(inGame),
    input_nama,
    write('Pilih role yang diinginkan : '), nl,
    write('1. swordsman.'), nl,
    write('   Max HP      : 200'), nl,
    write('   Attack      : 60'), nl,
    write('   Spc. Attack : 100'), nl,
    write('   Defense     : 10'), nl,
    nl,
    write('2. archer.'),nl,
    write('   Max HP      : 200'), nl,
    write('   Attack      : 50'), nl,
    write('   Spc. Attack : 90'), nl,
    write('   Defense     : 15'), nl,
    nl,
    write('3. sorcerer.'),nl,
    write('   Max HP      : 200'), nl,
    write('   Attack      : 40'), nl,
    write('   Spc. Attack : 80'), nl,
    write('   Defense     : 20'), nl,
    write('Role yang dipilih (masukkan angkanyas) : '),
    read(Role), nl,
    pilih_job(Role), nl,
    write('Selamat berpetualang.').

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

/* Status */
status :-
    player(Job,Level,MaxHP,HP,Attack,Special,Defense,EXP,Gold),
    write('Status Pemain : '),nl,
    write('Job              : '),write(Job),nl,
    write('Level            : '),write(Level),nl,
    write('HP               : '),write(HP),write(' from '),write(MaxHP),nl,
    write('EXP              : '),write(EXP),nl,
    write('Attack           : '),write(Attack),nl,
    write('Special Attack   : '),write(Special),nl,
    write('Defense          : '),write(Defense),nl,
    write('Gold             : '),write(Gold),nl.
    

/* W, A, S, D */
w :-
    player_loc(X,_),
    X=:=1,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke atas.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

w :-
    retract(player_loc(X,Y)),
    NX is X-1,
    asserta(player_loc(NX,Y)),
    write('Anda bergerak ke atas sejauh 1 tile.'), nl,
    map,!.

a :-
    player_loc(_,Y),
    Y=:=1,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke kiri.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

a :-
    retract(player_loc(X,Y)),
    NY is Y-1,
    asserta(player_loc(X,NY)),
    write('Anda bergerak ke kiri sejauh 1 tile.'), nl,
    map,!.

s :-
    player_loc(X,_),
    X=:=10,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke bawah.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

s :-
    retract(player_loc(X,Y)),
    NX is X+1,
    asserta(player_loc(NX,Y)),
    write('Anda bergerak ke bawah sejauh 1 tile.'), nl,
    map,!.

d :-
    player_loc(_,Y),
    Y=:=15,
    write('Anda berada di pinggir Map, tidak bisa bergerak ke kanan.'),nl,
    write('Masukan command lain.'),nl,
    map,!.

d :-
    retract(player_loc(X,Y)),
    NY is Y+1,
    asserta(player_loc(X,NY)),
    write('Anda bergerak ke kanan sejauh 1 tile.'), nl,
    map,!.

/* Quit */
quit :-
    halt.

/* Help */
help :-
    write(' _____________________________________________________________________'), nl,
    write(' |                                                                   |'), nl,
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

