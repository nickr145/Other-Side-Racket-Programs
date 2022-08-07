#lang racket
(define (prefix source sub)
  (cond
    [(empty? sub) true]
    [(and (empty? source) (not (empty? sub))) false]
    [else
     (cond
       [(equal? (first source) (first sub)) (prefix (rest source) (rest sub))]
       [else false]
       )]
    ))

(define (exists? source sub index)
  (cond
    [(empty? source) index]
    [(prefix source sub) index]
    [else (exists? (rest source) sub (+ index 1))]
    ))

(define (find-list source sub)
  (exists? source sub 0))

(find-list (list 1 2 3 4) (list 2 3))
(find-list (list 2 3 5 6 2 3 9) (list 2 3))
(find-list (list 1 3 8 9 2 4) (list 3 8 9 4))
(find-list (list 1) (list 2 3 4 5))
(find-list (list #\G #\A #\T #\T #\A #\C #\A) (list #\T #\T))
