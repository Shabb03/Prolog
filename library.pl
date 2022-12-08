book(illiad,homer,study,500).
book(c,richie,study, 150).
book(ntbible,sams,reference,480).
book(ntfordummies,bob, reference,200).
book(montypython,cleese,comedy,300).
book(pythonalgorithms,david,study, 225).
book(lilacbus,binchey,fiction,200).
book(hamlet,shakespere,drama,450).


build_library(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author, Genre, Size), Lib).


holiday_book(book(_,_,G,S)) :- S < 400, G \== drama, G \== reference.

holiday(_,[]).

holiday(B, [B|_]) :- holiday_book(B).

holiday(B,[_|T]) :- holiday(B,T).


literary_book(book(_,_,Genre,_)) :- Genre == drama.

literary(_,[]).

literary(B,[B|Lib]) :- literary_book(B), literary(B,Lib).

literary(B,[_|XS]) :- literary(B,XS).


revision_book(book(_,_,Genre,Size)) :- Genre == study, Size > 300.

revision_book(book(_,_,Genre,Size)) :- Genre == reference, Size > 300.

revision(_,[]).

revision(B,[B|Lib]) :- revision_book(B), revision(B,Lib).

revision(B,[_|XS]) :- revision(B,XS).


leisure_book(book(_,_,comedy,_)).

leisure_book(book(_,_,fiction,_)).

leisure(_,[]).

leisure(B,[B|Lib]) :- leisure_book(B), leisure(B,Lib).

leisure(B,[_|XS]) :- leisure(B,XS).

