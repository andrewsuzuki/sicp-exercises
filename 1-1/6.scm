(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(display (sqrt 9))

; Using the custom-implemented if procedure here results in a theoretically-correct
; program, but the stack is exceeded (at least on my machine). This is due to the
; applicative-order execution default -- each operand to new-if is evaluated before
; substitution, meaning infinite recursion since the "else" branch contains a recursive
; call. The special form if does not evaluate any branch before the predicate is tested,
; then it will pick the appropriate branch.
