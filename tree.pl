%20309616
%I declare this is solely my work and I abide to DCU's plagiarism policy

%mktree(L, T) Make a tree function to test all functions.

mktree([], nil).
mktree([H], T) :- mkt([H], nil, T).
mktree([H|L], T) :- mkt([H|L], nil, T).
mkt([H], N, T) :- add(H, N, T).
mkt([H|L], N, T) :- add(H, N, T1), mkt(L, T1, T).



%add(X, T1, T2).

%if nothing in tree, make a new node with two children and added item as root.
%if twonode already has a root, make it a threenode, two nodes with three children

add(X, nil, twonode(nil, X, nil)).
add(X, twonode(nil, Y, nil), threenode(nil, X, nil, Y, nil)) :- X =< Y, !.
add(X, twonode(nil, Y, nil), threenode(nil, Y, nil, X, nil)).

add(X, threenode(L, Y, M, Z, R), threenode(L1, Y, M, Z, R)) :- X =< Y, add(X, L, L1), !.
add(X, threenode(L, Y, M, Z, R), threenode(L, Y, M1, Z, R)) :- X =< Z, add(X, M, M1), !.
add(X, threenode(L, Y, M, Z, R), threenode(L, Y, M, Z, R1)) :- add(X, R, R1).



%member(X, T).

member(X, twonode(nil, X, nil)).
member(X, threenode(_, X, _, _, _)).
member(X, threenode(_, _, _, X, _)).

member(X, threenode(L, Y, _, _, _)) :- X =< Y, member(X, L), !.
member(X, threenode(_, _, M, Z, _)) :- X =< Z, member(X, M), !.
member(X, threenode(_, _, _, _, R)) :- member(X, R), !.



%height(T, N).

max(A, B, C, A) :- A >= B, A >= C.
max(_, B, C, B) :- B >= C.
max(_, _, C, C).

height(nil, 0).
height(twonode(nil, _, nil), 1).
height(threenode(nil, _, nil, _, nil), 1).

height(threenode(L, _, M, _, R), N) :- height(L, N1), height(M, N2), height(R, N3), max(N1, N2, N3, H), N is 1 + H, !.



%pretttPrint(T), print the tree T aesthetically by first getting getting a list from inorder traversal of the tree by calling traverse function then going to printkey function to write out the position of each node by getting height of each node in correspondence to heigh of whole tree.
prettyPrint(T) :- traverse(T, L), printkey(T, L), !.

printkey(_, []) :- nl, !.
printkey(T, [H]) :- nodeheight(H, T, N), N1 is N - 1, tabs(N1), write(H), nl, !.
printkey(T, [H|L]) :- nodeheight(H, T, N), N1 is N - 1, tabs(N1), write(H), nl, printkey(T, L), !.

%nodeheight(X, T, N), height(T, N1), N2 is N1 - N, tabs(N2) write(X), nl.

%tabs(N). print tabs N times.

tabs(0).
tabs(1) :- write("\t"), !.
tabs(N) :- write("\t"), N1 is N - 1, tabs(N1).

%append(L1, L2, L).

append([], L, L).
append([X|L1], L2, [X|L3]) :- append(L1, L2, L3).

%traverse(T, L).

%traverse(nil, [nil]).
traverse(nil, []).
traverse(twonode(nil, X, nil), [X]).
traverse(threenode(nil, X, nil, Y, nil), [Y,X]).

traverse(threenode(nil, X, M, Y, R), List) :- traverse(M, List2), traverse(R, List3), append(List3, [Y|List2], List4), append(List4, [X], List).
traverse(threenode(L, X, nil, Y, R), List) :- traverse(L, List1), traverse(R, List3), append([Y|List3], [X|List1], List).
traverse(threenode(L, X, M, Y, nil), List) :- traverse(L, List1), traverse(M, List2), append([Y|List2], [X|List1], List).

traverse(threenode(nil, X, nil, Y, R), List) :- traverse(R, List3), append(List3, [X|Y], List).
traverse(threenode(L, X, nil, Y, nil), List) :- traverse(L, List1), append([X|Y], List1, List).
traverse(threenode(nil, X, M, Y, nil), List) :- traverse(M, List2), append([List2|Y], [X], List).

traverse(threenode(L, X, M, Y, R), List) :- traverse(L, List1), traverse(M, List2), traverse(R, List3), append(List3, [Y|List2], List4), append(List4, [X|List1], List).

%nodeheight(X, T, N). get height of X in T from root node as N.

nodeheight(X, twonode(nil, X, nil), 1) :- !.
nodeheight(X, threenode(_, X, _, _, _), 1) :- !.
nodeheight(X, threenode(_, _, _, X, _), 1) :- !.

nodeheight(X, threenode(L, Y, _, _, _), N) :- X < Y, nodeheight(X, L, N1), N is N1 + 1.
nodeheight(X, threenode(_, _, M, Z, _), N) :- X < Z, nodeheight(X, M, N1), N is N1 + 1.
nodeheight(X, threenode(_, _, _, _, R), N) :- nodeheight(X, R, N1), N is N1 + 1.

