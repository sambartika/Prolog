prime(X,Y) :- X=Y.
prime(X,Y) :- \+(X=Y), (Y=1).
prime(X,Y) :- \+(X=Y), \+(Y=1),Z is mod(X,Y), \+(Z=0),W is (Y+1),prime(X,W).

prime_factor(_,1,[]).
prime_factor(X,Y,M) :- \+(Y=1), prime(Y, 2), Z is mod(X,Y), (Z=0),A is (X//Y), B is floor(A),prime_factor(B,Y,C),append([Y],C, M).
prime_factor(X,Y,M) :- \+(Y=1), prime(Y, 2), Z is mod(X,Y), \+(Z=0),W is (Y-1),prime_factor(X,W,M).
prime_factor(X,Y,M) :- \+(Y=1), \+prime(Y, 2), W is (Y-1), prime_factor(X,W,M).
%prime_factor(X,Y,M) :- (Y=1).

factor(X,M) :- prime_factor(X,X,M).






