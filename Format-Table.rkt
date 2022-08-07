#lang racket
(define (maxlist list)
  (foldr max
         (first list)
         list))

(define (maxlistoflist list)
  (foldr (lambda (list1 state)
           (max (maxlist list1) state))
         (first (first list))
         list))

(define (makespaces n)
  (foldl (lambda (a state)
         (string-append state " "))
         ""
         (range n)))

(define (numberlength n)
  (string-length (number->string n)))


(define (padnumber x width)
  (string-append (makespaces (- width (numberlength x))) (number->string x)))
         
(define (format-row list width)
  (substring (foldl (lambda (a state)
           (string-append (string-append state (padnumber a width)) " "))
         ""
         list) 0 (- (+ (* (length list) width) (length list)) 1)))

(define (format-table list)
  (map (lambda (a)
         (format-row a (numberlength (maxlistoflist list))))
       list))
            