cell(1,1).
cell(1,2).
cell(1,3).
cell(1,4).
cell(2,1).
cell(2,2).
cell(2,3).
cell(2,4).
cell(3,1).
cell(3,2).
cell(3,3).
cell(3,4).
cell(4,1).
cell(4,2).
cell(4,3).
cell(4,4).

visited(4,1).
visited(4,2).
visited(4,3).
visited(4,4).
stench(4,2).
breeze(4,3).
breeze(4,4).

adjacent(X,Y,A,B) :- cell(X,Y), cell(A,B), (X=A), Z is (Y+1), (Z=B).
adjacent(X,Y,A,B) :- cell(X,Y), cell(A,B), (X=A), Z is (Y-1), (Z=B).
adjacent(X,Y,A,B) :- cell(X,Y), cell(A,B), (B=Y), Z is (X+1), (Z=A).
adjacent(X,Y,A,B) :- cell(X,Y), cell(A,B), (B=Y), Z is (X-1), (Z=A).

candidate(X,Y) :- visited(A,B), cell(X,Y),  \+visited(X,Y), adjacent(A,B,X,Y).

no_pit(A,B) :- cell(X,Y), adjacent(A,B,X,Y), visited(X,Y), \+breeze(X,Y).
no_pit(A,B) :- visited(A,B).

no_wumpus(A,B) :- visited(A,B).
no_wumpus(A,B) :- cell(X,Y), adjacent(A,B,X,Y), visited(X,Y), \+stench(X,Y).

move(X,Y) :- candidate(X,Y), no_wumpus(X,Y),no_pit(X,Y).

