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
	(prog (itemS1 itemP1 substitute_item item_to_substitute var_item result_list) 
		(cond 
			; Finish recursivity
			((or (null S1) (null P1)) NIL)		  
		)

		(princ "S1: ")
		(write S1)
		(terpri)
		(princ "P1: ")
		(write P1)
		(terpri)
		(terpri)

		(dolist (itemS1 S1)

			(princ "ItemS1: ")
			(write itemS1)
			(terpri)

			;(setf (nth i S1) itemS1)					; Get element i of S1 and store it in itemS1
			(setf substitute_item (first itemS1))		; Get first element of itemS1 which is the substitute_item

			(princ "substitute_item: ")
			(write substitute_item)
			(terpri)

			(setf item_to_substitute (nth 1 itemS1))	    ; Get last element of itemS1 which is the item_to_substitute

			(princ "item_to_substitute: ")
			(write item_to_substitute)
			(terpri)
			

			(dolist (itemP1 P1)

				(princ "ItemP1: ")
				(write itemP1)
				(terpri)

				; Get element j of P1 and store it in itemP1
				; (setf (nth j P1) itemP1)	

				(if (and (listp itemP1) (not(is_variable itemP1)) )                          ; if-part
					(setf (nth (position itemP1) P1) (apply_to substitute_item P1))          ; then-part
       			)   
	
				; If the element got in S1 and the element got in P1 are the same
				; Create a new list with the element substituted and the rest of the list we pass it to the recursivity
				; (cons substitute_item (apply_to substitute_item P1)) ; => (substitute_item ...)


				(princ "ItemP1 position in P1: ")
				(write (position itemP1 P1))
				(terpri)

				(if (equal itemP1 item_to_substitute)
					(setf (nth (position itemP1 P1) P1) substitute_item)          
				)

				(terpri)
				(terpri)
			)

			(terpri)
			(terpri)
		)

		(return P1) 
	)
)