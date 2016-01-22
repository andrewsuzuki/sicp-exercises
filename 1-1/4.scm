(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; If b is positive, then b = abs(b), so + can be used on a and b.
; If b is negative then b = -abs(b), so - can be used on a and b, effectively negating the negative (or zero) b.
