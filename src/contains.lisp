;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; contains.lisp: function to detect if one item is contained in another

(load "is_list.lisp")

(defun contains (l i)
	(if (is_list l)
		(dolist (e l NIL)
			(if (eq e i)
				(return T)
				(if (contains e i)
					(return T)
					NIL
				)
			)
		)
		NIL
	)
)