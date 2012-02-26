;; Michael DeWitt
;; Greatest Lab
;; Contestron: 7



; `plan-heist` takes a list representing the place to rob and another list
; representing the different types of valuable things found there. It
; returns a list of the indices at which valuable items can be found in
; the first list.
(define plan-heist
  (lambda (joint loot)
    (define record-locations
      (lambda (index joint)
	(cond [(null? joint) '()]
	      [(member? (car joint) loot)
	       (cons index
		     (record-locations (+ index 1) (cdr joint)))]
	      [else
	       (record-locations (+ index 1) (cdr joint))])))
    (record-locations 0 joint)))

(define member?
  (lambda (elem ls)
    (cond [(null? ls) #f]
	  [(equal? elem (car ls)) #t]
	  [else (member? elem (cdr ls))])))



; Challenge:
; `pilfer` takes a list of items in a cased joint and a list of the indices
; of valuable items and returns a list of the valuable items (i.e. the
; items at the provided indices.)
(define pilfer
  (lambda (joint locs)
    (define help
      (lambda (index joint locs)
	(cond [(null? locs) '()]
	      [(equal? index (car locs))
	       (cons (car joint)
		     (help (+ index 1) (cdr joint) (cdr locs)))]
	      [else
	       (help (+ index 1) (cdr joint) locs)])))
    (help 0 joint locs)))
