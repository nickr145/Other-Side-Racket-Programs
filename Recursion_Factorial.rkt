#lang racket
(define 
(define (fact n)
  (cond
    [(= n 1) 1]
    [else (* n (fact (- n 1)))]))
