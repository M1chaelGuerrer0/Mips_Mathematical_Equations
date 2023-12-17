		.text
		.globl surface_area_box

surface_area_box: nop			# public static int surface_area_box(int $a0, int $a1, int $a2) {
		
		move $t0, $a0 			# int $t0 = $a0;
		move $t1, $a1 			# int $t1 = $a1;
		move $t2, $a2 			# int $t2 = $a2;
		li $t7, 2 				# int $t7 = 2
		
		mult $t0, $t1 			# int $t3 = $t0 * $t1;
		mflo $t3
		mult $t3, $t7 			# $t3 = $t3 * 2;
		mflo $t3
		
		mult $t0, $t2 			# int $t4 = $t0 * $t2;
		mflo $t4
		mult $t4, $t7 			# $t4 = $t4 * 2;
		mflo $t4
		
		mult $t1, $t2 			# int $t5 = $t1 * $t2;
		mflo $t5	
		mult $t5, $t7 			# $t5 = $t5 * 2;
		mflo $t5
		
		add $t6, $t3, $t4 		# int $t6 = $t3 + $t4;
		add $t6, $t6, $t5 		# $t6 = $t6 + $t5;
		
		move $v0, $t6 			# int $v0 = $t6;

   		move $v0, $v0			# return $v0; 
   		jr $ra 					# }

