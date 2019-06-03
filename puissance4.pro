afficherLigne([]).
afficherLigne([T|Q]):-
write(T), tab(4), afficherLigne(Q).

afficherGrille([]).
afficherGrille([T|Q]):-
afficherLigne([T]), nl, afficherLigne(Q).
