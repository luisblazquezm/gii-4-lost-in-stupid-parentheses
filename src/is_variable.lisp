;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
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
	(cond ((list var)				                                       ; Check If it is a list
			  (if (and (symbolp (first var)) (string= (first var) '?) )    ; Check if the first element is a symbol and is '?'
			      T                                                        ; If the conditions are accomplished returns T, otherwise returns NIL
			  )
		  ) 
	)                   
)