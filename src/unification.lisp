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

(define-condition my-division-by-zero (error)
  ((dividend :initarg :dividend
            :reader dividend)) ;; <= so we'll get the dividend with (dividend condition), as soon as on the next line.
  ;; the :report is the message into the debugger:
  (:report (lambda (condition stream) (format stream "You were going to divide ~a by zero.~&" (dividend condition)))))

(defun unificar2(E1 E2)
	(cond ((equal E1 E2) NIL))

	(princ "E1 is variable: ")
	(write E1)
	(terpri)

	(if (is_variable E1)
		(progn

			(princ "E1: ")
			(write E1)
			(terpri)

			(princ "E2: ")
			(write E2)
			(terpri)

			(cond ((equal E1 E2) (error 'MY-DIVISION-BY-ZERO :dividend 2)))

			(princ "E2/E1: ")
			(write (list E2 E1))
			(terpri)

			(return (list E2 E1))
		)
	)

	(if (is_variable E2)
		(return (list E1 E2))
	)
)

(defun unificar3(E1 E2)
	(princ "Alberto llego a unificar3")
)

(defun unificar(E1 E2)
	(cond ((is_atom E1) (unificar2 E1 E2)) 
		  ((is_atom E2) (unificar2 E2 E1))
		  (T (unificar3 E1 E2))
	)
)

; (unificar '(P x A) '(P (f h) y))
