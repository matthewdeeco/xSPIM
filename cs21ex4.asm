# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21ex4.asm
# Given a,b,c E Z > 1, find all k E Z < c st a | k, or b | k but not both

main:
   li   $v0, 5             # read int a
   syscall                 # read int a
   move $t0, $v0           # read int a
   
   li   $v0, 5             # read int b
   syscall                 # read int b
   move $t1, $v0           # read int b

   li   $v0, 5             # read int c
   syscall                 # read int c
   move $t2, $v0           # read int c
      
   nextInt:
   beq  $t2, $t3, exit     # if k = c, exit
   addi $t3, $t3, 1        # k++
   remu $t4, $t3, $t0      # t4 = 0 if a divides k
   remu $t5, $t3, $t1      # t5 = 0 if b divides k
   sne  $t4, $t4, 0        # t4 = 1 if t4 != 0
   sne  $t5, $t5, 0        # t5 = 1 if t5 != 0
   xor  $t4, $t4, $t5      # t4 = xor(t4, t5), cannot divide both a & b
   beqz $t4, nextInt       # move to next int if t4 = 0
   la   $a0, newline       # else print the integer k
   li   $v0, 4
   syscall
   move $a0, $t3
   li   $v0, 1
   syscall
   j nextInt               # next integer
   

   exit:
   li   $v0, 10            # syscall code 10
   syscall                 # syscall code 10

.data
   newline: .asciiz "\n"
