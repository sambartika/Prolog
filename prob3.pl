remdups(X,Y) :- X= [H|T], length(T,Z) ,(Z=1), append([H],T,Y).

remdups([H|T],Y) :- member(H,T), remdups(T,Y).

remdups(X,Y) :- X= [H|T], \+ member(H,T), remdups(T,Z), append([H],Z,Y).


