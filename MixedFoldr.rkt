#lang racket
(define (reverseList lst buildlist)
  (cond
    [(empty? lst) buildlist]
    [(reverseList (rest lst) (cons (first lst) buildlist))]
    ))

(define (reverse lst)
  (reverseList lst empty))




;(define (foldr-func oplist base foldnum)
 ; (cond
  ;  [(and (empty? oplist) (empty? foldnum)) base]
   ; [else
    ; (cond
    ;   [(equal? (first (reverse oplist)) '+) (foldr-func (rest (reverse oplist)) (+ base (first (reverse foldnum))) (rest (reverse foldnum)))]
    ;   [(equal? (first (reverse oplist)) '*) (foldr-func (rest (reverse oplist)) (* base (first (reverse foldnum))) (rest (reverse foldnum)))]
    ;   [(equal? (first (reverse oplist)) '-) (foldr-func (rest (reverse oplist)) (- base (first (reverse foldnum))) (rest (reverse foldnum)))]
    ;   [(equal? (first (reverse oplist)) '/) (foldr-func (rest (reverse oplist)) (/ base (first (reverse foldnum))) (rest (reverse foldnum)))]
    ;   )]
    ;))

(define (foldr-func oplist base foldnum)
  (cond
    [(and (empty? oplist) (empty? foldnum)) base]
    [else (foldr-func (rest (reverse oplist)) ((operation-mapper (first (reverse oplist))) base (first (reverse foldnum))) (rest (reverse foldnum)))]
    )
  )
       
   

(define (operation-mapper op)
  (cond
    [(equal? op '+) +]
    [(equal? op '*) *]
    [(equal? op '-) -]
    [(equal? op '/) /]
    ))
       
(define (mixed-foldr oplist base foldnum)
  (foldr-func oplist base foldnum))
    
(mixed-foldr (list '+ '+ '*) 0 (list 1 3 5))
