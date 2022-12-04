



main:
    li $v0 4
    la $Q0 prompt
    syscall
    move $t0 $v0
    bge $t0 25 fib
    j else


else:
    li $v0 4
    la $Q0 prompt
    syscall
    j main