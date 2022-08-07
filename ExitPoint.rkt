#lang racket
(define (exit-point stop-loss limit-sell price-list)
  (cond
    [(= (length price-list) 1) (first price-list)]
    [(<= (first price-list) stop-loss) (first price-list)]
    [(>= (first price-list) limit-sell) (first price-list)]
    [else (exit-point stop-loss limit-sell (rest price-list))]
    ))
