#lang racket
;ROMAN LETTER AND VALUE DICTIONARY
(define roman-dict (list (list #\I 1)
(list #\V 5)
(list #\X 10)
(list #\L 50)
(list #\C 100)
(list #\D 500)
(list #\M 1000)))

;Function to convert string to list
(define (r-list roman-string)
  (string->list roman-string))

;Function to lookup a certain character from the roman dictionary and return the value of that character.
(define (lookup list key)
  (foldr (lambda (a state)
           (cond
             [(char=? (first a) key) (second a)]
             [else state]))
         '()
         list))

;Function to convert string to numbers
(define (listofnums roman-dict r-list)
  (map (lambda (r-value)
         (lookup roman-dict r-value))
       r-list))

;Function to find min of list
(define (minimum list)
  (foldr (lambda (a state)
           (cond
             [(< a state) a]
             [else state]))
         (min list)
         list))

;Analyzing function // Main Function?
(define (decode-romic roman-dict roman-string)
  (first (foldr (lambda (a state)
           (cond
             [(< a (second state)) (list (- (first state) a) a)] 
             [else (list (+ (first state) a) a)]))
          (list 0 -1)
         (listofnums roman-dict (r-list roman-string)))))

;Function to calculate the sum of the list
(define (sumoflist list)
  (foldr (lambda (a accumulative)
           (+ a accumulative))
         0
         list))
             
(decode-romic roman-dict "MCMXXXXXIIIIIII")        


  
                     
  