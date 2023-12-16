sexo(jose,masculino).
sexo(joao,masculino).
sexo(ana,feminino).
sexo(jessica,feminino).
sexo(lucas,masculino).
sexo(maria,feminino).
sexo(helena,feminino).
sexo(joana,feminino).
sexo(antonio,masculino).
sexo(juares,masculino).
sexo(mario,masculino).
sexo(carlos,masculino).
sexo(heloisa,feminino).
sexo(fagundes,masculino).
sexo(marcia,feminino).
sexo(julio,masculino).
sexo(rodrigo,masculino).
sexo(luciano,masculino).
pai(jose,joao).
pai(jose,ana).
pai(jose,jessica).
pai(jose,lucas).
pai(joao,mario).
pai(mario,carlos).
pai(lucas,fagundes).
pai(lucas,marcia).
pai(lucas,jalio).
pai(rodrigo,luciano).
mae(maria,joao).
mae(maria,ana).
mae(maria,jessica).
mae(maria,lucas).
mae(ana,helena).
mae(ana,joana).
mae(joana,antonio).
mae(joana,juares).
mae(helena,carlos).
mae(jessica,heloisa).
mae(marcia,luciano).

progenitor(X,Y) :- pai(X,Y);mae(X,Y).
irmao(X,Y):-
    ((pai(Z, X), pai(Z, Y), mae(W, X), mae(W, Y), X \= Y) ;
    (pai(Z, X), pai(Z, Y), X \= Y, \+mae(_, X), \+mae(_, Y)) ;
    (mae(W, X), mae(W, Y), X \= Y, \+pai(_, X), \+pai(_, Y))),sexo(X,masculino). 
irma(X,Y):-
    ((pai(Z, X), pai(Z, Y), mae(W, X), mae(W, Y), X \= Y) ;
    (pai(Z, X), pai(Z, Y), X \= Y, \+mae(_, X), \+mae(_, Y)) ;
    (mae(W, X), mae(W, Y), X \= Y, \+pai(_, X), \+pai(_, Y))),sexo(X,feminino). 


descendente(X,Y):-progenitor(X,Y).
descendente(X,Y):-progenitor(X,W),descendente(W,Y).

avo_h(X,Y):-(pai(W,Y);mae(W,Y)),pai(X,W).
avo_f(X,Y):-(pai(W,Y);mae(W,Y)),mae(X,W).

avo(X, Y):-progenitor(W, Y), progenitor(X, W).

tio(X,Y):-irmao(X,W),(pai(W,Y);mae(W,Y)).
primo(X,Y):-progenitor(W,X),progenitor(Q,Y),(irmao(W,Q);irma(W, Q)).

ascendente(Y,X):-progenitor(X,Y).
ascendente(Y,X):-progenitor(X,W),descendente(W,Y).

temIrmaos(X):-(irmao(X,Y);irma(X,Y)),sexo(Y,masculino).
temIrmas(X):-(irmao(X,Y);irma(X,Y)),sexo(Y,feminino).

temNetos(X):-avo(X, _).

elem_unico([_|[]]).
unico(Sobrinho):-findall(Tio, tio(Tio, Sobrinho), L), elem_unico(L).

%consultas
%progenitor(jose, joao).
%progenitor(maria, X).
%primos(X, mario).
%unico(X).
%ascendente(X, carlos).
%temIrmaos(helena).
%temIrmas(helena).
%avo(X, luciano).
%temNetos(X).
