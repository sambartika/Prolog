puzzle_solve :-
        X = [S,E,N,D,M,O,R,Y],
        Digits = [0,1,2,3,4,5,6,7,8,9],
        assign_digits(X, Digits),
        M > 0,
        S > 0,
        A is 1000*S + 100*E + 10*N + D,
        B is 1000*M + 100*O + 10*R + E,
        C is 10000*M + 1000*O + 100*N + 10*E + Y,
        Z is B + A,
        (C = Z),
        format('SEND + MORE = MONEY, the corresponding numbers are ~d + ~d = ~d~n',[A,B,C]),
        format('S is ~d~nE is ~d~nN is ~d~nD is ~d~nM is ~d~nO is ~d~nR is ~d~nY is ~d~n',[S,E,N,D,M,O,R,Y]).

select_r(H, [H|T], T).
select_r(H, [T|Hs], [T|Ts]):- select_r(H, Hs, Ts).

assign_digits([], _List).
assign_digits([H|T], List):-
        select_r(H, List, NewList),
        assign_digits(T, NewList).

