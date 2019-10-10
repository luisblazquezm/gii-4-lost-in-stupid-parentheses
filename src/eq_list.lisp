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
;; EQ_LIST (list_x list_y) {
;;
;;	   if length(list_x) != length(list_y) return FALSE
;;
;;     for i in 0..length(list_x){
;;         my_type = type(list_x[i])
;;         if my_type != type(list_y[i]) return FALSE
;;         else if my_type is equal to "VARIABLE" {
;;             if NOT equals_variable(list_x[i], list_y[i]) return FALSE
;;         }
;;         else if NOT equals(list_x[i], list_y[i]) return FALSE
;;     }
;; }

(load "is_variable.lisp")
(load "eq_var.lisp")
(load "same_type.lisp")

(defun eq_list (x y)
	(unless (equal (length x) (length y)) (return-from eq_list NIL))
	(do* 
		(
			(cdr_x x (cdr cdr_x))
			(car_x (car cdr_x) (car cdr_x))
			(cdr_y y (cdr cdr_y))
			(car_y (car cdr_y) (car cdr_y))
		)
		
		((endp cdr_x) NIL)  ;; Break loop if ran out of items
		
		(set 'TYPE (same_type car_x car_y)) ;; Check if same type...
		(when (null TYPE) (return-from eq_list NIL)) ;; ... if not, NIL...
		(when (equal TYPE "VAR")                     ;; ... else, they must be same type. Compare with eq_var if variable, else with equals
			(unless (eq_var car_x car_y) (return-from eq_list NIL))
		)
		(when (equal TYPE "LIST")
			(unless (eq_list car_x car_y) (return-from eq_list NIL))
		)
		(unless (equal car_x car_y) (return-from eq_list NIL))
	)
	(return-from eq_list T)
)