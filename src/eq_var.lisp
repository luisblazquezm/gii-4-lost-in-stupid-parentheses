;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; contains.lisp: function to detect if one item is contained in another

(load "value_of.lisp")
(load "type_of.lisp")

(defun eq_var (x y)
	(when (and (eq (type_of x) "VAR") (eq (type_of y) "VAR"))
		(equal (value_of x) (value_of y))
	)
	(when (eq (type_of x) "VAR")
		(equal (value_of x) y)
	)
	(when (eq (type_of y) "VAR")
		(equal x (cadr_of y))
	)
	(equal x y)
)