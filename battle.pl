% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : battle.pl                             |
% |________________________________________________|
%

/* ------------------------- IMPORT FILE YANG DIGUNAKAN -------------------------- */
:- include('facts.pl').
:- include('quest.pl').
:- include('inventory.pl').
:- include('gui.pl').

/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(wave/1).
wave(1).
:- dynamic(enemyHP/2).
enemyHP(0,0).

/* -------------------------- ATTACK & SPECIAL ATTACK ---------------------------- */
/* Player Attack */
playerAttack :-
    enemyHP(_,X),
    enemy(_,_,_,_,_,_,_,EnemyDefense,_,_),
    player(_,_,_,_,PlayerAttack,_,_,_,_),
    Attack_player is PlayerAttack - EnemyDefense,
    retract(enemyHP(X)),
    NewX is X - Attack_player,
    asserta(enemyHP(NewX)).

playerSpecial :-
    enemyHP(_,X),
    enemy(_,_,_,_,_,_,_,EnemyDefense,_,_),
    player(_,_,_,_,_,PlayerSpecial,_,_,_),
    Special_player is PlayerSpecial - EnemyDefense,
    retract(enemyHP(X)),
    NewX is X - Special_player,
    asserta(enemyHP(NewX)).

/* Enemy Attack */
enemyAttack :-
    enemy(_,_,_,_,_,EnemyAttack,_,_,_,_),
    player(Nama_role, Level, PlayerMaxHP, PlayerHP, PlayerAttack, PlayerSpecial, PlayerDefense, PlayerEXP, PlayerGold),
    Attack_enemy is EnemyAttack - PlayerDefense,
    retract(player(Nama_role, Level, PlayerMaxHP, PlayerHP, PlayerAttack, PlayerSpecial, PlayerDefense, PlayerEXP, PlayerGold)),
    NewHP is PlayerHP - Attack_enemy,
    asserta(player(Nama_role, Level, PlayerMaxHP, NewHP, PlayerAttack, PlayerSpecial, PlayerDefense, PlayerEXP, PlayerGold)).

enemyAttack :-
    enemy(_,_,_,_,_,_,EnemySpecial,_,_,_),
    player(Nama_role, Level, PlayerMaxHP, PlayerHP, PlayerAttack, PlayerSpecial, PlayerDefense, PlayerEXP, PlayerGold),
    Special_enemy is EnemySpecial - PlayerDefense,
    retract(player(Nama_role, Level, PlayerMaxHP, PlayerHP, PlayerAttack, PlayerSpecial, PlayerDefense, PlayerEXP, PlayerGold)),
    NewHP is PlayerHP - Special_enemy,
    asserta(player(Nama_role, Level, PlayerMaxHP, NewHP, PlayerAttack, PlayerSpecial, PlayerDefense, PlayerEXP, PlayerGold)).

/* ------------------------------ ATTACK SEQUENCE -------------------------------- */
/* Enemy biasa */
attackSeq :-
    enemyHP(EnemyMaxHP,EnemyHP),
    player(_,_,PlayerMaxHP,PlayerHP,_,_,_,_,_),
    write('HP Enemy : '), write(EnemyHP), write(' / '), write(EnemyMaxHP),nl,
    write('HP Anda  : '), write(PlayerHP), write(' / '), write(PlayerMaxHP),nl,
    random(0,11,SpecEnemy),
    (
        SpecPlayer < 10,
        enemyAttack;

        SpecPlayer >= 10,
        enemySpecial
    ),
    random(0,11,SpecPlayer),
    (
        SpecPlayer < 10,
        playerAttack;

        SpecPlayer >= 10,
        playerSpecial
    ),

    enemyHP(_,EnemyHP),
    (
        EnemyHP > 0,
        attackSeq;

        winState
    ),

    player(_,_,PlayerMaxHP,PlayerHP,_,_,_,_,_),
    (
        PlayerHP < 1,
        loseState;

        true
    ).

