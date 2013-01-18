# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21ex1.asm
# Given n, computes Tribonacci(n)

main:
   la   $a0, prompt        # print prompt
   li   $v0, 4
   syscall
   li   $v0, 5             # read int n
   syscall                 # read int n
   move $t6, $v0           # read int n
   
   li   $t0, 0             # Tribonacci(0) = 0
   li   $t1, 1             # Tribonacci(1) = 1
   li   $t2, 2             # Tribonacci(2) = 2
   
   beq  $t6, 0, zero
   beq  $t6, 1, one
   beq  $t6, 2, two
   li   $t5, 2             # i = 2
   j computeTribonacci
   
   zero:
   move $t4, $t0
   j exit
   
   one:
   move $t4, $t1
   j exit
   
   two:
   move $t4, $t2
   j exit
   
   computeTribonacci:
   beq  $t5, $t6, exit     # if i = n, exit
   addi $t5, $t5, 1        # i++
   addu $t4, $t0, $t1      # t(i) = t(i-3)+t(i-2)+t(i-1)
   addu $t4, $t2, $t4      # t(i) = t(i-3)+t(i-2)+t(i-1)
   move $t0, $t1           
   move $t1, $t2
   move $t2, $t4
   j computeTribonacci
   
   exit:
   la   $a0, output        # print Tribonacci(n)
   li   $v0, 4
   syscall
   move $a0, $t4
   li   $v0, 1
   syscall

   li   $v0, 10            # syscall code 10
   syscall                 # syscall code 10

.data
   prompt: .asciiz "Enter integer n: "
   output: .asciiz "Tribonacci of n is: "
