bits(0).
bits(1).

bitvec(X,Y) :- (X=1), bits(Z),append([],[Z],Y).
bitvec(X,Y) :- (X > 1), bits(Z), A is (X-1), bitvec(A,B), append([Z],B,Y).

addup([], 0).

addup([H | T], A) :- addup(T, AR),A is AR + H.

code(X,Z,Y) :- bitvec(X,Y),addup(Y,A),Z=A. 
