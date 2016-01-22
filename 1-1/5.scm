(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; normal-order
(test 0 (p))
(if (= 0 0) 0 (p))
; 0, since the then-branch is evaluated as 0

; applicative-order
(test 0 (p))
; infinite recursion, since arguments will be evaluated first
