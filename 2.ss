;; Michael DeWitt
;; Greatest Lab
;; Contestron: 2



; `highlight` takes a list and a value and moves each top-level occurrence
; of the value into it's own one-item sublist, in the same place as it
; occupies in the original list.
(define highlight
  (lambda (item ls)
    (cond [(null? ls) '()]
	  [(equal? item (car ls))
	   (cons (list item)
		 (highlight item (cdr ls)))]
	  [else
	   (cons (car ls)
		 (highlight item (cdr ls)))])))
