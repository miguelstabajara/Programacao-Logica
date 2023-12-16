quadrado:- repeat,
    write('Digite um numero para calcular o seu quadrado: '),
    read(X),
    ((X=='stop', !);
    (S is X*X,
    write('O resultado eh: '),
    write(S),nl)),
    fail.