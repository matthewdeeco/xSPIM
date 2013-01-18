# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21ex5.asm
# Check if a string is a palindrome

main:
     la   $a0, input
     li   $a1, 32
     li   $v0, 8
     syscall
     
     move $a1, $a0
     
     nextChar:
     lb   $t0, ($a1)
     beqz $t0, lastChar
     addi $a1, $a1, 1
     j nextChar
     
     lastChar:
     subu $a1, $a1, 2
     jal  isPalindrome
     beqz $v0, no
     
     yes:
     la   $a0, palindrome
     j end
     
     no:
     la   $a0, notpalindrome
     
     end:
     li   $v0, 4
     syscall
     
     li   $v0, 10
     syscall
     
     
isPalindrome:
     subu $sp, $sp, 32
     sw   $ra, 28($sp)
     sw   $fp, 24($sp)
     sw   $a0, 20($sp)
     sw   $a1, 16($sp)
     addu $fp, $fp, 32
     
     bge  $a0, $a1, ret1
     lb   $t0, ($a0)
     lb   $t1, ($a1)
     bne  $t0, $t1, ret0
     addi $a0, $a0, 1
     subu $a1, $a1, 1
     jal  isPalindrome
     beqz $v0, ret0
     j    ret1
     
     ret0:
     li   $v0, 0
     j    return
     
     ret1:
     li   $v0, 1
     
     return:
     lw   $ra, 28($sp)
     lw   $fp, 24($sp)
     lw   $a0, 20($sp)
     lw   $a1, 16($sp)
     addu $sp, $sp, 32
     addu $fp, $sp, 32
     
     jr   $ra

     
.data
     input: .space 32
     palindrome: .asciiz "The text you entered is a palindrome.\n\n"
     notpalindrome: .asciiz "The text you entered is not a palindrome.\n\n"
