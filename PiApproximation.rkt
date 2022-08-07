#lang racket
(define (division x y)
  (/ x y))

(define (multiply x y)
  (* x y))

(define (fact1 n)
  (cond
    [(<= n 1) 1]
    [else (* n (fact1 (- n 1)))]))

(define (fact2 n)
  (cond
    [(<= n 1) 1]
    [else (* n (fact2 (- n 2)))]))

(define (term n)
  (multiply (division (fact1 (- n 1)) (fact2 (- (* n 2) 1))) 2))

(define (approx-pi n)
  (cond
    [(= n 1) 2]
    [else (+ (term n) (approx-pi (- n 1)))]))
    