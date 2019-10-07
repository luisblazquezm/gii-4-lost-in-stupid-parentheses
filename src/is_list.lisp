;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; is_list.lisp: function to detect if one component is a list or not

(defun is_list (var)
	(when (listp var)
		(unless 
			(and 
				(symbolp (first var)) 
				(string= (first var) '?)
			)
			T
		)
	)
)