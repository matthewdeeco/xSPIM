# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me4a.asm
# Takes 2 integers and prints the product.

main:
   li   $v0, 5                  # input integer
   syscall                      # input integer
   move $t0, $v0                # store the int input to t0
   
   li   $v0, 5                  # input integer
   syscall                      # input integer
   move $t1, $v0                # store the int input to t1
   
   li   $t2, 0                  # set t2 to 0
   li   $t3, 0                  # set t3 to 0
   
   addition:
       add  $t3, $t3, $t0       # add t0 to t3
       addi $t2, $t2, 1         # increment t2
       bltu $t2, $t1, addition  # add again if t2 < t1
       
   move $a0, $t3                # move the product [t3] to a0
   li   $v0, 1                  # print integer
   syscall                      # print integer
   
   li   $v0, 10                 # terminate
   syscall                      # terminate
   
.text
