estrada(a->b,a,b,91).
estrada(a->d,a,d,100).
estrada(a->g,a,g,187).
estrada(b->d,b,d,50).
estrada(b->e,b,e,89).
estrada(b->c,b,c,211).
estrada(b->a,b,a,150).
estrada(c->j,c,j,300).
estrada(d->h,d,h,254).
estrada(d->l,d,l,99).
estrada(f->i,f,i,621).
estrada(g->a,g,a,300).
estrada(h->m,h,m,148).
estrada(i->j,i,j,41).
estrada(j->l,j,l,364).
estrada(k->l,k,l,10).
estrada(k->r,k,r,577).
estrada(k->p,k,p,311).
estrada(l->o,l,o,193).
estrada(l->n,l,n,0).
estrada(n->p,n,p,150).
estrada(p->n,p,n,69).
estrada(p->m,p,m,163).

nao_contem(_, []).
nao_contem(X, [Y|C]):-Y\=X, nao_contem(X, C).
inserir(A, P, [A|P]).
rota_aux(A,B,[R],C, _):-estrada(R,A,B,C).
rota_aux(A,B,R,C,P):-estrada(R1,A,W,Z), nao_contem(W, P), inserir(W, P, P1),rota_aux(W,B,R2,Z1,P1),inserir(R1,R2,R),C is Z+Z1.

rota(A, B, R, C):-rota_aux(A, B, R, C, [A]).

rotaC(R,A,C):-rota(_,A,R,C).
rotaS(R,A,C):-rota(A,_,R,C).
rotaM(B,R,C):-rota(_,B,R,C1),C1<C.