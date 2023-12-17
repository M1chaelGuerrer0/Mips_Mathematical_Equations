
# Mips Mathematical Equations
Converting Mathematical Equations into Three Address Code

## Overview

In this programming assignment, you are to write three Java methods and three corresponding MIPS subroutines. Each of these set of methods/subroutines evaluate one of the following three mathematical expressions:

  

## Validation and Final Submission
Prior to your final submission to the repository, run the `make` command to test programs.
The output should be as follows:

   ```bash
   $ make
   
   mips_subroutine volume_cube 3
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         27; 0x00 00 00 1B; 0b0000 0000 0000 0000 0000 0000 0001 1011;
   
   mips_subroutine surface_area_box 3 3 3
   #########################################
   # Above is the output from your program
   #########################################
   
   v0:         54; 0x00 00 00 36; 0b0000 0000 0000 0000 0000 0000 0011 0110;
   
   mips_subroutine future_value 100000 3 1
   #########################################
   # Above is the output from your program
   #########################################

   v0:     103000; 0x00 01 92 58; 0b0000 0000 0000 0001 1001 0010 0101 1000;

   ```

If all is working correctly, you can now run the command `make validate`.  This command will create a file called `validation.output`.  Moreover, this file will automatically be added to your local repository.


