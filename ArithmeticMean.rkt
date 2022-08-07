#lang racket
; Function that finds the sum of the list
(define (singleSum list)
  (foldr + 0 list))
;Finds the sum of each list for the numerator
(define (totalSum list)
  (singleSum (map singleSum list)))
;Finds the length of each list for the denominator  
(define (totalSize list)
  (singleSum (map length list)))
;Finds the ratio between numerator and denominator  
(define (arithmetic-mean nums)
  (/ (totalSum nums) (totalSize nums)))

  


 