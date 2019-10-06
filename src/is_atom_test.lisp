
(defun is_atom_test (var)
	(cond ((atom var) T)				 
		  ((eq (first var) '?) T)
		  (T NIL)						 
	)

)