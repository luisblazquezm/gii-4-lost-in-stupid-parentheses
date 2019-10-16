;;; -*- Mode: Lisp; Syntax: Common-Lisp; -*-
;;;
;;; # Title: Unification
;;;
;;; Implementation of the Unification Algorithm using LISP
;;;
;;; # Usage
;;;   1. > (load 'apply.lisp)
;;;	  2. > (is_variable 1)
;;;
;;; # License
;;;
;;; Code from Paradigms of Artificial Intelligence Programming
;;; Copyright (c) 2019 Luis Blázquez, Samuel Gómez

;;;; # File 
;;;; composition.lisp: 


;;;; SCHEME
;;;; 
;;;; for item in composition_list:
;;;;	
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;
;;;;


(defun composite (Z1 Z2)
	; Initialize local variables substitute_item, item_to_substitute and result_list to nil
	(prog (composition_list) 

		(princ "=================== IN COMPOSITION ===================")
		(terpri)
		(princ "Z2: ")
		(write Z2)
		(terpri)
		(princ "Z1: ")
		(write Z1)
		(terpri)
		(princ "LENGTH Z2: ")
		(write (length Z2) )
		(terpri)
		(princ "LENGTH Z1: ")
		(write (length Z1) )
		(terpri)


		(cond ((< 1 (length Z1) )
			   (setf Z1 (make-list 1 :initial-element Z1))
			  )
		)

		(cond ((< 1 (length Z2) )
			   (setf Z2 (make-list 1 :initial-element Z2))
			  )
		)
		
		(terpri)
		(princ "Z2: ")
		(write Z2)
		(terpri)
		(princ "Z1: ")
		(write Z1)
		(terpri)

		(setf composition_list (apply_to Z2 Z1))

		(dolist (item composition_list)
			(setf substitute_item (first item))		    ; Get first element of itemS1 which is the substitute_item
			(setf item_to_substitute (nth 1 item))	    ; Get last element of itemS1 which is the item_to_substitute

			(dolist (itemZ2 Z2)
				(setf substitute_item_Z2 (first itemZ2))		    ; Get first element of itemS1 which is the substitute_item
				(setf item_to_substitute_Z2 (nth 1 itemZ2))	    ; Get last element of itemS1 which is the item_to_substitute

				(if (equal item_to_substitute item_to_substitute_Z2)
					(delete itemZ2 Z2)
				)
				
			)

		)

		(princ "Z2 after deleting: ")
		(write Z2)
		(terpri)
		(princ "BEFORE composition_list: ")
		(write composition_list)
		(terpri)

		(setq composition_list (append composition_list Z2))

		(princ "AFTER composition_list: ")
		(write composition_list)
		(terpri)

		(return composition_list)
	)
)