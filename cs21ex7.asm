# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21ex7.asm
# Character, symbol and number counter

main:
     la   $a0, input
     la   $a1, 32
     li   $v0, 8
     syscall
     
     li   $v0, 4
     
     readchar:
     lbu  $t0, ($a0)
     addi $a0, $a0, 1
     beq  $t0, 0,   exit
     bleu $t0, 31,  readchar
     bleu $t0, 47,  symbol
     bleu $t0, 57,  number
     bleu $t0, 64,  symbol
     bleu $t0, 90,  uppercase
     bleu $t0, 96,  symbol
     bleu $t0, 122, lowercase
     j symbol
     
     uppercase:
     addi $t1, $t1, 1
     beq  $t0, 65,  vowel
     beq  $t0, 69,  vowel
     beq  $t0, 73,  vowel
     beq  $t0, 79,  vowel
     beq  $t0, 85,  vowel
     j consonant
     
     lowercase:
     beq  $t0, 97,  vowel
     beq  $t0, 101, vowel
     beq  $t0, 105, vowel
     beq  $t0, 111, vowel
     beq  $t0, 117, vowel
     j consonant
     
     vowel:
     addi $t2, $t2, 1
     j readchar
     
     consonant:
     addi $t3, $t3, 1
     j readchar
     
     number:
     addi $t4, $t4, 1
     j readchar
     
     symbol:
     addi $t5, $t5, 1
     j readchar
     
     exit:
     la   $a0, upper
     li   $v0, 4
     syscall
     move $a0, $t1
     li   $v0, 1
     syscall
     
     la   $a0, vowls
     li   $v0, 4
     syscall
     move $a0, $t2
     li   $v0, 1
     syscall
     
     la   $a0, const
     li   $v0, 4
     syscall
     move $a0, $t3
     li   $v0, 1
     syscall
     
     la   $a0, numbs
     li   $v0, 4
     syscall
     move $a0, $t4
     li   $v0, 1
     syscall
     
     la   $a0, symbs
     li   $v0, 4
     syscall
     move $a0, $t5
     li   $v0, 1
     syscall
     
     li   $v0, 10
     syscall
     
.data
     input: .space 32
     upper: .asciiz "\nuppercase : "
     vowls: .asciiz "\nvowels    : "
     const: .asciiz "\nconsonants: "
     numbs: .asciiz "\nnumbers   : "
     symbs: .asciiz "\nsymbols&spaces   : "
