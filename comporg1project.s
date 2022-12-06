



main:
    li $v0 4
    la $Q0 prompt
    syscall
    move $t0 $v0
    bge $t0 25 fib_full
    j else


else:
    li $v0 4
    la $Q0 errormsg
    syscall
    j main

.data
    prompt: .asciiz "Please input a number greater than or equal to 25: "
    errormsg: .asciiz "Illegal number"
    message: .asciiz "Fib worked"

fib_full:
    # li $v0 4
    # la $a0 message
    # syscall

    subu $sp $sp 32
    sw $ra 4($sp)
    sw $a0 8($sp)
    sub $a0 $a0 1

    jal fib