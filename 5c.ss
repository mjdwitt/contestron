;; Michael DeWitt
;; Greatest Lab
;; Contestron: 5c



; `fancy-streak` is the same as streak, except it's flip function is aware
; of the past by taking a list of past outputs.
(define fancy-streak
  (lambda (n flip)
    (find-fancy-streak n flip '() 0)))

(define find-fancy-streak
  (lambda (n flip past strk)
    (if (zero? n)
        strk
	(let ((a-flip (flip past)))
	  (find-fancy-streak (- n 1)
			     flip
			     (cons a-flip past)
			     (if (equal? a-flip 'heads)
			         (+ strk 1)
				 0))))))
