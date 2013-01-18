# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me6b.asm
# Factorial recursive function

main:
   li   $v0, 5             # read integer
   syscall                 # read integer

   move $t0, $v0           # store input to $t0

   jal  factorial          # call function factorial
   
   move $a0, $v0           # print result
   li   $v0, 1             # print result
   syscall                 # print result

   li   $v0, 10            # syscall code 10
   syscall                 # syscall code 10

factorial:
   ######################### preamble
   subu $sp, $sp, 32
   sw   $ra, 28($sp)
   sw   $fp, 24($sp)
   sw   $t0, 20($sp)
   addu $fp, $sp, 32
   ######################### preamble
   
   bgt  $t0, 1, multiply   # if $t0 > 1 call factorial again
   li   $v0, 1             # else ($t0 <= 1) return 1
   j    return             # skip to the end

   multiply:
   subu $t0, $t0, 1        # decrement $t0
   jal  factorial          # call factorial again
   addu $t0, $t0, 1        # increment $t0
   mul  $v0, $t0, $v0      # $v0 = $t0 * $v0
   
   return:
   ######################### end
   lw   $ra, 28($sp)
   lw   $fp, 24($sp)
   lw   $t0, 20($sp)
   addu $sp, $sp, 32
   addu $fp, $sp, 32
   ######################### end
   
   jr   $ra                # jump register
   
.data
