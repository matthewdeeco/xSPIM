# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me5.asm
# shifting, masking and rotating

main:
   li   $v0, 5                   # input integer
   syscall                       # input integer
   move $t0, $v0                 # store the int input to t0
   
   sra  $t1, $t0, 14             # shift t0 14 bits right
   and  $t1, $t1, 0x3C000        # turn bits left of R1 to 0
   or   $t1, $t1, 0x3FFF         # turn bits right of R1 to 1

   move $a0, $t1                 # print t1
   li   $v0, 1                   # print t1
   syscall                       # print t1
   
   la   $a0, newline             # print newline 
   li   $v0, 4                   # print newline
   syscall                       # print newline

   srl  $t4, $t0, 28             # shift t0 28 bits right to get integer value
   or   $t2, $t0, 0xF0007FFF     # turn bits outside R2 to 1
   rol  $t2, $t2, 4              # rotate R2 to be the leftmost
   ror  $t2, $t2, $t4            # rotate R2 R1's value bits right

   move $a0, $t2                 # print t2
   li   $v0, 1                   # print t2
   syscall                       # print t2

   sll  $t3, $t0, 17             # shift t0 17 units left
   
   la   $a0, newline             # print newline
   li   $v0, 4                   # print newline
   syscall                       # print newline
   
   move $a0, $t3                 # print t1
   li   $v0, 1                   # print t1
   syscall                       # print t1
   
   li   $v0, 10                  # terminate
   syscall                       # terminate
   
.data
   newline: .asciiz "\n"
   
