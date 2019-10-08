;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;   1. > (load 'apply.lisp)
;;;	  2. > (is_variable 1)
;;;
;;; # License
;;;
;;; Code from Paradigms of Artificial Intelligence Programming
;;; Copyright (c) 2019 Luis Blázquez, Samuel Gómez

;;;; # File 
;;;; apply_to.lisp: substitutes all the ocurrences of substitute_term for var_to_substitute on list_of_predicates
;;;;			 S1 can be anything
;;;;             P1 has to be a variable


;;;; EXAMPLE 1 (Substitution)
;;;; S1 = ( (A (? x)) (y (? z)) ((f h) (? k)) )
;;;;
;;;; P1 =            ( (? x) (g (f (? k))) (f2 (? z)) )
;;;; result (P1S1) = (   A     (g (f h))     (f2 y)   )

;;;; Iteration 1
;;;; substitute_item = A
;;;; item_to_substitute = (? x)


;;;; NOTE: nth gets element number n from a list: 
;;;;       (nth 2 '(a b c d))                      ; => c

(defun apply_to (S1 P1)
	; Initialize local variables substitute_item, item_to_substitute and result_list to nil
	(prog (itemS1, itemP1, substitute_item, item_to_substitute, result_list) 
		(cond 
			; Finish recursivity
			((null S1) NIL)		  
			((null P1) NIL)	
		)

		(dolist (i S1 result_list)
			(setf (nth i S1) itemS1)					; Get element i of S1 and store it in itemS1

			(dolist (j P1 result_list)
				; Get element j of P1 and store it in itemP1
				(setf (nth j P1) itemP1)		


				(cond ((is_variable itemS1)
						(setf (first itemS1) substitute_item)		; Get first element of itemS1 which is the substitute_item
						(setf (last itemS1) item_to_substitute)	    ; Get last element of itemS1 which is the item_to_substitute
					  ) 
					  ((is_variable itemP1)
					  	(setf (first itemP1) substitute_item)		; Get first element of itemS1 which is the substitute_item
						(setf (last itemP1) item_to_substitute)	    ; Get last element of itemS1 which is the item_to_substitute
					  )
				)		

				; If the element got in S1 and the element got in P1 are the same
				((eq (extract_variable itemP1) item_to_substitute)
					; Create a new list with the element substituted and the rest of the list we pass it to the recursivity
					(cons substitute_item (apply_to S1 P1)) ; => (substitute_item ...)
				)
			)

		)

		; If the previous conditions are not accomplished, returns the list substituting the members
		; Find the index of the term to substitute in the list and replace it with the substitution term
		(setf (nth (get_item_index_in_list var_to_substitute list_of_predicates)  
		            list_of_predicates) substitution_term) 
	)
		
)