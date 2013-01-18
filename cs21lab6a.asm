# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me6a.asm
# Hello World function

main:
   jal  helloworld      # call function helloworld
   
   li   $v0, 10         # syscall code 10
   syscall              # syscall code 10

helloworld:
   ###################### preamble
   subu $sp, $sp, 32
   sw   $ra, 28($sp)
   sw   $fp, 24($sp)
   addu $fp, $sp, 32
   ###################### preamble
   
   la   $a0, hw         # load address of hw to $a0
   li   $v0, 4          # print string $a0
   syscall              # print string $a0
   
   ###################### end
   lw   $ra, 28($sp)
   lw   $fp, 24($sp)
   addu $sp, $sp, 32
   addu $fp, $sp, 32
   ###################### end
   
   jr   $ra             # jump register
   
.data
   hw: .asciiz "Hello World!\n"
