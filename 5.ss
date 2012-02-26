;; Michael DeWitt
;; Greatest Lab
;; Contestron: 5



; Part A:
; `head-count` takes a whole number n and a flip function flip and returns
; the number of heads returned in n applications of flip.
(define head-count
  (lambda (n flip)
    (if (zero? n)
        0
	(+ (if (equal? 'heads (flip))
	       1
	       0)
	   (head-count (- n 1) flip)))))

; Part B:
; `streak` takes a whole number n and a flip function flip and returns the
; greatest number of consectutive flips resulting in heads in n
; applications of flip.
(define streak
  (lambda (n flip)
    (define find-streak
      (lambda (n flip strk)
	(if (zero? n)
	    strk
	    (find-streak (- n 1) flip (if (equal? 'heads (flip))
					(+ strk 1)
					0)))))
    (find-streak n flip 0)))
