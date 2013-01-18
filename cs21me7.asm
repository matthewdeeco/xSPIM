# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me7.asm
# Floating Point - Square root estimate using Babylonian method

main:
   la    $a0, enterReal       # print prompt
   li    $v0, 4               # print prompt
   syscall                    # print prompt
   li    $v0, 6               # read float (S)
   syscall                    # read float

   la    $a0, enterIter       # print prompt
   li    $v0, 4               # print prompt
   syscall                    # print prompt
   li    $v0, 5               # read integer (iteration count)
   syscall                    # read integer
   move  $t0, $v0             # store input to $t2
   
   li.s  $f2, 2.0             # store input to $t2
   div.s $f12, $f0, $f2       # f12 = f0/2
   jal   computeRoot          # compute the root

   la    $a0, printResult     # print result
   li    $v0, 4               # print result
   syscall                    # print result
   li    $v0, 2               # print result
   syscall                    # print result

   li    $v0, 10              # syscall code 10
   syscall                    # syscall code 10

computeRoot:
   ############################ preamble
   subu  $sp, $sp, 32
   sw    $ra, 28($sp)
   sw    $fp, 24($sp)
   sw    $t0, 20($sp)
   s.s   $f0, 16($sp)	
   addu  $fp, $sp, 32
   ############################ preamble
   
   average:
   beq   $t0,  $t1, return     # if $t0 = $t1, return
   addu  $t1,  $t1, 1          # increment $t1
   mov.s $f11, $f12            # move $f12 to $f11
   div.s $f12, $f0, $f11       # f12 = f0/f11
   add.s $f12, $f11, $f12      # f12 = f11 + f12
   div.s $f12, $f12, $f2       # f12 = f12 / 2
   j     average               # loop again
   
   return:
   ############################ end
   lw    $ra, 28($sp)
   lw    $fp, 24($sp)
   lw    $t0, 20($sp)
   l.s   $f0, 16($sp)
   addu  $sp, $sp, 32
   addu  $fp, $sp, 32
   ############################ end
   
   jr    $ra                  # jump register
   
.data
   enterReal: .asciiz "Enter a real number: "
   enterIter: .asciiz "Enter the # of iterations (higher = more accurate): "
   enterTwo: .asciiz "Enter the number 2: "
   printResult: .asciiz "The approximate square root is: "
