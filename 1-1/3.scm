(define (sum-sq-two-larger a b c)
  (cond ((and (>= a c) (>= b c)) (+ (* a a) (* b b))) ; c is the smallest
        ((and (>= a b) (>= c b)) (+ (* a a) (* c c))) ; b is the smallest
        (else (+ (* b b) (* c c))))) ; a is the smallest

