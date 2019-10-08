;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP

;;;; # File 
;;;; contains.lisp: function to detect if one item is contained in another


;; Pseudocode
;; ==========
;;
;; CONTAINS(list element) {
;;     if list is not a list return FALSE
;;     else 
;;     {
;;         for sublist in list 
;;         {
;;             if sublist is equal to element return TRUE
;;             else if element is contained in sublist return TRUE 
;;         }
;;         return FALSE ;; If there are not any more items in list
;;     }
;; }

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