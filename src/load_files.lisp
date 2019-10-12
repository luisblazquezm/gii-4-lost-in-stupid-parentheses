;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;   1. > (load 'is_atom.lisp)
;;;	  2. > (load_files)
;;;
;;; # License
;;;
;;; Code from Paradigms of Artificial Intelligence Programming
;;; Copyright (c) 2019 Luis Blázquez, Samuel Gómez

;;;; # File 
;;;; load_files_main.lisp: load main files for the unification algorithm

(load "is_atom.lisp")
(load "is_variable.lisp")
(load "get_item_index_in_list.lisp")
(load "apply_to.lisp")
;(load "composition.lisp")
;(load "unification.lisp")

; EXAMPLE 1 (UNCOMMENT IT)
; REAL PREDICATES = P(x) , P(f(h), y)
; RESULT = ( ((F H) (? X)) (A (? Y)) )

; (unificar '(P (? x) A) '(P (f h) (? y)) )


; EXAMPLE 2 (UNCOMMENT IT)
; REAL PREDICATES = PERSONA(x) , PERSONA(ADOLFO)
; RESULT = ( ADOLFO (? X) )

; (unificar '(PERSONA (? x)) '(PERSONA ADOLFO) )

