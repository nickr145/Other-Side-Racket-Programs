#lang racket
(define (string->unicode str)
  (map char->integer
       (string->list str)))

(define (powers37 powers)
  (map (lambda (num1)
         (expt 37 num1))
       powers))
; Formula to calculate powers of 37
(define (total s powers)
  (map (lambda (number1 number2)
        (* number1 number2))
  s
  powers))
; Mapping

(define (rolling-hash s)
  (modulo (foldr + 0 (total s (powers37 (range (length s)))))
                                     997))

(define (string->hash str)
  (rolling-hash (string->unicode str)))