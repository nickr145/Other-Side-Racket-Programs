#lang racket
(define (sum-lists list1 list2)
  (cond
    [(and (empty? list1) (empty? list2)) '()]
    [else (cons (+ (first list1) (first list2))
                (sum-lists (rest list1) (rest list2)))]
    ))



(define (sum-all-lists listoflist)
  (cond
    [(= (length listoflist) 1)
     (first listoflist)]
    [else (sum-lists (first listoflist)
                     (sum-all-lists (rest listoflist)))]
    ))

(define (dividelist num list)
  (if (null? list) '()
      (cons (/ (first list) num) (dividelist num (rest list)))))
  
  

(define (nutrition-per-serving numservings nutrientlist infolistoflist)
  (cond
    [(and (empty? nutrientlist)
          (empty? infolistoflist))
     '()]
    [else
     (cons (cons (first nutrientlist) (first (dividelist numservings (sum-all-lists infolistoflist))))
           (nutrition-per-serving numservings (rest nutrientlist) (rest (dividelist numservings (sum-all-lists infolistoflist)))))]
    ))