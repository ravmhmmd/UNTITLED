% __________________________________________________
% |  Tugas Besar Logika Komputasional  -  IF 2121  |
% |  Kelas 01 | Kelompok 08                        |
% |------------------------------------------------|
% |  Rahmah Khoirussyifa’ Nurdini        13519013  |
% |  Syarifah Aisha G.Y.                 13519089  |
% |  Delisha Azza Naadira                13519133  |
% |  Muhammad Rayhan Ravianda            13519201  |
% |------------------------------------------------|
% |  File  : quest.pl                              |
% |________________________________________________|
%

:- include('map.pl').
:- include('facts.pl').

/* ---------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(inQuest/1).
inQuest(0).
:- dynamic(killCount/3).
:- dynamic(noQuest/1).
noQuest(0).
:- dynamic(miniboss/1).
miniboss(0).

/* quest(ID_quest, jmlGoblin, jmlSlime, jmlWolf). */
% quest wave 1
quest(1,1,1,1).
quest(2,3,3,3).

% quest wave 2
quest(3,2,4,3).
quest(4,3,3,4).

% quest wave 3
quest(5,4,3,4).
quest(6,5,5,5).

% quest hidden
quest(7,9,9,9).

/* quest_rewards(ID_quest, DropEXP, DropGold). */
quest_rewards(1,200,200).
quest_rewards(2,200,250).
quest_rewards(3,200,300).
quest_rewards(4,200,350).
quest_rewards(5,200,400).
quest_rewards(6,200,450).

/* mulai quest */
isDiQuest :-
    player_loc(XP,YP),
    quest_loc(XQ,YQ),
    XP =:= XQ,
    YP =:= YQ.

questStart :-
    \+ isDiQuest,
    write('Anda tidak berada dalam zona quest.').

questStart :-
    isDiQuest,
    inQuest(1),
    questStatus.

questStart :-
    isDiQuest,
    inQuest(0),
    retract(inQuest(0)),
    asserta(inQuest(1)),
    retract(noQuest(X)),
    NX is X+1,
    asserta(noQuest(NX)),
    quest(NX,_,_,_),
    asserta(killCount(0,0,0)),
    questStatus.


/* progres quest */
isQuestFinish :-
    noQuest(X),
    quest(X, JmlGoblin, JmlSlime, JmlWolf),
    killCount(KilledGoblin, KilledSlime, KilledWolf),
    (
        KilleGoblin == JmlGoblin ->
        ( KilledSlime == JmlSlime ->
            ( KilledWolf == JmlWolf ->
                    write('Anda sudah menyelesaikan quest '),
                    write(X),
                    write(' !'), nl,
                    retract(inQuest(1)),
                    asserta(inQuest(0)),
                    randQuest,
                    quest_rewards(X, DropEXP, DropGold),
                    player(Job,Level,MaxHP,HP,Attack,Special,Defense,EXP,Gold),
                    NewEXP is DropEXP+EXP,
                    NewGold is DropGold+Gold,
                    asserta(player(Job,Level,MaxHP,HP,Attack,Special,Defense,NewEXP,NewGold));

                    nextLevel,
                    true    
            );
            true
        );
        true,
    
        mod(X,2) =:= 0, % ceritanya miniboss dimunculin tiap 2 quest
        randMiniboss,
        retract(miniboss(M)),
        M1 is M + 1,
        asserta(miniboss(M1));

        X =:= 7,
        randMiniboss,
        retract(miniboss(M)),
        M1 is M + 1,
        asserta(miniboss(M1))
    ).

questProgress(X) :-
    killCount(KilledGoblin, KilledSlime, KilledWolf),
    (
        X = goblin -> KilledGoblinNow is KilledGoblin+1, KilledSlimeNow is KilledSlime+0, KilledWolfNow is KilledWolf+0;
        X = slime -> KilledGoblinNow is KilledGoblin+0, KilledSlimeNow is KilledSlime+1, KilledWolfNow is KilledWolf+0;
        X = goblin -> KilledGoblinNow is KilledGoblin+0, KilledSlimeNow is KilledSlime+0, KilledWolfNow is KilledWolf+1
    ),
    retract(killCount(KilledGoblin, KilledSlime, KilledWolf)),
    asserta(killCount(KilledGoblinNow, KilledSlimeNow, KilledWolfNow)),
    isQuestFinish.

/* questStatus. */
questStatus :-
    inQuest(0),
    write('Anda tidak memiliki quest yang sedang aktif.'), nl, !.

questStatus :-
    inQuest(1),
    quest(ID_quest, JmlGoblin, JmlSlime, JmlWolf),
    killCount(KilledGoblin, KilledSlime, KilledWolf),
    write('Quest '),write(ID_quest),write(' : '), nl,
    write('Goblin : '),write(KilledGoblin),write('/'),write(JmlGoblin), nl,
    write('Slime  : '),write(KilledSlime),write('/'),write(JmlSlime), nl,!.
    
nextLevel :- 
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    EXP < 300.

nextLevel :-
    player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold),
    EXP >= 300,
    NewLevel is Level + 1,
    NewMaxHP is MaxHP + 100,
    NewHP is NewMaxHP,
    NewAttack is  Attack + 50,
    NewSpesial is NewAttack*2,
    NewDefense is Defense + 10,
    NewEXP is EXP - 300,
    NewGold is Gold + 50,
    retract(player(Nama_role, Level, MaxHP, HP, Attack, Special, Defense, EXP, Gold)),
    asserta(player(Nama_role, NewLevel, NewMaxHP, NewHP, NewAttack, NewSpecial, NewDefense, NewEXP, NewGold)),
    nextLevel,!.
    