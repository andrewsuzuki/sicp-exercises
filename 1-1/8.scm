(define (cube x) (* x x x))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (cbrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+
       (/ x (* guess guess))
       (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (my-cbrt x)
  (cbrt-iter 1.0 x))

(display (my-cbrt 27))
(newline)
(display (my-cbrt 66.6))

