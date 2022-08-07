#lang racket
(define (sum-lists list1 list2)
  (cond
    [(and (empty? list1) (empty? list2)) '()]
    [else (cons (+ (first list1) (first list2)) (sum-lists (rest list1) (rest list2)))]))
