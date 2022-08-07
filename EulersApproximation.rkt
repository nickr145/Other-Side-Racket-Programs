#lang racket
(define (fact n)
  (cond
    [(<= n 1) 1]
    [else (* n (fact (- n 1)))]))

(define (inv n)
    (/ 1 n))

(define (approx-e n)
  (cond
    [(<= n 1) 1]
    [else (+ (inv (fact (- n 1))) (approx-e (- n 1)))]))
  