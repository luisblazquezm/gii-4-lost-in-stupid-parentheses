;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;   1. > (load 'is_atom.lisp)
;;;	  2. > (is_atom 1)
;;;
;;; # License
;;;
;;; Code from Paradigms of Artificial Intelligence Programming
;;; Copyright (c) 2019 Luis Blázquez, Samuel Gómez

;;;; # File 
;;;; is_atom.lisp: function to detect if one component is an atom or not

(defun is_atom (var)
	(cond 
	      ((atom var) T)				 ; Check if is a constant/literal -> 'constant
		  ((eq (first var) '?) T)		 ; Check if it is a list
		  (T NIL)						 ; This is like the else of the if-else (although it is not neccesary to include it)
	)
)