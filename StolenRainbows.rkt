#lang racket
;"colour" is the specific item we want to remove
;"rainbow" is the list of colours we have now

(define (unicorn colour rainbow)
  (cond
    [(empty? rainbow)
     '()]
    [(equal? (first rainbow) colour)
     (rest rainbow)]
    [else (cons
           (first rainbow)
           (unicorn colour (rest rainbow)))]
    ))