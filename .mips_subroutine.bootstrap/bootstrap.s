                .data



subroutine:     .asciiz "future_value"
                # future_value(100000, 3, 1)
                # Register Dump:   

return_value:   .word 0

                # Layout the command line arguments 
                .align 2
argc:           .word  3
argv:           .word arg_0, arg_1, arg_2 

                .align 2
arg_0:          .word 100000 # 100000

                .align 2
arg_1:          .word 3 # 3

                .align 2
arg_2:          .word 1 # 1

                .align 2
saved_sp:       .word 0
                .align 2
saved_float:    .float 1.0
                .align 3
saved_double:   .double 1.0

                .text
                .globl main

main:           nop      

                # Set the T registers to be random values
                li $t0, 11946
                li $t1, 15183
                li $t2, 6657
                li $t3, 18475
                li $t4, 15145
                li $t5, 360
                li $t6, 17566
                li $t7, 6470
                li $t8, 31568
                li $t9, 22678

                # Set the S registers to 0xDeadBeef
                li $s0, 0xDeadBeef
                li $s1, 0xDeadBeef
                li $s2, 0xDeadBeef
                li $s3, 0xDeadBeef
                li $s4, 0xDeadBeef
                li $s5, 0xDeadBeef
                li $s6, 0xDeadBeef
                li $s7, 0xDeadBeef

                # Set the FP and GP registers
                li $fp, 0xDeadBeef
                li $gp, 0xDeadBeef

                # Save the SP registers
                sw $sp, saved_sp

                 # Marshal the input arguments into the registers
                li $a0, 100000                # 100000
                li $a1, 3                # 3
                li $a2, 1                # 1

                # Marshal the remaining input arguments onto the stack
                # Make a call to the user's subroutine
                jal future_value


                # If we made it here, then all registers that 
                # should have been preserved over the subroutine
                # boundary should be set to 0xDeadBeef;   
                # except $ra and $sp.

                # If we are here than set $ra to 0xDead Beef
                li $ra, 0xDeadBeef

                # If the SP value is what it was prior to the
                #   "jal future_value"
                # then set it to be 0xDeadBeef
                lw $at, saved_sp
                bne $at, $sp, skip
                  li $sp, 0xDeadBeef
        skip:   nop

                # Save the return value from 
                sw $v0, return_value

                # Print a blank line after the users output
                li $a0, '\n'
                li $v0, 11
                syscall

                # Save the return value from 
                lw $v0, return_value

                # Print the integer in $v0
                move $a0, $v0
                li $v0, 1
                syscall
                
                # Exit 0
                li $v0, 10
                syscall

