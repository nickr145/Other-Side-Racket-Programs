#lang racket
;Use this to produce the indexes from 0 to (- (length list) 1)
(define (my-range start end step)
  (cond
    [(and (> step 0) (> start end)) '()]
    [(and (< step 0) (< start end)) '()]
    [else (cons start (my-range (+ start step) end step))]
    ))

(define (exists? source sub)
  (cond
    [(and (empty? source) (empty? sub)) true]
    [(empty? source) false]
    [(empty? sub) true]
    
    [else
     (if (equal? (first sub) (first source)) (exists? (rest source) (rest sub))
         (exists? (rest source) sub))]
    ))

(define (indexer source sub list)
  (cond
    [(and (exists? source sub) (not (empty? sub)))
     (cond
       [(equal? (first source) (first sub)) (first list) (indexer (rest source) (rest sub) (rest list))]
       [else (length source)])
     [else
  

(define (find-list source sub)
  (indexer source sub (my-range 0 (- (length source) 1) 1)))

(find-list (list 1 2 3 4) (list 2 3))

;(find-list (list 1 3 5 6 2 3 9) (list 2 3))
;(find-list (list 1 3 8 9 2 4) (list 3 8 9 4))
;(find-list (list 1) (list 2 3 4 5))
;(find-list (list #\G #\A #\T #\K #\A #\C #\A) (list #\T #\K))
;(if (and (exists? source sub) (not (empty? sub)))
 ;     (if (equal? (first source) (first sub))
  ;        (first list)
   ;       (indexer (rest source) (rest sub) (rest list)))
    ;  (length source)))