tam([], 0).
tam([_|C], N):-tam(C, Aux), N is Aux+1.

imprime_Lista(_, 0).
imprime_Lista([], _).
imprime_Lista([X|C], Max):-put(X), Aux is Max-1, imprime_Lista(C, Aux).

imprime_zero(N):-N<0.
imprime_zero(0).
imprime_zero(N):-Aux is N-1, write('0'), imprime_zero(Aux).

imprime_esp(N):-N<0.
imprime_esp(0).
imprime_esp(N):-Aux is N-1, write(' '), imprime_esp(Aux).

lerEscrever(Num):- 
    (read(cliente(Cliente, Endereco, Telefone)), nl,
    name(Num, L1), tam(L1, T1), Aux1 is 3-T1, imprime_zero(Aux1), imprime_Lista(L1, 3), write(' '), name(Cliente, L2), imprime_Lista(L2, 15), tam(L2, T2), Aux2 is 15-T2, imprime_esp(Aux2), write(' '), name(Endereco, L3), imprime_Lista(L3, 30), tam(L3, T3), Aux3 is 30-T3, imprime_esp(Aux3), write(' '), 
    write(Telefone), Aux is Num+1, lerEscrever(Aux));!.
    
relatorio:-
    open('clientes.txt', read, Ler),
    open('relatorio.txt', write, Escrever),
    set_input(Ler),
    set_output(Escrever),
    write("NRO"), tab(1), write("CLIENTE"), tab(9), write("ENDERECO"), tab(23), write("TELEFONE"),
    lerEscrever(1),
    close(Ler), close(Escrever),
    set_input(user),
    set_output(user).
