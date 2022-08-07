#lang racket
(define (make-distinct l)
  (foldr (lambda (v set)
           (cond
             [(member v set) set]
             [else (cons v set)]))
           '()
           l))
           
           
         