;; Michael DeWitt
;; Greatest Lab
;; Contestron: 1



; `mesh` takes two lists and zips them together into a single
; list where each element is chosen alternately from the two
; input lists.
(define mesh
  (lambda (ls1 ls2)
    (cond [(null? ls1) ls2]
	  [(null? ls2) ls1]
	  [else (cons (car ls1)
		      (mesh ls2 (cdr ls1)))])))
