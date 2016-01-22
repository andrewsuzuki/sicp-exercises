(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

; Small numbers: ~ an order of magnitude apart due to .001 tolerance
(display (my-sqrt 0.00001))
(newline)
(display (sqrt 0.00001))

(newline)

; Big numbers: gets stuck
;(display (my-sqrt 10000000000000))
;(newline)
;(display (sqrt 10000000000000))

; Big numbers get stuck due to floating point overflow:

(define bn 1000000000000000)

(define (sqrt-iter-display guess x n)
  (if (or (good-enough? guess x) (< n 1))
    guess
    (begin
      (display guess)
      (newline)
      (sqrt-iter-display (improve guess x) x (- n 1)))))

(display (sqrt-iter-display 1.0 bn 35))

(newline)
(newline)

; In less than 30 recurs, we see that new guesses "converge" into 31622776.601683795,
; In other words:
(display
  (= (improve 31622776.601683795 bn)
     31622776.601683795))

; gets it stuck in an infinite recursion

(newline)
(newline)

; New version with check:

(define (sqrt-iter-nostuck guess x)
  (if (good-enough-nostuck? guess x)
    guess
    (sqrt-iter-nostuck (improve guess x) x)))

(define (good-enough-nostuck? guess x)
  (or (< (abs (- (square guess) x)) 0.001)
      (= (improve guess x) guess)))

(display (sqrt-iter-nostuck 1.0 bn))

; meh
