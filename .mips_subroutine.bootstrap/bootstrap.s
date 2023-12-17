                .data



subroutine:     .asciiz "surface_area_box"
                # surface_area_box(3, 3, 3)
                # Register Dump:   

return_value:   .word 0

                # Layout the command line arguments 
                .align 2
argc:           .word  3
argv:           .word arg_0, arg_1, arg_2 

                .align 2
arg_0:          .word 3 # 3

                .align 2
arg_1:          .word 3 # 3

                .align 2
arg_2:          .word 3 # 3

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
                li $t0, 13144
                li $t1, 15776
                li $t2, 764
                li $t3, 27637
                li $t4, 19223
                li $t5, 16820
                li $t6, 26134
                li $t7, 28285
                li $t8, 173
                li $t9, 9012

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
                li $a0, 3                # 3
                li $a1, 3                # 3
                li $a2, 3                # 3

                # Marshal the remaining input arguments onto the stack
                # Make a call to the user's subroutine
                jal surface_area_box


                # If we made it here, then all registers that 
                # should have been preserved over the subroutine
                # boundary should be set to 0xDeadBeef;   
                # except $ra and $sp.

                # If we are here than set $ra to 0xDead Beef
                li $ra, 0xDeadBeef

                # If the SP value is what it was prior to the
                #   "jal surface_area_box"
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

