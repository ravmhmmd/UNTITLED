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

inventory(Nama_role, Inventory_list) :-
    Nama_role = 'swordsman',
    item(1, Sword,_,_,_,_,_).
    item(4, Armor,_,_,_,_,_).
    Inventory_list = [Sword,Armor].

inventory(Nama_role, Inventory_list) :-
    Nama_role = 'archer',
    item(2, Arrow,_,_,_,_,_).
    item(4, Armor,_,_,_,_,_).
    Inventory_list = [Arrow,Armor].

inventory(Nama_role, Inventory_list) :-
    Nama_role = 'sorcerer',
    item(3, Staff,_,_,_,_,_).
    item(4, Armor,_,_,_,_,_).
    Inventory_list = [Staff,Armor].

/****************** PUSH INVENTORY BARU *****************/
/*** Deklarasi Fakta ***/
addLast(E,[],[E]).

/*** Deklarasi Rules ***/
addLast(E,[H|T],[H|L]) :- addLast(E,T,L).

/*** Deklarasi Fakta ***/

/*** Deklarasi Rules ***/
push(Element,Queue,Result) :- addLast(Element,Queue,Result).

/****************** POP INVENTORY HEAD *******************/
/*** Deklarasi Fakta ***/
remove([],[]).

/*** Deklarasi Rules ***/
remove([_|T],R) :- R=T.

/*** Deklarasi Fakta ***/
pop([],[]).

/*** Deklarasi Rules ***/
pop(Queue,Result) :- remove(Queue,Result).