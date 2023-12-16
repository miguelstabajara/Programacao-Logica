adiciona(X,L1,[X|L1]).
apaga(X,[X|L2],L2).
apaga(X,[Y|L2],[Y|Y1]):-apaga(X,L2,Y1).
membro(X,[X|_]).
membro(X,[_|Y]):-membro(X,Y).
concatena([],B,B).
concatena([X|A],B,[X|C]):-concatena(A,B,C).
comprimento(0,[]):- !.
comprimento(X,[_|L1]):-comprimento(X1,L1), X is X1+1.
max([X|[]], X).
max([X|Cauda], N):-max(Cauda, Aux), ((X>Aux -> N is X); N is Aux).
soma(0,[]).
soma(Z,[X|Y]):-soma(Q,Y),Z is X+Q.
media(X,L):-soma(Y,L),comprimento(W,L), X is Y/W.
tiraPrimeiro(X,[X|_]).
ordenada([_]):-!.
ordenada([X|Y]):-tiraPrimeiro(Aux,Y), X<Aux,ordenada(Y).