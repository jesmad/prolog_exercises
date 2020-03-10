%my_append
my_append([], L2, L2).
my_append([H|T], L2, [H|R]) :-
	my_append(T, L2, R).

%my_reverse
helprev([], L, L).
helprev([Head|Tail], TL, R) :-
	helprev(Tail, [Head|TL], R).

my_reverse(L, R) :-
	helprev(L, [], R).

%my_length
my_length([], 0).
my_length([_|Tail], Length) :-
	my_length(Tail, L),
	Length is L + 1.
	
%my_subset
my_subset(_,[], []).
my_subset(Relation, [Head|Tail], [Head|Rest]) :-
	Term =.. [Relation, Head],
	Term,
	my_subset(Relation, Tail, Rest).

my_subset(Relation, [_|Tail], R) :-
	my_subset(Relation, Tail, R).

%my_subset(A,B,C) :-
%	A(B[0]) == true,
%	(recursive call to my_subset

%my_member
my_member(Element, [Element|_]).
my_member(Element, [_|T]) :-
	my_member(Element, T).

%my_intersect
my_intersect([], _, []).
my_intersect([Head|Tail], L2, [Head|Rest]) :-
	my_member(Head, L2),
	my_intersect(Tail, L2, Rest).

my_intersect([_|Tail], L2, R) :-
	my_intersect(Tail, L2, R).

%compute_change
compute-change(Money, Quarter, Dime, Nickel, Penny) :-
	Change is Money,
	Quarter is floor(Change / 25),
	Change1 is Money - (25 * Quarter),
	Dime is floor(Change1 / 10),
	Change2 is Money - (25 * Quarter + 10 * Dime),
	Nickel is floor(Change2 / 5),
	Change3 is Money - (25 * Quarter + 10 * Dime + 5 * Nickel),
	Penny is floor(Change3 / 1).

%compose
compose([],[],[]).
compose([], L2, L2).
compose(L1, [], L1).
compose([Head1|Tail1], [Head2|Tail2], [Head1,Head2|Rest]) :-
	compose(Tail1, Tail2, Rest).

%compose(L1,[Head2|Tail2],[Head2|Rest]) :-
%	compose(L1, Tail2, Rest).


%palindrome
palindrome([],[]).
palindrome(Base, Result) :-
	my_reverse(Base, Reversed),
	my_append(Base, Reversed, Result).




