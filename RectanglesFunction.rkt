#lang racket
(define (area-list f xmin xmax nsteps)
  (list 1 2 3))

(define (width xmax xmin nsteps)
  (/ (- xmax xmin) nsteps))

(define (xvalues xmin xmax width)
  (range xmin xmax width))

(define (areas f width xvalues)
  (map (lambda (x)
         (* width (f x)))
       xvalues))

(define (rect-area f xmin xmax nsteps)
  (define w (width xmax xmin nsteps))
  (define xs (xvalues xmin xmax w))
  (define as (areas f w xs))
  (foldl + 0 as))
