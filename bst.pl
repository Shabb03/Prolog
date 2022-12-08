%insert(X, T, R) append an integer X into a binary tree T to give a binary tree R.

insert(X, nil, tree(X, nil, nil)).
insert(X, tree(Y, L, R), tree(Y, L1, R)) :- X =< Y, !, insert(X, L, L1).
insert(X, tree(Y, L, R), tree(Y, L, R1)) :- insert(X, R, R1).


%search(X, T) Returns true if X is contained in the binary tree T, otherwise false.

search(X, tree(X, _, _)) :- !.
search(X, tree(Y, L, _)) :- X < Y, !, search(X, L).
search(X, tree(_, _, R)) :- search(X, R).


%preorder(T, N) lists the nodes of the binary tree T using preorder traversal.
preorder(nil, []).
preorder(tree(X, L, R), N) :- preorder(L, L1), preorder(R, R1), append([X|L1], R1, N).


%inorder(T, N) lists the nodes of the binary tree T using inorder traversal.
inorder(nil, []).
inorder(tree(X, L, R), N) :- inorder(L, L1), inorder(R, R1), append(L1, [X|R1], N).


%postorder(T, N) lists the nodes of the binary tree T using postorder traversal.
postorder(nil, []).
postorder(tree(X, L, R), N) :- postorder(L, L1), postorder(R, R1), append(L1, R1, NL), append(NL, [X], N).