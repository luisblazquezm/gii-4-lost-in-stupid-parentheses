;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;
;;; # License
;;;
;;; Code from Paradigms of Artificial Intelligence Programming
;;; Copyright (c) 2019 Luis Blázquez, Samuel Gómez

;;;; # File 
;;;;unification.lisp: implementation of unification algorithm in LISP


(defun unificar2(E1 E2)
	(prog ()

		(cond ((equal E1 E2) (return NIL)))

		(if (is_variable E1)
			(progn

				(cond 
					((contains E1 E2) (return 'FALLO_NO_UNIFICABLE))
				) ; Returns FALLO

				(return (list (list E2 E1))) ; IMPORTANT: returns list of list because in apply_to in the firt loop we get items as a list of tuples (meaning tuple by tuple with the  element to substitute and element of substitution)
			)
		)

		(if (is_variable E2)
			(return (list (list E1 E2))) ; IMPORTANT: returns list of list because in apply_to in the firt loop we get items as a list of tuples (meaning tuple by tuple with the  element to substitute and element of substitution)
		)

		(return 'FALLO_NO_UNIFICABLE)

	)
)

(defun unificar3(E1 E2)
	(prog (F1 F2 Z1 Z1 G1 G2 T1 T2)

		(setf F1 (first E1) )
		(setf T1 (rest E1) )

		(setf F2 (first E2) )
		(setf T2 (rest E2) )

		(setf Z1 (unificar F1 F2) )

		(cond 
			((eq Z1 'FALLO_NO_UNIFICABLE) (return 'FALLO_NO_UNIFICABLE))
		)

		(setf G1 (apply_to Z1 T1) )

		(setf G2 (apply_to Z1 T2) )

		(setf Z2 (unificar G1 G2) )

		(cond 
			((eq Z2 'FALLO_NO_UNIFICABLE) (return 'FALLO_NO_UNIFICABLE))
		)

		(return (composite Z1 Z2))
	)
)

(defun unificar(E1 E2)

	(cond ((is_atom E1) (unificar2 E1 E2)) 
		  ((is_atom E2) (unificar2 E2 E1))
		  (T (unificar3 E1 E2))
	)
)

; (unificar '(P x A) '(P (f h) y))
