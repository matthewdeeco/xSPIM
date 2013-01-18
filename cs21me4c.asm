# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me4c.asm
# Takes a string input and prints it in uppercase.

main:
   la   $a0, string          # load address of string into $a0
   la   $t1, string          # load address of string into $t1

   li   $v0, 8               # read string from console
   syscall

   li   $t2, 32              # difference of upper and lowercase letters
   
   letter:
       lbu  $t0, ($t1)       # load a byte from the word

       beqz $t0, endloop     # the byte is null, so stop the loop

       bltu $t0, 97 , next   # skip adding and storing if not lowercase
       bgtu $t0, 122, next   # skip adding and storing if not lowercase

       subu $t0, $t0, $t2    # convert lowercase to uppercase
       sb   $t0, ($t1)       # store the new byte to $t1

       next:
       addi $t1, $t1, 1      # move $t1 to the next byte
       j letter              # process another character
   endloop:
   
   li   $v0, 4               # print string to console
   syscall                   # print string to console

   li   $v0, 10              # terminate
   syscall                   # terminate

.data
   string: .word 16
   
.text
