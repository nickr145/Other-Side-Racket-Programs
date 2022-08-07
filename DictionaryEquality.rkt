#lang racket
(define myDict (list (list "A" 1) (list "B" 2) (list "C" 3)))
(define otherDict (list (list "A" 5) (list "B" 2) (list "C" 3)))
(define equalDict (list (list "B" 2) (list "C" 3) (list "A" 1)))
(define anotherDict (list (list "Hello" 6) (list "Boo" 22)))
(define neqDict (list (list "B" 2) (list "C" 3) (list "X" 6) (list "A" 1)))

(define (subset? d1 d2)
  (cond
    ;[(not (= (length d1) (length d2))) false]
    [(empty? d1) true]
    [else
     (cond
       [(member (first d1) d2) (subset? (rest d1) d2)]
       [else false])]
    ))

(define (dictionary=? d1 d2)
  (and (subset? d1 d2) (subset? d2 d1)))


(dictionary=? myDict equalDict)
(dictionary=? myDict otherDict)
(dictionary=? otherDict anotherDict)
(dictionary=? neqDict myDict)
(dictionary=? equalDict neqDict)
(dictionary=? empty empty)


;(define (listEqual list1 list2)
 ; (cond
  ;  [(empty? list1) true]
   ; [else
    ; (cond
     ;  [(equal? (first list1) (first list2)) (listEqual (rest list1) (rest list2))]
      ; [else false]
      ; )]
    ;))

;(listEqual (list 1 2 3) (list 1 2 3))
;listEqual (list 1 2 3) (list 1 4 3))