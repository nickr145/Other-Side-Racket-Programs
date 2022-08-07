#lang racket
;---SCORE TABLE PER CHARACTER----
(define 1-tiles (list #\A #\a #\E #\e #\I #\i #\O #\o #\U #\u #\L #\l #\N #\n #\S #\s #\T #\t #\R #\r))
(define 2-tiles (list #\D #\d #\G #\g))
(define 3-tiles (list #\B #\b #\C #\c #\M #\m #\P #\p))
(define 4-tiles (list #\F #\f #\H #\h #\V #\v #\W #\w #\Y #\y))
(define 5-tiles (list #\K #\k))
(define 8-tiles (list #\J #\j #\X #\x))
(define 10-tiles (list #\Q #\q #\Z #\z))
;--------------------------------
(define score 0)

(define (charlist string)
  (string->list string))

(define (wordscore list score) ;score set to 0 for now
  (cond
    [(empty? list) score]
    [else 
     (if (member (first list) 1-tiles) (wordscore (rest list) (+ score 1)) 
         (if (member (first list) 2-tiles) (wordscore (rest list) (+ score 2))
             (if (member (first list) 3-tiles) (wordscore (rest list) (+ score 3))
                 (if (member (first list) 4-tiles) (wordscore (rest list) (+ score 4))
                     (if (member (first list) 5-tiles) (wordscore (rest list) (+ score 5))
                         (if (member (first list) 8-tiles) (wordscore (rest list) (+ score 8))
                             (if (member (first list) 10-tiles) (wordscore (rest list) (+ score 10))
                                 (wordscore (rest list)))))))))]
    ))



(define (scorelist wordlist pointlist) ;pointlist is empty at beginning
  (cond
    [(empty? wordlist) pointlist]
    [else (cons (cons (wordscore (charlist (first wordlist)) score) pointlist)
                (scorelist (rest wordlist) pointlist))]
    ))
  ;^^ produces a listoflist filled with numbers

(define (sum-lists list1 list2)
  (cond
    [(and (empty? list1) (empty? list2)) '()]
    [else (cons (+ (first list1) (first list2)) (sum-lists (rest list1) (rest list2)))]))

(define (sum-all-lists listoflist)
  (cond
    [(= (length listoflist) 1) (first listoflist)]
    [else (sum-lists (first listoflist) (sum-all-lists (rest listoflist)))]
    ))


(define (scrabble-score wordlist)
  (first (sum-all-lists  (scorelist wordlist empty))))
  
  








                        
