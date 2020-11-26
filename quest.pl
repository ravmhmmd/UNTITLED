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

/* ----------------------------- DYNAMIC PREDICATE ------------------------------- */
:- dynamic(inQuest/1).
:- dynamic(killCount/3).

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
    write('Slime  : '),write(KilledSlime),write('/'),write(JmlSlime), nl,
    write('Goblin : '),write(KilledWolf),write('/'),write(JmlWolf), nl, !.    