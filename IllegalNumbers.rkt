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
    


(define (desc-list n illegal)
  (cond
    [(member illegal (nat->digits n)) (desc-list (- n 1) illegal)]
    [(= (modulo n illegal) 0) (desc-list (- n 1) illegal)]
    [(= n 1) (list 1)]
    [else (cons n (desc-list (- n 1) illegal))]
    ))



(define (censored-countdown num illegal)
  (desc-list num illegal))
