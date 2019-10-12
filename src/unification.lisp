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

(load "is_atom.lisp")
(load "is_variable.lisp")
(load "contains.lisp")

;(define-condition not-unificable (error)
;  ((dividend :initarg :dividend
;            :reader dividend)) ;; <= so we'll get the dividend with (dividend condition), as soon as on the next line.
  ;; the :report is the message into the debugger:
;  (:report (lambda (condition stream) (format stream "These clausules are not unificable"))))

;(error 'NOT-UNIFICABLE)


(defun unificar2(E1 E2)
	(cond ((equal E1 E2) NIL))

	; DEBUG
	(princ "E1 is variable: ")
	(write (is_variable E1))
	(terpri)

	(if (is_variable E1)
		(progn

			; DEBUG
			(princ "E1: ")
			(write E1)
			(terpri)

			; DEBUG
			(princ "E2: ")
			(write E2)
			(terpri)

			(cond ((equal E1 E2) (return 'FALLO)))

			; DEBUG
			(princ "E2/E1: ")
			(write (list E2 E1))
			(terpri)

			(return (list E2 E1))
		)
	)

	; DEBUG
	(princ "E2 is variable: ")
	(write (is_variable E2))
	(terpri)

	(if (is_variable E2)
		(return (list E1 E2))
	)

	(return 'FALLO)
)

(defun unificar3(E1 E2)
	(prog (F1 F2 Z1 Z1 G1 G2 T1 T2)

		(setf F1 (first E1) )
		(setf T1 (rest E1) )

		; DEBUG
		(princ "F1: ")
		(write F1)
		(terpri)
		(princ "T1: ")
		(write T1)
		(terpri)

		(setf F2 (first E2) )
		(setf T2 (rest E2) )

		; DEBUG
		(princ "F2: ")
		(write F2)
		(terpri)
		(princ "T2: ")
		(write T2)
		(terpri)

		(setf Z1 (unificar(F1 F2)) )

		; DEBUG
		(princ "Z1: ")
		(write Z1)
		(terpri)

		(cond ((equal Z1 'FALLO) return 'FALLO))

		(setf G1 (apply_to Z1 T1) )
		(setf G2 (apply_to Z2 T2) )

		(setf Z2 (unificar(G1 G2)) )
		(cond ((equal Z2 'FALLO) return 'FALLO))

		;(return (composition Z1 Z2))
	)
)

(defun unificar(E1 E2)
	(cond ((is_atom E1) (unificar2 E1 E2)) 
		  ((is_atom E2) (unificar2 E2 E1))
		  (T (unificar3 E1 E2))
	)
)

; (unificar '(P x A) '(P (f h) y))