/* Miniboss */
attackSeqMiniboss :-
    enemyHP(EnemyMaxHP,EnemyHP),
    player(_,_,PlayerMaxHP,PlayerHP,_,_,_,_,_),
    write('HP Enemy : '), write(EnemyHP), write(' / '), write(EnemyMaxHP),nl,
    write('HP Anda  : '), write(PlayerHP), write(' / '), write(PlayerMaxHP),nl,
    random(0,11,SpecEnemy),
    (
        SpecPlayer < 10,
        enemyAttack;

        SpecPlayer >= 10,
        enemySpecial
    ),
    random(0,11,SpecPlayer),
    (
        SpecPlayer < 10,
        playerAttack;

        SpecPlayer >= 10,
        playerSpecial
    ),

    enemyHP(_,EnemyHP),
    (
        EnemyHP > 0,
        attackSeq;

        miniboss(X),
        (
            X =:= 3,
            enemy(13,_,_,Enemy2MaxHP,Enemy2HP,_,_,_,_,_),
            write('Kamu melawan Miniboss 3: Supermega Chimera. Ayo kalahkan!'),nl,
            retract(enemyHP(EnemyMaxHP,0)),
            asserta(enemyHP(Enemy2MaxHP,Enemy2HP)),
            attackSeqMiniboss;

            winStateMiniboss
        )
    ),
    
    player(_,_,PlayerMaxHP,PlayerHP,_,_,_,_,_),
    (
        PlayerHP < 1,
        loseState;

        true
    ).

/* Dungeon Boss */
attackSeqBoss :-
    enemyHP(EnemyMaxHP,EnemyHP),
    player(_,_,PlayerMaxHP,PlayerHP,_,_,_,_,_),
    write('HP Enemy : '), write(EnemyHP), write(' / '), write(EnemyMaxHP),nl,
    write('HP Anda  : '), write(PlayerHP), write(' / '), write(PlayerMaxHP),nl,
    random(0,11,SpecEnemy),
    (
        SpecPlayer < 10,
        enemyAttack;

        SpecPlayer >= 10,
        enemySpecial
    ),
    random(0,11,SpecPlayer),
    (
        SpecPlayer < 10,
        playerAttack;

        SpecPlayer >= 10,
        playerSpecial
    ),

    enemyHP(_,EnemyHP),
    (
        EnemyHP > 0,
        attackSeq;

        victory_page,
        credit_page,
        sleep(30),nl
    ),
    
    player(_,_,PlayerMaxHP,PlayerHP,_,_,_,_,_),
    (
        PlayerHP < 1,
        loseState;

        true
    ).

/* --------------------------------- WIN STATE ----------------------------------- */
/* Enemy biasa, tidak dalam quest */
winState :-
    inQuest(0),
    enemy(_,Nama_enemy,_,_,_,_,_,_,DropEXP,DropGold),
    write('Selamat, anda berhasil mengalahkan '), write(Nama_enemy), write('.'),nl,
    write('Anda mendapatkan '),write(DropEXP), write(' EXP dan '),write(DropGold), write(' gold.'),nl,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    NewEXP is EXP + DropEXP,
    NewGold is Gold + DropGold,
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, NewEXP, NewGold)),
    retract(enemyHP(EnemyMaxHP,EnemyHP)),
    asserta(enemyHP(0,0)).

/* Enemy biasa, sedang dalam quest */
winState :-
    inQuest(1),
    enemy(_,Nama_enemy,_,_,_,_,_,_,DropEXP,DropGold),
    write('Selamat, anda berhasil mengalahkan '), write(Nama_enemy), write('.'),nl,
    write('Anda mendapatkan '),write(DropEXP), write(' EXP dan '),write(DropGold), write(' gold.'),nl,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    NewEXP is EXP + DropEXP,
    NewGold is Gold + DropGold,
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, NewEXP, NewGold)),
    retract(enemyHP(EnemyMaxHP,EnemyHP)),
    asserta(enemyHP(0,0)),

    retract(killCount(KilledGoblin, KilledSlime, KilledWolf)),
    (
        Nama_enemy == 'goblin',
        NewKilledGoblin is KilledGoblin + 1,
        asserta(killCount(NewKilledGoblin, KilledSlime, KilledWolf));

        Nama_enemy == 'slime',
        NewKilledSlime is KilledSlime + 1,
        asserta(killCount(KilledGoblin, NewKilledSlime, KilledWolf));

        Nama_enemy == 'wolf',
        NewKilledWolf is KilledWolf + 1,
        asserta(killCount(KilledGoblin, KilledSlime, NewKilledWolf))
    ).  

