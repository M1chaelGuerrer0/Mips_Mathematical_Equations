   		.text
   		.globl volume_cube


volume_cube:	nop				# int volume_cube(int $a0) 
		# v0 :  V = s^3
   		# a0 :  s = length / width / height of the cube

		# $t0
   		# $t1
   		move $t0, $a0 # int $t0 = $a0;
   		mul $t1,$t0,$t0 # int $t1 = $t0 * $t0;
   		mul $t1,$t1,$t0 # $t1 = $t1 * $t0;
   		move $v0, $t1 # int $v0 = $t1;

		move $v0, $v0			# return $v0;
		jr $ra



