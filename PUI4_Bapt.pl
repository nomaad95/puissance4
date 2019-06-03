/*test ici test*/ 


% Affichage des lignes
afficheLigne([A,B,C,D,E,F,G]):-
write(A), tab(1),write("|"),tab(1),
write(B), tab(1),write("|"),tab(1),
write(C), tab(1),write("|"),tab(1),
write(D), tab(1),write("|"),tab(1),
write(E), tab(1),write("|"),tab(1),
write(F), tab(1),write("|"),tab(1),
write(G), tab(1).

/*
[A1,B1,C1,D1,E1,F1,G1]
[A2,B2,C2,D2,E2,F2,G2]
[A3,B3,C3,D3,E3,F3,G3]
[A4,B4,C4,D4,E4,F4,G4]
[A5,B5,C5,D5,E5,F5,G5]
[A6,B6,C6,D6,E6,F6,G6]

[x,x,x,x,x,x,x],[x,x,x,x,x,x,x],[x,x,x,x,x,x,x],[x,x,x,x,x,x,x],[x,x,x,x,x,x,x],[x,x,x,x,x,x,x]


*/

$afficherLigne([x,x,x,x,x,x,x]).


% Affichage de la grille
afficheGrille([[A1,B1,C1,D1,E1,F1,G1],[A2,B2,C2,D2,E2,F2,G2],[A3,B3,C3,D3,E3,F3,G3],[A4,B4,C4,D4,E4,F4,G4],[A5,B5,C5,D5,E5,F5,G5],[A6,B6,C6,D6,E6,F6,G6]]):-
tab(3),afficheLigne([A1,B1,C1,D1,E1,F1,G1]),nl,
tab(3),afficheLigne([A2,B2,C2,D2,E2,F2,G2]),nl,
tab(3),afficheLigne([A3,B3,C3,D3,E3,F3,G3]),nl,
tab(3),afficheLigne([A4,B4,C4,D4,E4,F4,G4]),nl,
tab(3),afficheLigne([A5,B5,C5,D5,E5,F5,G5]),nl,
tab(3),afficheLigne([A6,B6,C6,D6,E6,F6,G6]).


/**********************************************************************************************/

afficheLigneR([]):-write("|").
afficheLigneR([T|Q]):-write("|"), tab(1), write(T), tab(1), afficheLigneR(Q).