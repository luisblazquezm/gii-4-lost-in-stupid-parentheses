;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; contains.lisp: function to detect if one item is contained in another


(load "same_type.lisp")
(load "is_variable.lisp")
(load "eq_var.lisp")

(defun is_equal (x y)
	(when (or (is_variable x) (is_variable y)) (return-from is_equal (eq_var x y)))
	(equal x y)
)