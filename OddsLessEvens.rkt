#lang racket
(define (oddsum intlist)
  (cond
    [(empty? intlist) (+ 0)]    
    [(odd? (first intlist))
      (+ (first intlist) (oddsum (rest intlist)))]
    [(even? (first intlist))
     (oddsum (rest intlist))]))

(define (evensum intlist)
  (cond
    [(empty? intlist) (+ 0)]
    [(even? (first intlist))
      (+ (first intlist) (evensum (rest intlist)))]
    [(odd? (first intlist))
     (evensum (rest intlist))] ))    
    



(define (odds-less-evens intlist)
  (- (oddsum intlist) (evensum intlist)))