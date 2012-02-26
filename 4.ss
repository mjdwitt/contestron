;; Michael DeWitt
;; Greatest Lab
;; Contestron: 4



; `quest` finds the number that is the smallest possible number divisible
; by all the integers from 1 to the given number.
(define quest
  (lambda (n)
    (fold-right lcm 1 (range n))))

(define range
  (lambda (n)
    (cond [(zero? n) '()]
	  [(> 0 n) '(0)]
	  [else
	   (cons n (range (- n 1)))])))
