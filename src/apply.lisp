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
;;;; apply_to.lisp: substitutes all the ocurrences of substitute_term for term_to_substitute on list_of_predicates
;;;;			 substitution_term can be anything
;;;;             term_to_substitute has to be a variable


;;;; EXAMPLE 1 (Substitution)
;;;; 
;;;; substitution_term = (f h) --> f(h) in normal notation
;;;; term_to_substitute = x
;;;; list_of_predicates = (A x B)
;;;; -------------------------
;;;; return (A (f h) b)

;;;; EXAMPLE 2 (No substitution)
;;;;
;;;; substitution_term = (f h) --> f(h) in normal notation
;;;; term_to_substitute = x
;;;; list_of_predicates = (A)
;;;; -------------------------
;;;; return (A)

;;;; EXAMPLE 3 (Variable is not substitution_term)
;;;;
;;;; substitution_term = x 
;;;; term_to_substitute = (f h)
;;;; list_of_predicates = (A)
;;;; -------------------------
;;;; return (A)


(defun apply_to (substitution_term var_to_substitute list_of_predicates)
	(cond 
		((null list_of_predicates) NIL)		                         ; Finish recursivity

		; Returns the original list if the var to substitute is not in list or if the substitution_term is the variable
		((or ((member var_to_substitute list_of_predicates) NIL)  ((is_variable var_to_substitute) NIL))
			list_of_predicates										 
		)			      
	)

	; If the previous conditions are not accomplished, returns the list substituting the members
	; Find the index of the term to substitute in the list and replace it with the substitution term
	(setf (nth (get_item_index_in_list var_to_substitute list_of_predicates)  
	            list_of_predicates) substitution_term) 	
)