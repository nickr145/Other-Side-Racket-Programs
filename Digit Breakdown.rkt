#lang racket
(define (add-to-end item list)
  (if (empty? list) (cons item list) (cons (first list) (add-to-end item (rest list)))))


(define (list-generator num buildlist)
  (cond
    [(and (= num 0) (empty? buildlist)) (list 0)]
    [(= num 0) buildlist]
    [else
     (list-generator (/(- num (modulo num 10)) 10) (add-to-end (modulo num 10) buildlist))]
    ))

(define (nat->digits num)
  (list-generator num empty))
    