/* Miniboss */
winStateMiniboss :-
    enemy(_,_,_,_,_,_,_,_,DropEXP,DropGold),
    write('Selamat, anda berhasil mengalahkan miniboss.'),nl,
    write('Anda mendapatkan '),write(DropEXP), write(' EXP dan '),write(DropGold), write(' gold.'),nl,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    NewEXP is EXP + DropEXP,
    NewGold is Gold + DropGold,
    asserta(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, NewEXP, NewGold)),
    retract(enemyHP(EnemyMaxHP,EnemyHP)),
    asserta(enemyHP(0,0)),

    retract(wave(Wave)),
    NewWave is Wave + 1,
    asserta(wave(NewWave)),

    miniboss(X),
    (
        X =:= 3,
        nl, write('Anda telah mengalahkan semua Miniboss!'),nl,
        write('Sekarang anda dapat melawan DRAGON OF YALHEIR.'),nl;

        X =:= 4, % hidden miniboss
        nl, write('Anda berhasil mengalahkan Hidden Miniboss!'),nl,
        write('Anda mendapatkan item legendary, check inventory Anda.'),nl,
        (
            Nama_role == 'swordsman',
            insert_item(aetherius_blade);

            Nama_role == 'archer',
            insert_item(bolter_of_the_king);

            Nama_role == 'sorcerer',
            insert_item(soul_of_holy_might)
        ),
        insert_item(vest_of_cursed_dreams)
    ),

    retract(miniboss_loc(X,Y)),
    asserta(miniboss_loc(0,0)).

/* --------------------------------- LOSE STATE ---------------------------------- */
loseState :-
    player(_,_,_,_,HP,_,_,_,_,_),
    HP =:= 0,
    retract(inGame(1)),
    asserta(inGame(0)),
    write('Anda tidak dapat melanjutkan permainan ini.'), nl,
    write('Permainan akan keluar secara otomatis dalam :'), nl,
    write('5 . . . . . . '), sleep(1),
    write('4 . . . . . . '), sleep(1),
    write('3 . . . . . . '), sleep(1),
    write('2 . . . . . . '), sleep(1),
    write('1 . . . . . . '), sleep(1),
    halt.


battle :-
    wave(X),
    (
        % Wave 1
        X =:= 1,
        random(1,4,ID_enemy),
        enemy(ID_enemy,Nama_enemy,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu melawan '), write(Nama_enemy), write('. Ayo kalahkan!'), nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeq;

        % Wave 2
        X =:= 2,
        random(4,7,ID_enemy),
        enemy(ID_enemy,Nama_enemy,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu melawan '), write(Nama_enemy), write('. Ayo kalahkan!'), nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeq;

        % Wave 3
        X =:= 3,
        random(7,10,ID_enemy),
        enemy(ID_enemy,Nama_enemy,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu melawan '), write(Nama_enemy), write('. Ayo kalahkan!'), nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeq
    ).

miniboss_battle :-
    miniboss(X),
    (
        X =:= 1,
        enemy(10,_,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu bertemu Miniboss 1: HYDRA. Ayo kalahkan!'),nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeqMiniboss;

        X =:= 2,
        enemy(11,_,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu bertemu Miniboss 2: CHIMERA. Ayo kalahkan!'),nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeqMiniboss;

        X =:= 3,
        enemy(12,_,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu bertemu Miniboss 3: SUPERMEGA HYDRA. Ayo kalahkan!'),nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeqMiniboss;

        X =:= 4,
        enemy(14,_,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
        write('Kamu bertemu Miniboss 4: DEVIL OF YALHEIR. Ayo kalahkan!'),nl,
        retract(enemyHP(0,0)),
        asserta(enemyHP(EnemyMaxHP,EnemyHP)),
        attackSeqMiniboss
    ).

boss_battle :-
    enemy(15,_,_,EnemyMaxHP,EnemyHP,_,_,_,_,_),
    write('Kamu bertemu Boss: DRAGON OF YALHEIR. Ayo kalahkan!'),nl,
    retract(enemyHP(0,0)),
    asserta(enemyHP(EnemyMaxHP,EnemyHP)),
    attackSeqBoss.