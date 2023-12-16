d(0,zero).
d(1,um).
d(2,dois).
d(3,tres).
d(4,quatro).
d(5,cinco).
d(6,seis).
d(7,sete).
d(8,oito).
d(9,nove).

adiciona(X,L1,[X|L1]).
txt([],[]).
txt([X|Y],P):-d(X,Q),adiciona(Q,P1,P),txt(Y,P1).