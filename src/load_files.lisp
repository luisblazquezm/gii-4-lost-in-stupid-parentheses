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

(load "is_variable.lisp")
(load "is_atom.lisp")

(defun load_files (var)
	(is_atom(var))
)