#lang racket
(define (my-gcd num1 num2)
  (cond
    [(= (min num1 num2) 0) (max num1 num2)]
    [else
     (foldr
   (lambda (a result)
     (cond
       [(> result 0) result]
       [else
        (cond
          [(and (= (modulo num1 a) 0) (= (modulo num2 a) 0)) a]
          [else 0])]))
   0
   (range 1 (+ 1 (min num1 num2))))]))
     
  