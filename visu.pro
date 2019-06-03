afficherLigne([]).
afficherLigne([T|Q]):-
write(T), tab(4), afficherLigne(Q).

afficherGrille([]).
afficherGrille([T|Q]):-
afficherLigne(T), nl, afficherGrille(Q).

succNum(X,Y):-
Y is X+1.


succAlpha(a,b).
succALpha(b,c).
succAlpha(c,d).
succAlphaf(d,e).

ligneDeGrille(numLigne, Grille, Ligne).
igneDeGrille(1,[T|_], T).
ligneDeGrille(NumLigne, [_|Reste], Test):-
succNum(I, NumLigne), ligneDeGrille(I,Reste,Test).
