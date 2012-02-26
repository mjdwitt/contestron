;; Michael DeWitt
;; Greatest Lab
;; Contestron: 2c



; `highlight-all` does the same as Problem 2's highlight without the
; restriction to only top-level items. If a sublist is encountered,
; highlight-all will check for and highlight all items in the sublist.
(define highlight-all
  (lambda (item ls)
    (cond [(null? ls) '()]
	  [(list? (car ls))
	   (cons (highlight-all item (car ls))
		 (highlight-all item (cdr ls)))]
	  [(equal? item (car ls))
	   (cons (list item)
		 (highlight-all item (cdr ls)))]
	  [else
	   (cons (car ls)
		 (highlight-all item (cdr ls)))])))
