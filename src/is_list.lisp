;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; is_list.lisp: function to detect if one component is a list or not

(load "is_variable.lisp")

(defun is_list (var)
	(and 
		(listp var)
		(not (is_variable var))
	)
)