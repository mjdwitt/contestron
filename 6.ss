;; Michael DeWitt
;; Greatest Lab
;; Contestron: 6



; `mix` improves upon the example code by making itself tail recursive
; and performing the modulos on each iteration instead of a single
; application at the end. This limits memory use greatly.
(define mix
  (lambda (private base clock)
    (define mix-loop
      (lambda (n result)
	(if (zero? n)
	    result
	    (mix-loop (- n 1) (modulo (* result base) clock)))))
    (mix-loop private 1)))
