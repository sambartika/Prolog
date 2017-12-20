%round_4_places(X,Z) :- A is X*100000, B is round(A), Z is B.

compute(X,Z) :- A is sin(X), B is cos(X), C is A/B, Z is X - C.

get_sin(X,Z) :- A is sin(X), B is 0.0- A, Z is abs(B). 

sin_zero(X,Y):- get_sin(X,Z), Z < 0.0001, Y is X.

sin_zero(X,Y) :- get_sin(X,A), \+(A < 0.0001),compute(X,Z), sin_zero(Z,Y).
