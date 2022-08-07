#lang racket

(define digitlist (list 0 1 2 3 4 5 6 7 8 9))

(define (digitbuilder num list)
  [(= (string-length (number->string num)) 0) '()]
    [else
     (cond
       (cons
        (substring (number->string num) 0 (- (string-length (number->string num)) 1))
        

(define (nat->digits num)
  (cond
    [(= (string-length (number->string num)) 0) '()]
    [else
     (cond
       (cons
        (substring (number->string num) 0 (- (string-length (number->string num)) 1))
        (nat-digits (rest num)       