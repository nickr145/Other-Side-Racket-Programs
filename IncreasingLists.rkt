#lang racket
(define (increasing? list)
  (cond
    [(<= (length list) 1) true]
    [else
     (cond
       [(< (first list) (second list)) (increasing? (rest list))]
       [else false]
       )]
    ))


       