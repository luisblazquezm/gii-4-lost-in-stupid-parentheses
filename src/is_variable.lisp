;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;   1. > (load 'is_variable.lisp)
;;;	  2. > (is_variable 1)
;;;
;;; # License
;;;
;;; Code from Paradigms of Artificial Intelligence Programming
;;; Copyright (c) 2019 Luis Blázquez, Samuel Gómez

;;;; # File 
;;;; is_variable.lisp:  function to detect if one component is a variable or not

;;;
;;;   SCHEME
;;;  
;;; if (var == list){
;;;   if (first_element(var) == type SYMBOL) && (first_element(VAR) == '?') 
;;;      return T
;;;   } else {
;;;		 return NIL 
;;;   }
;;; }
;;;
;;;

(defun is_variable (var)
	(cond 
		((atom var) NIL) ; Check if var is an atom. Then returns NIL
		((eq '? (first var)) T)
	)                   
)