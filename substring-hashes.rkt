#lang racket
(define (string->unicode str)
  (map char->integer
       (string->list str)))

(define (powers-p p powers)
  (map (lambda (num1)
         (expt p num1))
       powers))

(define (total s powers)
  (map (lambda (number1 number2)
        (* number1 number2))
  s
  powers))


(define (string->hash str p m)
  (modulo (foldr + 0 (total (string->unicode str) (powers-p p (range (length (string->unicode str))))))
                                     m))

;-----------SUBSTRING-HASHES------------;

(define (reverselist list)
   (foldl (lambda (a state)
            (cons a state))
            empty
            list))
          
(define (addtolist list item)
  (cons item list))
           
(define (removefromlist list)
  (reverselist (rest (reverselist list))))

(define (last list)
  (first (reverselist list)))



(define (charlist string)
  (string->list string))

(define (getlastsubsequence string len)
  (substring string (- (string-length string) len) (string-length string)))

(define (substring-hashes source len p m)
  (foldr (lambda (a state)
           (cond
             [(= a (- (string-length source) len))
              (addtolist state (string->hash (substring source a (+ a len)) p m))]
             [(< a (- (string-length source) len))
              (addtolist state (modulo (+ (* (- (first state) (* (first (string->unicode (substring source (+ len a) (+ len a 1)))) (expt p (- len 1)))) p) (first (string->unicode (substring source a (+ a 1))))) m))]
             [else state]))
         empty
         (range (string-length source))))
           
             
             
         


  
           
           