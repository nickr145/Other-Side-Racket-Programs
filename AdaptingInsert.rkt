#lang racket
(define alpha-order (list "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
                      "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))


(define (add-to-end item list)
  (if (empty? list) (cons item list) (cons (first list) (add-to-end item (rest list)))))

(define (has-duplicates? list)
  (cond
    [(empty? list) false]
    [(member (first list) (rest list)) true]
    [else (has-duplicates? (rest list))]
    ))

(define (str-insert str list alpha-order buildlist) ;buildlist is empty at first
  (cond
    ;[(and (and (empty? rainbow) (empty? perfect)) (not(has-duplicates? buildlist))) buildlist] ;Basically stops the function from adding again at the end of the list
    
    [(empty? alpha-order) buildlist]
    [(and (empty? list) (equal? str "taken")) buildlist]
    [(empty? list) (add-to-end str buildlist)] ;(add-to-end colour buildlist)] ;<-- Error for test case #2 & #3
    
  
  [else
   (cond
     [(equal? (first alpha-order) (substring (first list) 0 1))
      (cond
        [(equal? (first alpha-order) (substring str 0 1)) (str-insert "taken" (rest list) (rest alpha-order) (add-to-end (first list) buildlist))]
        [else (str-insert str (rest list) (rest alpha-order) (add-to-end (first list) buildlist))])]
     [else
      (cond
        [(equal? (first alpha-order) (substring str 0 1)) (str-insert "taken" list (rest alpha-order) (add-to-end str buildlist))]
        [else (str-insert str list (rest alpha-order) buildlist)])
      ]
     )]
  ))

(define (refiner list ref-list)
  (cond
    [(empty? list) ref-list]
    [(equal? (first list) "taken") (refiner (rest list) ref-list)]
    [else (refiner (rest list) (add-to-end (first list) ref-list))]
    ))

(refiner (str-insert "g" (list "a" "b" "x" "y") alpha-order empty) empty)
(refiner (str-insert "Z" (list "a" "g" "v") alpha-order empty) empty)
(refiner (str-insert "Cat" (list "Aardvark" "Tree" "Xylophone") alpha-order empty) empty)