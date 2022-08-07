#lang racket
(define state (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))

(define (rainbow-recurse list state)
  (cond
    [(empty? list) true]
    [(empty? state) false]
    [else (if (equal? (first list) (first state))
              (rainbow-recurse (rest list) (rest state))
              (rainbow-recurse list (rest state)))]
    ))

(define (rainbow? list)
  (rainbow-recurse list state))
     
  