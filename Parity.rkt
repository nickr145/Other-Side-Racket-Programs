#lang racket
(define (positivecharacter char)
  (equal? char #\1))

(define (numberofones numsstr)
  (length (filter positivecharacter (string->list numsstr))))

(define (parity numsstr)
  (cond
    [(even? (numberofones numsstr)) "even"]
    [else "odd"]))