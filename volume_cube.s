   		.text
   		.globl volume_cube

volume_cube:	nop				# public static int volume_cube(int $a0) { 
   		move $t0, $a0 			# int $t0 = $a0;
   		mult $t0,$t0 			# int $t1 = $t0 * $t0;
   		mflo $t1
   		mult $t1,$t0 			# $t1 = $t1 * $t0;
   		mflo $t1
   		move $v0, $t1 			# int $v0 = $t1;

		move $v0, $v0			# return $v0;
		jr $ra 					# }



