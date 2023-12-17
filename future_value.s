.text
		.globl future_value

future_value: nop	
		#  v0 : FV = I * ( 100 + (R * T)) / 100
		#  a0 : I = Investment amount in pennies
		#  a1 : R = Interest rate in the whole amount, i.e., 3% == 3
		#  a2 : T = Number of years
		#  t0
		#  t1
		#  t2
		#  t3
		#  t4
		#  t5
		#  t6
		move $t0, $a0 # int $t0 = $a0;
		move $t1, $a1 # int $t1 = $a1;
		move $t2, $a2 # int $t2 = $a2;
		
		mult $t3,$t1,$t2 # int $t3 = $t1 * $t2;
		addi $t4, $t3, 100 # int $t4 = 100 + $t3;
		mul $t5,$t4,$t0 # int $t5 = $t4 * $t0;
		div $t6, $t5, 100 # int $t6 = $t5 / 100;
		move $v0, $t6 # int $v0 = $t6;

		move $v0, $v0			# return $v0;
		jr $ra