# Matthew Co [2010-27229]
# CS21 WFW-YELLOW
# cs21me4b.asm
# Takes 2 positive integers and prints their least common multiple. (LCM)

main:
    li   $v0, 5              # input integer
    syscall                  # input integer
    move $t0, $v0            # move integer input to t0
    
    li   $v0, 5              # input integer
    syscall                  # input integer
    move $t1, $v0            # move integer input to t1
    
    mul  $t2, $t0, $t1       # store product of t0 and t1 to t2
    
    loop:
        beqz $t0, endloop    # stop if t0 is 0
        beqz $t1, endloop    # stop if t1 is 0
        
        bgtu $t1, $t0, bgta  # jump to bgta if t1 > t0
        subu $t0, $t0, $t1   # t0 = t0 - t1
        j    loop            # loop
        
        bgta:                # t1 > t0
        subu $t1, $t1, $t0   # t1 = t1 - t0
        j    loop            # loop
    endloop:                 # either t0 or t1 is 0
    
    beqz $t1, skipswap       # if t1 is 0, skip
    move $t0, $t1            # t0 is 0; move t1 to t0
    
    skipswap:                # at this point, t0 contains the GCD of the 2 integer inputs
    divu $t2, $t2, $t0       # divide the product by the GCD to get the LCM
    
    move $a0, $t2            # store the LCM [t2] to $a0
    li   $v0, 1              # print integer
    syscall                  # print integer
    
    li   $v0, 10             # terminate
    syscall                  # terminate

.text
