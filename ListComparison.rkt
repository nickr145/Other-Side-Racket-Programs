#lang racket

(define (list<? list1 list2)
  (cond
    [(or (empty? list1) (empty? list2)) false]
    [(< (first list1) (first list2)) true]
    [(> (first list1) (first list2)) false]
    [else (list<? (rest list1) (rest list2))]
    ))

