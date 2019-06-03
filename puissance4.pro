afficherLigne([]).
afficherLigne([T|Q]):-
write(T), tab(4), afficherLigne(Q).

afficherGrille([]).
afficherGrille([T|Q]):-
afficherLigne([T]), nl, afficherLigne(Q).

jouerCoupColonne(a,Val,[],[Reste|Val])
jouerCoupColonne(NomCol,Val,[X|Reste1],[X|Reste2])