#lang racket
(define (smallest lst)
  (foldl smaller (first lst) lst ))
                  
 (define (smaller a b)
   (cond
     [(> a b) b]
     [else a]))
