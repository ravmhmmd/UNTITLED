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
:- include('shop.pl').
:- include('inventory.pl').
:- include('quest.pl').
:- include('battle.pl').
:- include('saveload.pl').
:- include('battle.pl').


/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(inGame/0).       % saat pemain memulai permainan
:- dynamic(nama_player/1).  % nama player
:- dynamic(player/9).       % stat player

/* ----------------------------- INISIALISASI GAME ------------------------------- */
:- initialization(start_page).

/* -------------------------------- FUNGSI LAIN ---------------------------------- */
input_nama :-
    write('Masukkan username yang akan digunakan : '),
    read(Nama),
    asserta(nama_player(Nama)), nl,
    write('Halo '), write(Nama), write(', selamat datang di Yalheir, sebuah desa di puncak Gunung Mahahiru.'), nl,!.

pilih_job(Role) :-
    Role =:= 1,
    ID_hero is Role,
    hero(ID_hero, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    write('Kamu memilih swordsman.'), nl,!.

pilih_job(Role) :-
    Role =:= 2,
    ID_hero is Role,
    hero(ID_hero, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    write('Kamu memilih archer.'), nl,!.

pilih_job(Role) :-
    Role =:= 3,
    ID_hero is Role,
    hero(ID_hero, Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    write('Kamu memilih sorcerer.'), nl,!.

pilih_job(_) :- % loop kalau input tidak valid
    write('Input tidak valid, silakan ulangi.'), nl,
    pilih_job_page,
    read(Role), nl,
    pilih_job(Role), nl,
    inisialisasi_inventory(Role),
    randQuest,
    write('Selamat berpetualang.').

/* ---------------------------------- COMMANDS ----------------------------------- */

/* Play */
start :-
    inGame,
    write('Permainan sudah dimulai'),!.
start :-
    asserta(inGame),
    input_nama, nl,
    pilih_job_page,
    read(Role), nl,
    pilih_job(Role), nl,
    inisialisasi_inventory(Role),
    randQuest,
    nl,nl,
    write('Pada zaman dahulu di Desa Yalheir...'),nl,
    write('Anda adalah anak dari seorang pedagang di Desa Yalheir. Sehari-hari anda membantu orang tua Anda.'),nl,
    write('Anda memiliki banyak teman, tetapi teman terdekat Anda adalah seorang putri raja.'),nl,nl,
    sleep(2),
    write('Pada suatu hari, Anda datang ke tempat Anda sering bertemu dengan sang putri.'),nl,
    write('Namun, sang putri tak kunjung datang. Anda telah menunggu berjam-jam, namun ia tidak datang-datang.'),nl,
    write('Ketika Anda mendatangi istana sang putri, Anda malah melihat seekor naga yang terbang dari istana.'),nl,
    write('Anda terkejut, tetapi anda bertekad untuk menyelamatkan sang putri yang telah diculik sang naga.'),nl,
    write('Anda mengambil senjata dan armor dari gudang yang hampir tidak pernah digunakan di rumah Anda, dan pergi untuk menyelamatkan putri.'),nl,nl,
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
    nama_player(Nama),
    write(' |===========================================|'), nl,
    write(' |               Status Pemain               |'), nl,
    write(' |-------------------------------------------|'), nl,
    write('         Nama             : '),write(Nama), nl,
    write('         Job              : '),write(Job),nl,
    write('         Level            : '),write(Level),nl,
    write('         HP               : '),write(HP),write(' from '),write(MaxHP),nl,
    write('         EXP              : '),write(EXP),write(' from 300'),nl,
    write('         Attack           : '),write(Attack),nl,
    write('         Special Attack   : '),write(Special),nl,
    write('         Defense          : '),write(Defense),nl,
    write('         Gold             : '),write(Gold),nl,
    write(' |===========================================|'),!.
    

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
    map,nl,
    random(1,11,B),
    (
        B < 5,
        battle;

        true    
    ),!.

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
    map,nl,
    random(1,11,B),
    (
        B < 5,
        battle;

        true 
    ),!.

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
    map,nl,
    random(1,11,B),
    (
        B < 5,
        battle;

        true    
    ),!.

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
    map,nl,
    random(1,11,B),
    (
        B < 5,
        battle;

        true    
    ),!.

/* Shop */

isDiShop :-
    player_loc(XP,YP),
    shop_loc(XS,YS),
    XP =:= XS,
    YP =:= YS, !.

shop :-
    isDiShop, nl,
    shop_page,
    repeat,
    read(Comm),
    (
        Comm = 'beliPotion', call(beliPotion);
        Comm = 'beliItem', call(beliItem);
        Comm = 'keluarToko', call(keluarToko)
    ).

shop :-
    \+ isDiShop, nl,
    write('Anda sedang tidak berada di Toko, tidak bisa membeli apapun disini.'), nl, nl,
    write('Masukan command lain.'), nl.

/* Fight */
isDiMiniboss :-
    player_loc(XP, YP),
    miniboss_loc(XM, YM),
    XP =:= XM,
    YP =:= YM.
isDiBoss :-
    player_loc(XP,YP),
    dungeon_boss_loc(XB,YB),
    XP =:= XB,
    YP =:= YB.
    

fight :-
    isDiMiniboss, nl,
    miniboss_battle,!.

fight :-
    isDiBoss, nl,
    miniboss(M),
    M < 3,
    write('Anda belum bisa melawan boss. Silakan menyelesaikan quest terlebih dahulu.'),nl,!.

fight :-
    isDiBoss, nl,
    boss_battle,!.

fight :-
    \+ isDiMiniboss, 
    \+ isDiBoss, nl,
    write('Anda tidak berada di zona Miniboss ataupun Boss. Silakan masukkan command lain.'),nl,!.

fight :-
    \+ isDiMiniboss,nl,
    write('Anda tidak berada di zona Miniboss. Silakan masukkan command lain.'),nl,!.

fight :-
    \+ isDiBoss,nl,
    write('Anda tidak berada di zona Boss. Silakan masukkan command lain.'),nl,!.

/* Quit */
quit :-
    write('Anda akan keluar dari permainan. Segala progres yang belum tersimpan akan hilang permanen.'),nl,
    sleep(1),
    halt.

/* Help */
help :-
    write(' |===================================================================|'), nl,
    write(' |    1. start.    : Memulai permainan                               |'), nl,
    write(' |    2. map.      : Menampilkan peta                                |'), nl,
    write(' |    3. status.   : Menampilkan kondisi pemain                      |'), nl,
    write(' |    4. inventory.: Menampilkan inventory pemain                    |'), nl,
    write(' |    5. w.        : Bergerak ke atas 1 langkah                      |'), nl,
    write(' |    6. a.        : Bergerak ke kiri 1 langkah                      |'), nl,
    write(' |    7. s.        : Bergerak ke bawah 1 langkah                     |'), nl,
    write(' |    8. d.        : Bergerak ke kanan 1 langkah                     |'), nl,
    write(' |    9. shop.     : Masuk ke shop untuk belanja                     |'), nl,
    write(' |   10. fight.    : Melawan Boss/Miniboss pada map                  |'), nl,
    write(' |   11. quit.     : Keluar dari permainan                           |'), nl,
    write(' |   12. help.     : Menampilkan bantuan                             |'), nl,
    write(' |===================================================================|'), nl, nl.

/* credit */
credit :-
    credit_page.

/* cheat */
dragonprincess :-
    retract(player(Job,Level,MaxHP,HP,Attack,Special,Defense,EXP,Gold)),
    NewLevel is 999,
    NewMaxHP is 99999,
    NewHP is NewMaxHP,
    NewAttack is 9999,
    NewSpecial is NewAttack*2,
    NewDefense is 999,
    NewEXP is 299,
    NewGold is 99999,
    asserta(player(Job,NewLevel,NewMaxHP,NewHP,NewAttack,NewSpecial,NewDefense,NewEXP,NewGold)),
    write('Anda telah mengaktifkan cheat god mode pada permainan ini.'),nl,
    write('Selamat bersenang-senang.'),nl,!.
tamat :-
    retract(miniboss(M)),
    NM is M+4,
    asserta(miniboss(NM)).