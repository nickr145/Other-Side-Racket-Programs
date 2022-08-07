#lang racket
(define perfect (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))


(define (add-to-end item list)
  (if (empty? list) (cons item list) (cons (first list) (add-to-end item (rest list)))))

(define (has-duplicates? list)
  (cond
    [(empty? list) false]
    [(member (first list) (rest list)) true]
    [else (has-duplicates? (rest list))]
    ))

(define (leprechaun-adder colour rainbow perfect buildlist) ;buildlist is empty at first
  (cond
    ;[(and (and (empty? rainbow) (empty? perfect)) (not(has-duplicates? buildlist))) buildlist] ;Basically stops the function from adding again at the end of the list
    
    [(empty? perfect) buildlist]
    [(and (empty? rainbow) (equal? colour "taken")) buildlist]
    [(empty? rainbow) (add-to-end colour buildlist)] ;(add-to-end colour buildlist)] ;<-- Error for test case #2 & #3
    
  
  [else
   (cond
     [(equal? (first perfect) (first rainbow))
      (cond
        [(equal? (first perfect) colour) (leprechaun-adder "taken" (rest rainbow) (rest perfect) (add-to-end (first rainbow) buildlist))]
        [else (leprechaun-adder colour (rest rainbow) (rest perfect) (add-to-end (first rainbow) buildlist))])]
     [else
      (cond
        [(equal? (first perfect) colour)
         (leprechaun-adder "taken" rainbow (rest perfect) (add-to-end colour buildlist))]
        [else
         (leprechaun-adder colour rainbow (rest perfect) buildlist)]
        )]
     )]
  ))
   

;(define perfect (list "red" "orange" "yellow" "green" "blue" "indigo" "violet"))
(leprechaun-adder "indigo" (list "red" "yellow" "blue") perfect '())
(leprechaun-adder "orange" (list "red" "yellow" "blue") perfect '())
(leprechaun-adder "yellow" (list "red" "yellow" "blue") perfect '())
 