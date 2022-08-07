#lang racket
(define (test-list num)
  (if
   (= num 1)
   (list 1)
   (cons num (test-list (- num 1)))))

(define (reverse list)
  (if
   (empty? list)
   '()
   (cons (first list) (reverse (rest list)))))

(define (comparator greater?)
  (if greater? > <))

;Actual range function using recursion \/ \/
(define (new start end step)
  (cond
    [(and (> step 0) (> start end)) '()]
    [(and (< step 0) (< start end)) '()]
    [else (cons start (my-range (+ start step) end step))]
    ))





(define (my-range start end step)  
  (if (> step 0)
      (if (> start end) '()
          (cons start (my-range (+ start step) end step)))
      (if (< start end) '()
          (cons start (my-range (+ start step) end step)))
      ))
   





; Use a sum function that starts at starting value and
; uses cons to attach the starting value with the new sum
; (starting + step = sum
; sum + step = new sum
; ...
; if sum > ending range, stop recursion