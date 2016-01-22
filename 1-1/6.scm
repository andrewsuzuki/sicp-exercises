; Using the custom-implemented if procedure here results in a theoretically-correct
; program, but the stack is exceeded (at least on my machine). This is due to the
; applicative-order execution default -- each operand to new-if is evaluated before
; substitution, meaning infinite recursion since the "else" branch contains a recursive
; call. The special form if does not evaluate any branch before the predicate is tested,
; then it will pick the appropriate branch.
