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

;(load "is_atom.lisp")
;(load "is_variable.lisp")
;(load "contains.lisp")
;(load "apply_to.lisp")
;(load "composition.lisp")

;(define-condition not-unificable (error)
;  ((dividend :initarg :dividend
;            :reader dividend)) ;; <= so we'll get the dividend with (dividend condition), as soon as on the next line.
  ;; the :report is the message into the debugger:
;  (:report (lambda (condition stream) (format stream "These clausules are not unificable"))))

;(error 'NOT-UNIFICABLE)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

(defun unificar2(E1 E2)
	(prog (str_local it_local)

		(setf str_local str) ; DEBUG
		(setf it_local it) ; DEBUG

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "E1 and E2 are equal: ")
		(write (equal E1 E2))
		(terpri)
		; DEBUG END

		(cond ((equal E1 E2) (return NIL)))

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "E1 is variable: ")
		(write (is_variable E1))
		(terpri)
		; DEBUG END

		(if (is_variable E1)
			(progn

				; DEBUG
				(write it_local)
				(princ str_local)
				(princ "E1: ")
				(write E1)
				(terpri)
				; DEBUG END

				; DEBUG
				(write it_local)
				(princ str_local)
				(princ "E2: ")
				(write E2)
				(terpri)
				(write it_local)
				(princ str_local)
				(princ "CONTAINS E1 in E2: ")
				(write (contains E2 E1))
				(terpri)


				; DEBUG END

				(cond 
					((contains E2 E1) (return 'FALLO_NO_UNIFICABLE)) ; iF E1 apppears in E2
				) ; Returns FALLO_NO_UNIFICABLE

				;(cond 
				;	((equal E1 E2) (string (intern "FALLO_NO_UNIFICABLE")))
				;) ; Returns FALLO_NO_UNIFICABLE

				; DEBUG
				(write it_local)
				(princ str_local)
				(princ "E2/E1: ")
				(write (list E2 E1))
				(terpri)
				; DEBUG END

				(return (list (list E2 E1))) ; IMPORTANT: returns list of list because in apply_to in the firt loop we get items as a list of tuples (meaning tuple by tuple with the  element to substitute and element of substitution)
			)
		)

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "E2 is variable: ")
		(write (is_variable E2))
		(terpri)
		(terpri)
		; DEBUG END

		(if (is_variable E2)
			(return (list (list E1 E2))) ; IMPORTANT: returns list of list because in apply_to in the firt loop we get items as a list of tuples (meaning tuple by tuple with the  element to substitute and element of substitution)
		)

		(return 'FALLO_NO_UNIFICABLE)

		;(string (intern "FALLO_NO_UNIFICABLE")) ; Returns FALLO_NO_UNIFICABLE
	)
)

(defun unificar3(E1 E2)
	(prog (F1 F2 Z1 Z1 G1 G2 T1 T2 str_local it_local)

		(setf str_local str) ; DEBUG
		(setf it_local it) ; DEBUG

		(setf F1 (first E1) )
		(setf T1 (rest E1) )

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "F1: ")
		(write F1)
		(terpri)

		(write it_local)
		(princ str_local)
		(princ "T1: ")
		(write T1)
		(terpri)
		; DEBUG END

		(setf F2 (first E2) )
		(setf T2 (rest E2) )

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "F2: ")
		(write F2)
		(terpri)

		(write it_local)
		(princ str_local)
		(princ "T2: ")
		(write T2)
		(terpri)

		(write it_local)
		(princ str_local)
		(princ "Going to unificate F1 F2")
		(terpri)
		; DEBUG END

		(setf Z1 (unificar F1 F2) )

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "Z1: ")
		(write Z1)
		(terpri)
		(terpri)
		; DEBUG END

		(cond 
			((equal Z1 'FALLO_NO_UNIFICABLE) (return 'FALLO_NO_UNIFICABLE))
		)

		;(cond 
		;	((string= Z1 "FALLO_NO_UNIFICABLE") (return (string (intern "FALLO_NO_UNIFICABLE"))))
		;)

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "Going to apply G1 --- ")
		(princ " Z1: ")
		(write Z1)
		(princ "   T1: ")
		(write T1)
		(terpri)
		; DEBUG END

		(setf G1 (apply_to Z1 T1) )

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "G1: ")
		(write G1)
		(terpri)

		(write it_local)
		(princ str_local)
		(princ "Going to apply G2 --- ")
		(princ " Z1: ")
		(write Z1)
		(princ "   T2: ")
		(write T2)
		(terpri)
		; DEBUG END

		(setf G2 (apply_to Z1 T2) )

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "G2: ")
		(write G2)
		(terpri)

		(write it_local)
		(princ str_local)
		(princ "Going to unificate G1 G2")
		(terpri)
		; DEBUG END

		(setf Z2 (unificar G1 G2) )

		; DEBUG
		(write it_local)
		(princ str_local)
		(princ "Z2: ")
		(write Z2)
		(terpri)
		(terpri)
		; DEBUG END

		(cond 
			((equal Z2 'FALLO_NO_UNIFICABLE) (return 'FALLO_NO_UNIFICABLE))
		)

		;(cond 
		;	((string= Z2 "FALLO_NO_UNIFICABLE") (return (string (intern "FALLO_NO_UNIFICABLE"))))
		;)

		(return (composite Z1 Z2))
		;(return 'COMPOSITION)
	)
)

(defun unificar(E1 E2)

	; DEBUG
	;(terpri)
	;(terpri)	
	;(princ "                    Iteracion ")
	;(write (incf it))
	;(princ "                      ")
	;(terpri)
	;(princ "==============================================")
	;(terpri)
	;(terpri)

	(incf it)

	(setf str (concatenate 'string "----" str))

	(terpri)
	(terpri)
	(terpri)
	(write it)
	(princ str)
	(princ " -------- E1: ")
	(write E1)
	(princ "   E2: ")
	(write E2)
	(princ " --------")
	(terpri)
	(terpri)
	(terpri)
	; DEBUG END

	(cond ((is_atom E1) (unificar2 E1 E2)) 
		  ((is_atom E2) (unificar2 E2 E1))
		  (T (unificar3 E1 E2))
	)
)

; (unificar '(P x A) '(P (f h) y))
