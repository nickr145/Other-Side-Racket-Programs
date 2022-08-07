#lang racket
(define (set=? list1 list2)
  (cond
    [(not (= (length list1) (length list2))) false]
    [else
     (foldr (lambda (a b state)
              (cond
                [(not state) state]
                [else
                 (cond
                   [(and (member b list1) (member a list2)) state]
                   [else false])]))
            true
            list1
            list2)]))
     