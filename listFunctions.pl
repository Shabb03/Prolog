myElem(X,[X|_]).

myElem(X,[_|T]) :- myElem(X,T).


myHead(X,[X|_]).


myLast(X,[X]).

myLast(X,[_|T]) :- myLast(X,T).


myTail(X,[_|X]).


myConc([], L, L).

myConc([X|L1, L2, [X|L3) :- myConc(L1, L2, L3).


myAppend([],L,L).

myAppend([H|T],L,[H|L3]) :- myAppend(T,L,L3).


myReverse([],[]).

myReverse([X|T],Y) :- myReverse(T,T1), myAppend(T1,[X],Y).


myDelete(X,[X|T],T).

myDelete(X,[Y|T],[Y|L2]) :- myDelete(X,T,L2).

mySublist(S, L) :- myConc(L1, L2, L), myConc(S, L3, L2).
