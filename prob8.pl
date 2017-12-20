row(1).
row(2).
row(3).
col(1).
col(2).
col(3).

p(x,1,1).
p(x,3,1).
p(o,1,1).
p(o,3,3).

player(x).
player(o).

blank(X,Y) :- \+p(x, X,Y), \+p(o,X,Y).

two_in_a_row(P,X,W) :- p(P,X,Y), p(P,X,Z),blank(X,W), player(P),row(X), col(Y), col(Z), col(W), \+(Y=Z), \+(Z=W), \+(Y=W).

two_in_a_col(P,W,Y) :- p(P,X,Y), p(P,Z,Y),blank(W,Y), player(P), row(X), col(Y), row(Z), row(W), \+(X=Z), \+(Z=W), \+(X=W).

two_in_a_s_diagonal(P,X,A) :- p(P,Y,Y), p(P, Z,Z), blank(X,A),(X=A), player(P),row(X), row(Y), row(Z),col(A), \+(Y=Z), \+(Z=X), \+(Y=X).

two_in_a_r_diagonal(P,X,E) :- p(P,Y,A), K is Y+A, (K=4),p(P, Z,B), L is Z+B, (L=4), C is 4-E,(X=C), blank(X,E), player(P),row(X), row(Y), row(Z),col(E), col(A), col(B), \+(Y=Z), \+(Z=X), \+(Y=X).

win(P,X,Y) :- two_in_a_row(P,X,Y), player(P).
win(P,X,Y) :- two_in_a_col(P,X,Y), player(P).
win(P,X,Y) :- two_in_a_s_diagonal(P,X,Y), player(P).
win(P,X,Y) :- two_in_a_r_diagonal(P,X,Y), player(P).

win_all(P) :- player(P), row(X), row(Y), win(P,X,Y), blank(X,Y).

lose(P,X,Y) :- player(Z), player(P), \+(P=Z), \+win_all(P), win(Z,X,Y).

ttt_move(P,X, Y) :- row(X),col(Y),player(P), win(P,X,Y), blank(X,Y), format('go for win!~n', []),  format('R = ~d, C = ~d~n', [X,Y]).

ttt_move(P,X, Y) :- row(X),col(Y), player(P), lose(P,X,Y), blank(X,Y), format('move to block opponent!~n',[]), format('R = ~d, C = ~d~n', [X,Y]).


