
(defun probar(arg1 arg2 expected_result given_result)

		(if (equal expected_result given_result)
			(format t "Arg1:~s~%Arg2:~s~%Returns: ~s~%Expected:~s~%~%Test SUPERADO~%" 
				arg1 arg2 given_result expected_result
			)
			(format t "Arg1:~s~%Arg2:~s~%Returns: ~s~%Expected:~s~%Test NO superado~%"  
				arg1 arg2 given_result expected_result
			)
		)
	
)


; EXAMPLE 1 (UNCOMMENT IT)
; REAL PREDICATES = P(x) , P(f(h), y)
; RESULT = ( ((F H) (? X)) (A (? Y)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 1 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(probar '(P (? x) A) '(P (f h) (? y)) '( ((F H) (? X)) (A (? Y)) ) (unificar '(P (? x) A) '(P (f h) (? y)) ) )
;(unificar '(P (? x) A) '(P (f h) (? y)) )


; EXAMPLE 2 (UNCOMMENT IT)
; REAL PREDICATES = PERSONA(x) , PERSONA(ADOLFO)
; RESULT = ( (ADOLFO (? X)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 2 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(PERSONA (? x)) '(PERSONA ADOLFO) '( (ADOLFO (? X)) ) (unificar '(PERSONA (? x)) '(PERSONA ADOLFO) ) )
;(unificar '(PERSONA (? x)) '(PERSONA ADOLFO) )

; EXAMPLE 3 (UNCOMMENT IT)
; REAL PREDICATES = PARENTS(x, FATHER(x), MOTHER(BILL)), PARENTS(BILL, FATHER(BILL), y)
; RESULT = ( (BILL (? x)) ((MOTHER BILL) (? Y)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 3 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '( PARENTS (? x) (FATHER (? x)) (MOTHER BILL) ) '( PARENTS BILL (FATHER BILL) (? y) ) ' ( (BILL (? x)) ((MOTHER BILL) (? Y)) ) (unificar '( PARENTS (? x) (FATHER (? x)) (MOTHER BILL) ) '( PARENTS BILL (FATHER BILL) (? y) ) ) )
;(unificar '( PARENTS (? x) (FATHER (? x)) (MOTHER BILL) ) '( PARENTS BILL (FATHER BILL) (? y) ) )

; EXAMPLE 4 (UNCOMMENT IT)
; REAL PREDICATES = P(foo(x), y) , P(a, b) 
; RESULT = FALLO_NO_UNIFICABLE
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 4 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

(probar '( (FOO (? x)) (? y) ) '( A B ) 'FALLO_NO_UNIFICABLE (unificar '( (FOO (? x)) (? y) ) '( A B ) ) )
;(unificar '( (FOO (? x)) (? y) ) '( A B ) )

; EXAMPLE 5 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = ( (A (? Y)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 5 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '( (? y) (? y) ) '( A (? y) ) '( (A (? Y)) ) (unificar '( (? y) (? y) ) '( A (? y) ) ))
;(unificar '( (? y) (? y) ) '( A (? y) ) )


; EXAMPLE 6 (UNCOMMENT IT)
; REAL PREDICATES = P(A) , P(b) 
; RESULT = ( (A (? B)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 6 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(P a) '(P (? b)) '( (A (? B)) ) (unificar '(P a) '(P (? b)) ) )
;(unificar '(P a) '(P (? b)) )

; EXAMPLE 7 (UNCOMMENT IT)
; REAL PREDICATES = P(x, B) , P(A, y) 
; RESULT = ( (A (? X)) (B (? Y)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 7 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(P (? x) B) '(P A (? y)) '( (A (? X)) (B (? Y)) ) (unificar '(P (? x) B) '(P A (? y)) ) )
;(unificar '(P (? x) B) '(P A (? y)) )

; EXAMPLE 8 (UNCOMMENT IT)
; REAL PREDICATES = P(x, B) , P(A, y) 
; RESULT = ( (A (? X)) (B (? Y)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 8 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '((? x) B) '(A (? y)) '( (A (? X)) (B (? Y)) ) (unificar '((? x) B) '(A (? y)) ))
;(unificar '((? x) B) '(A (? y)) )

; EXAMPLE 9 (UNCOMMENT IT)
; REAL PREDICATES = P(x, B, x, A) , P(A, y, x, A) 
; RESULT = 
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 9 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG                                                  

(probar '((? x) B (? x) A) '(A (? y) (? x) A) 'FALLO_NO_UNIFICABLE (unificar '((? x) B (? x) A) '(A (? y) (? x) A) ) )
;(unificar '((? x) B (? x) A) '(A (? y) (? x) A) )

; EXAMPLE 10 (UNCOMMENT IT)
; REAL PREDICATES = P(M, x, B) , P(M, A, y) 
; RESULT = '( (A (? X)) (B (? Y)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 10 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(P M (? x) B) '(P M  A (? y)) '( (A (? X)) (B (? Y)) ) (unificar '(P M (? x) B) '(P M  A (? y)) ) )
;(unificar '(P M (? x) B) '(P M  A (? y)) )

; EXAMPLE 11 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = '( (A (? X)) (B (? Y)) ((F A) (? C)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 11 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(P (? x) B (? c)) '(P A (? y) (f A)) '( (A (? X)) (B (? Y)) ((F A) (? C)) ) (unificar '(P (? x) B (? c)) '(P A (? y) (f A)) ) )
;(unificar '(P (? x) B (? c)) '(P A (? y) (f A)) )

; EXAMPLE 12 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = '( (A (? X)) (B (? Y)) ((F A B) (? C)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 12 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(P (? x) B (? c)) '(P A (? y) (f A B)) '( (A (? X)) (B (? Y)) ((F A B) (? C)) ) (unificar '(P (? x) B (? c)) '(P A (? y) (f A B))  ) )
;(unificar '(P (? x) B (? c)) '(P A (? y) (f A B))  )

; EXAMPLE 13 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = '( (A (? X)) (B (? Y)) ((F A B) (? C)) )
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 13 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

;(probar '(P (? x) B (? c)) '(P A (? y) (f A B)) '( (A (? X)) (B (? Y)) ((F A B) (? C)) ) (unificar '(P (? x) B (? c)) '(P A (? y) (f A B))  ) )
;(unificar '( (? x) B (? z) A ) '(A (? y) (? x) A ) )

; EXAMPLE 13 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = 'FALLO_NO_UNIFICABLE
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 14 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

(probar '( (? x) (? z) (? y) ) '( (? y) (? x) (? b) ) 'FALLO_NO_UNIFICABLE (unificar '( (? x) (? z) (? y) ) '((? y) (? x) (? b) )  ) )
;(unificar '( (? x) (? z) (? y) ) '((? y) (? x) (? b) ) )


; EXAMPLE 13 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = 'FALLO_NO_UNIFICABLE
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 15 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

(probar '(P C B A) '(B D C C) 'FALLO_NO_UNIFICABLE (unificar '(P C B A) '(B D C C)  ) )
;(unificar '(P C B A) '(B D C C) )

; EXAMPLE 13 (UNCOMMENT IT)
; REAL PREDICATES = P(y, y) , P(a, y) 
; RESULT = 'FALLO_NO_UNIFICABLE
(terpri)
(terpri)
(terpri)
(princ "***********************************************************************************************")
(terpri)
(princ "****************************************** EXAMPLE 16 ******************************************")
(terpri)
(princ "***********************************************************************************************")
(terpri)
(terpri)
(terpri)

(setf it 0); DEBUG 
(setf str "---->  "); DEBUG 

(probar '(P (? x) A) '(D (f h) (? y)) 'FALLO_NO_UNIFICABLE (unificar '(P (? x) A) '(D (f h) (? y)) ) )
;(unificar '(P (? x) A) '(P (f h) (? y)) )