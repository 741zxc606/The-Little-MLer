(*
** chapter 2 of The Little MLer:
** Matchmaker, Matchmaker
*)

(* shish_kebab is another data type
 *)
datatype shish_kebab =
	 Skewer
	 | Onion of shish_kebab
	 | Lamb of shish_kebab
	 | Tomato of shish_kebab;

(* Skewer is an element of shish_kebab
 *)
Skewer;

(* Onion(Skewer) is also an element of shsish_kebab
 *)
Onion(Skewer);

(* Onion(Lamb(Onion(Skewer))) is also an element of shish_kebab
 *)
Onion(
    Lamb(
	Onion(
	    Skewer)));

(* Function only_onions determines if the shish_kebab contains only Onions
 *)
fun only_onions(Skewer)
       = true
| only_onions(Onion(x))
      = only_onions(x) 
| only_onions(Lamb(x))
      = false 
| only_onions(Tomato(x))
      = false;

(* Function only_onions has the type only_onions: shish_kebab -> bool
 *)
only_onions;

(* Examples of only_onions
 *)
only_onions(Onion(Onion(Skewer)));    (* true *)
only_onions(Onion(Lamb(Skewer)));     (* false *)

(* Function is_vegetarian returns true if what it consumes doesn't contian Lamb
 *)
fun is_vegetarian(Skewer)
    = true 
  | is_vegetarian(Onion(x))
    = is_vegetarian(x) 
  | is_vegetarian(Lamb(x))
    =  false 
  | is_vegetarian(Tomato(x))
    = is_vegetarian(x);

(* Function is_vegetarian has the type is_vegetarian: shish_kebab -> bool
 *)
is_vegetarian;

(* Examples of is_vegetarian
 *)
is_vegetarian(Skewer);    (* true *)
is_vegetarian(Onion(Tomato(Skewer)));    (* true *)
is_vegetarian(Onion(Lamb(Skewer)));    (* false *)

(* shish datatype
 *)
datatype 'a shish =
	 Bottom of 'a
       |         Onion of 'a shish
       |         Lamb of 'a shish
       |         Tomato of 'a shish;

(* rod datatype 
 *)
datatype rod =
	 Dagger
       |          Fork
       |          Sword;
				
(* plate datatype 
 *)
datatype plate =
	 Gold_plate
       |         Silver_plate
       |         Brass_plate;

(* Onion(Tomato(Bottom(Dagger))) is of type rod shish
 *)
Onion(Tomato(Bottom(Dagger)));

(* Onion(Tomato(Bottom(Gold_plate))) is plate shish 
 *)
Onion(Tomato(Bottom(Gold_plate)));

(* Function is_veggie: 'a shish -> bool checks whether a shish is vegetarian
 *)
fun is_veggie(Bottom(x))
    = true 
  | is_veggie(Onion(x))
    = is_veggie(x) 
  | is_veggie(Lamb(x))
    = false 
  | is_veggie(Tomato(x))
    = is_veggie(x);

(* Verify the type of is_veggie. Should be is_veggie: 'a shish -> bool
 *)
is_veggie;

(* Examples of is_veggie 
 *)
is_veggie(Onion(Tomato(Bottom(Dagger))));
is_veggie(Onion(Tomato(Bottom(Gold_plate))));

(* Function what_bottom determines the bottom of 'a shish
 *)
fun what_bottom(Bottom(x))
    = x
  | what_bottom (Onion(x))
    = what_bottom(x) 
  | what_bottom(Lamb(x))
    = what_bottom(x) 
  | what_bottom(Tomato(x))
    = what_bottom(x);

(* what_bottom's type is 'a shish -> 'a
 *)
what_bottom;

(* Examples of what_bottom
 *)
what_bottom(Onion(Tomato(Bottom(Dagger))));    (* Dagger *)
what_bottom(Onion(Tomato(Bottom(Gold_plate))));    (* Gold_plate *)
what_bottom(Onion(Tomato(Bottom(52))));    (* *)
what_bottom(Bottom(Sword));    (* *)

(**********************************************************************
*                                                                                                                                                       *
* The second moral:                                                                                                                    *
*                                                                                                                                                       *
* The number and order of the patterns in the defination of a function should           *
* match that of the defination of the consumed datatype.                                                *
*                                                                                                                                                      *
*********************************************************************)




