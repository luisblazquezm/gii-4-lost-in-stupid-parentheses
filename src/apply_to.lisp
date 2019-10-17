;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;   1. > (load 'apply_to.lisp)
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

;;;; TEST ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> (apply_to '( (A (? x)) (y (? z)) ((f h) (? k)) ) '( (? x) (g (? k)) (f2 (? z)) ) )

(defun apply_to (S1 P1)
	; Initialize local variables substitute_item, item_to_substitute and result_list to nil
	(prog (itemS1 itemP1 substitute_item item_to_substitute var_item result_list) 

		(cond 
			((null S1) (return P1)) 	; Finish recursivity
			((null P1) (return NIL))
		)

		(dolist (itemS1 S1)

			(setf substitute_item (first itemS1))		    ; Get first element of itemS1 which is the substitute_item
			(setf item_to_substitute (nth 1 itemS1))	    ; Get last element of itemS1 which is the item_to_substitute

			(dolist (itemP1 P1)

				; If itemP1 is not a variable and is a list, is a list inside a list. So we apply recursivity
				(if (and (listp itemP1) (not(is_variable itemP1)) )                                 ; if-part
					(setf (nth (position itemP1 P1) P1) (apply_to (list itemS1) itemP1))            ; then-part
       			)   

				; If the items found are equal , we apply the rule 
				(if (equal itemP1 item_to_substitute)
					(setf (nth (position itemP1 P1) P1) substitute_item)          
				)
			)
		)

		(return P1) 
	)
)