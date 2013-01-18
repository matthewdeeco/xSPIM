# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me3.asm
# Takes a 6-letter word input and prints it in lowercase.

main:
   la   $a0, string         # load address of string into $a0
   la   $t1, string         # load address of string into $t1

   li   $v0, 8              # read string from console
   syscall

   li   $t2, 0              # loop counter

   letter:
       lbu  $t0, ($t1)      # load a byte from the word

       bltu $t0, 65, skip   # skip adding and storing if not uppercase
       bgtu $t0, 90, skip   # skip adding and storing if not uppercase

       addi $t0, $t0, 32    # convert uppercase to lowercase
       sb   $t0, ($t1)      # store the new byte to $t1

       skip:
          addi $t1, $t1, 1  # move $t1 to the next byte
          addi $t2, $t2, 1  # increment the loop counter
       bltu $t2, 6, letter  # loop if counter < 6

   li   $v0, 4              # print string to console
   syscall                  # print string to console

   li   $v0, 10             # terminate
   syscall                  # terminate

.data
   string: .word 2
   
.text
