;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; contains.lisp: function to detect if one item is contained in another

(load "is_variable.lisp")
(load "is_atom.lisp")

(defun type_of (x)
	(when (is_variable x) (return-from type_of "VAR"))
	(when (is_atom x) (return-from type_of "ATOM"))
	"LIST"
)