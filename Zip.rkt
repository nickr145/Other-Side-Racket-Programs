#lang racket
(define (createlist a b)
  (cons a (cons b empty)))

(define (zip list1 list2)
  (map createlist list1 list2))
