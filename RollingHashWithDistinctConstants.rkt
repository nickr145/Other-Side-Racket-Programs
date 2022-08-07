#lang racket
(define (string->unicode str)
  (map char->integer
       (string->list str)))

(define (powers-p p powers)
  (map (lambda (num1)
         (expt p num1))
       powers))

(define (total s powers)
  (map (lambda (number1 number2)
        (* number1 number2))
  s
  powers))


(define (string->hash str p m)
  (modulo (foldr + 0 (total (string->unicode str) (powers-p p (range (length (string->unicode str))))))
                                     m))



         