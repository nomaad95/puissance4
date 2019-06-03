max(X,Y,Y) :- Y>X, !.
max(X,Y,X). 

% Fonction qui permet d'ajouter un élément en fin de liste
ajoutFin(X,[],[X]).
ajoutFin(X,[Y|L1],[Y|L2]):- ajoutFin(X,L1,L2).

finListe([], _).
finListe(L, E):- last(L,E).

% Fonction qui renvoie une sous-liste à partir d'une liste L
/* Paramètres : S sous-liste, L liste */
prefix(P,L):-append(P,_,L).
sublist(S,L):-prefix(S,L).
sublist(S,[_|T]):-sublist(S,T).

% Fonction qui retourne la longueur d'une liste
/* Paramètres : L liste, N longueur de la liste */
longueur([],0).
longueur([_|L],N):- longueur(L,N1),
					N is N1+1.

% Fonction qui renvoie le nième élément d'une liste 
/* Paramètres : N index de l'élement qu'on veut récupérer, L liste, X élément retourné */
nthElem(N, L, []):- longueur(L, N1), N1 < N.
nthElem(N, L, X):- nth1(N, L, X).

% Condition de victoire horizontale : 4 jetons les uns après les autres sur une même ligne
/* Paramètres : N numéro de la ligne à partir duquel on traite, G grille, J joueur */
LigneFaite(N, G, J):- maplist(nthElem(N), G, L), 
					 sublist([J,J,J,J],L),!.
LigneFaite(N, G, J):- N > 0,
					 N1 is N-1,
					 finJeuHor(N1, G, J).

LigneFaite(G,J):- finJeuHor(6, G, J).

% Condition de victoire verticale : 4 jetons les uns après les autres sur une même colonne
/* Paramètres : G grille, J joueur */										
finJeuVert([L|_],J):- sublist([J,J,J,J], L),!.
finJeuVert([_|G],J):- finJeuVert(G,J).

% Condition de victoire diagonale: 4 jetons les uns après les autres sur une même diagonale
/* Paramètres : G grille, J joueur */	
uneFinDiag(G,D,J,0):- sublist([J,J,J,J],D).
uneFinDiag(G,D,J,N):- N > 0,
					  maplist(nthElem(N), G, L),
					  nthElem(N,L,E),
					  N1 is N-1,
					  uneFinDiag(G,[E|D],J,N1).

uneFinDiag(G,J):- uneFinDiag(G,[],J,6).

autreFinDiag(G,D,J,0):- sublist([J,J,J,J],D).
autreFinDiag(G,D,J,N):- N > 0,
					    maplist(nthElem(N), G, L),
						N2 is 7-N,
						nthElem(N2,L,E),
					    N1 is N-1,
					    autreFinDiag(G,[E|D],J,N1).

autreFinDiag(G,J):- autreFinDiag(G,[],J,6).


finJeuDiag(G,N,X,J):- autreFinDiag(X,J),!.
finJeuDiag(G,N,X,J):- uneFinDiag(X,J),!.
finJeuDiag(G,N,X,J):- N < 7,
					  maplist(nthElem(N), G, L),
					  N1 is N+1,
					  finJeuDiag(G,N1,[L|X],J).

finJeuDiag(G,J):- finJeuDiag(G,1,[],J).

% Définition et test des conditions de fin de jeu
/* Paramètres : G grille, J joueur */
finJeu(G, J):- finJeuVert(G,x), J=x.
finJeu(G, J):- finJeuVert(G,o), J=o.
finJeu(G, J):- finJeuHor(G,x), J=x.
finJeu(G, J):- finJeuHor(G,o), J=o.
finJeu(G, J):- finJeuDiag(G,x), J=x.
finJeu(G, J):- finJeuDiag(G,o), J=o.

/* Paramètres : G grille*/
jouerCoupX(G):-finJeu(G,J), gagnant(J),!.
jouerCoupO(G):-finJeu(G,J), gagnant(J),!.
jouerCoupX(G):- write('Joueur x, entrez un numéro de colonne : '),
				read(N), jouerCoupColonne(N,x,[X|Reste1],[X|Reste2]),
				afficherGrille(X),
				write('\n'),
				jouerCoupO(X).
jouerCoupO(G):- write('Joueur o, entrez un numéro de colonne : '),
				read(N), jouerCoupColonne(N,o,[X|Reste1],[X|Reste2]),
				afficherGrille(X),
				write('\n'),
				jouerCoupX(X).