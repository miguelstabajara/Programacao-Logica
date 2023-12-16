%Termos dentro do arquivo: carro, esporte, lista, porta, dado, faca, prolog
achaTermo(Termo):-open('arq.pl', read, Arq),
set_input(Arq), processa(Termo), set_input(user), close(Arq).

processa(Termo):-read(A),((A=end_of_file, !);
((A=Termo, write(A)); processa(Termo))).