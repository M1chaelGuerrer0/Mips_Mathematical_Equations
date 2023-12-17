class future_value {
   static MIPS_OS_Interface mips = new MIPS_OS_Interface();

public static int future_value(int $a0, int $a1, int $a2) {
	// FV = I * ( 100 + (R * T)) / 100
	// $a0 : I = Investment amount in pennies
 	// $a1 : R = Interest rate in the whole amount, i.e., 3% == 3
  	// $a2 : T = Number of years
	int $t0 = $a0;
	int $t1 = $a1;
	int $t2 = $a2;

	int $t3 = $t1 * $t2;
	int $t4 = 100 + $t3;
	int $t5 = $t4 * $t0;
	int $t6 = $t5 / 100;
	int $v0 = $t6;

	return $v0;
}
  public static void main(String[] args) {
  
    int index;
    int  $a0   = 100000;
    int  $a1   = 3;
    int  $a2   = 1;

    int $v0 = future_value($a0, $a1, $a2);

    // Augment this code based upon desired output type

    mips.print_ci('\n');   // Print extra '\n' in case the users
                           // last line does not include the 
                           // proforma '\n'.
    mips.print_d($v0);
    mips.print_ci('\n');
    return;
  }
}
