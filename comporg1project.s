



main:
    li $v0 4
    la $Q0 prompt
    syscall
    move $t0 $v0
    jal fib
    move $t1 $v0

    li $v0 1
    move $a0 $t1
    syscall
    #j else
    jal exit
    


else:
    li $v0 4
    la $Q0 errormsg
    syscall
    j main

.data
    prompt: .asciiz "Please input a number greater than or equal to 25: "
    errormsg: .asciiz "Illegal number"
    message: .asciiz "Fib worked"

fib:
    bge $t0 25 fib_full
    j else
    j $ra
    

fib_full:
    # li $v0 4
    # la $a0 message
    # syscall

    subu $sp $sp 32
    sw $ra 4($sp)
    sw $a0 8($sp)
    sub $a0 $a0 1

    jal fib

    sw $v0 0 ($sp)
    sub $a0 $a0 1
    jal fib

    lw $t0 0 ($sp)
    add $v0 $t0 $v0

    lw $ra 4 ($sp)
    lw $a0 8 ($sp)
    addu $sp $sp 12

    jr $ra