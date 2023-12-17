		.text
		.globl future_value

future_value: nop				# public static int future_value(int $a0, int $a1, int $a2) {
		
		move $t0, $a0 			# int $t0 = $a0;
		move $t1, $a1 			# int $t1 = $a1;
		move $t2, $a2 			# int $t2 = $a2;
		
		mult $t3,$t1,$t2 		# int $t3 = $t1 * $t2;
		addi $t4, $t3, 100 		# int $t4 = 100 + $t3;
		mult $t5,$t4,$t0 		# int $t5 = $t4 * $t0;
		div $t6, $t5, 100 		# int $t6 = $t5 / 100;
		move $v0, $t6 			# int $v0 = $t6;

		move $v0, $v0			# return $v0;
		jr $ra 					# }