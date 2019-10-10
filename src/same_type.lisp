;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; is_list.lisp: function to detect if one component is a list or not

(load "is_atom.lisp")
(load "is_list.lisp")
(load "is_variable.lisp")

(defun same_type (x y)
	(cond
		((and (is_variable x) (is_variable y)) "VAR") ;; This must go first because a var is also an atom
		((and (is_atom x) (is_atom y))  "ATOM")
		((and (is_list x) (is_list y)) "LIST")
		(T NIL)
	)
)