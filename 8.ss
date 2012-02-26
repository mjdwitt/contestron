;; Michael DeWitt
;; Greatest Lab
;; Contestron: 8



; Part A:
; `repeat-appender` appends a list to itself a given number of times.
(define repeat-appender
  (lambda (n ls)
    (define loop
      (lambda (n out)
	(if (zero? n)
	    out
	    (loop (- n 1) (append out ls)))))
    (loop n '())))

; Part B:
; `make-frog-program` is an optimized version of the lecture problem
; which only works for even numbers of frogs. It outputs a list of the
; frogs to move in the order they should be moved.
(define make-frog-program
  (lambda (n)
    (define build-even-list
      (lambda (x)
	(if (< n x)
	    '()
	    (cons x (build-even-list (+ x 2))))))
    (define build-odd-list
      (lambda (n)
	(if (zero? n)
	    '()
	    (cons (- n 1) (build-odd-list (- n 2))))))
    (define build-list
      (lambda (frogs)
	(append (build-even-list 2)
		(build-odd-list frogs))))
    (append (repeat-appender (/ n 2) (build-list n))
	    (build-even-list 2))))
