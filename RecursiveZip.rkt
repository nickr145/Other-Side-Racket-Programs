#lang racket
(define (zip list1 list2)
  (cond
    [(and (empty? list1) (empty? list2)) '()]
    [else (cons
           (cons (first list1) (first list2))
           (zip (rest list1) (rest list2)))]))
           
  