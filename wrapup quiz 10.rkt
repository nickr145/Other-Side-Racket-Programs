;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |wrapup quiz 10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (largest-x lop) 
  (local
    [(define xlist (map posn-x lop))
     (define (maxi x1 x2)
       (if (> x1 x2) x1 x2))
     (define (maxlist xs)
       (foldr maxi (first xs) (rest xs)))]
    (maxlist xlist)))

(largest-x (list (make-posn 1 3)
                 (make-posn 5 3)
                 (make-posn 3 3)
                 (make-posn -1 3)))

(define-struct colour (r g b))
;; A Colour is a (make-colour Nat Nat Nat)
;; Requires: 0 <= r, g, b <= 255

;; A Polygon is a (listof Posn)

(define-struct colourpoly (poly col))
;; A ColourPoly is a (make-colourpoly Polygon Colour)

(define square
  (make-colourpoly (list (make-posn 0 0)
                         (make-posn 1 0)
                         (make-posn 0 1)
                         (make-posn 1 1))
                   (make-colour 255 255 0)))
(define my-poly
  (make-colourpoly (list (make-posn 0 0)
                         (make-posn 1 0)
                         (make-posn 0 1)
                         (make-posn 1 1))
                   (make-colour 255 255 0)))
(define your-poly
  (make-colourpoly (list (make-posn 0 0)
                         (make-posn 1 0)
                         (make-posn 0 1)
                         (make-posn 1 1))
                   (make-colour 255 255 0)))

(posn-y (first (colourpoly-poly my-poly)))

(and (equal? (colourpoly-poly my-poly) (colourpoly-poly your-poly))
     (equal? (colourpoly-col my-poly) (colourpoly-col your-poly)))


;; warm-up quiz, q10
(define make-adder (lambda (m) (lambda (n) (+ m n))))
