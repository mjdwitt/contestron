;; Michael DeWitt
;; Greatest Lab
;; Contestron: 3



; Part A:
; `cropped-add` takes two numbers, n and limit, and a list of numbers.
; n is added to each of the numbers in the list and if the result is
; greater than the limit, the limit is returned instead of the result.
; The results are all stored and returned in a list.
(define cropped-add
  (lambda (n limit ns)
    (if (null? ns)
        '()
	(cons (if (> (+ n (car ns)) limit)
		  limit
		  (+ n (car ns)))
	      (cropped-add n limit (cdr ns))))))

; Part B:
; `curve-exam` takes a list of exam scores (integers in [0,100]) and
; returns a list of curved scores. Scores are curved such that all scores
; are raised by a certain amount (twice the smallest value required for at
; least one student to have a curved score of 100) and no scores are
; greater than 100.
(define curve-exam
  (lambda (scores)
    (define curve-loop
      (lambda (curve scores)
	(if (null? scores)
	    '()
	    (cons (cropped-add curve (car scores))
		  (curve-loop curve (cdr scores))))))
    (define curve-amount
      (lambda (biggest scores)
	(cond [(null? scores) (* 2 (- 100 biggest))]
	      [(> (car scores) biggest)
	       (curve-amount (car scores) (cdr scores))]
	      [else
	       (curve-amount biggest (cdr scores))])))
    (curve-loop (curve-amount 0 scores) scores)))
