#lang racket
;function to replace string from a list
(define (replace list1 string1 replacement)
  (map (lambda (b)
         (if (string=? b string1) replacement b))
       list1))


;Main function
(define (capitalize-vowels phrase)
  (list->string (foldr (lambda (a state)
           (cond
             [(char=? a #\a) (cons #\A state)]
             [(char=? a #\e) (cons #\E state)]
             [(char=? a #\i) (cons #\I state)]
             [(char=? a #\o) (cons #\O state)]
             [(char=? a #\u) (cons #\U state)]
             [else (cons a state)]))
         '()
         (string->list phrase))))
         
  