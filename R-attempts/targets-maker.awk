
# the following is a validation test

$9 >= 0 && $9 < 5  	 { print 1, 0, 0, 0, 0, 0 }
$9 >= 5 && $9 < 10 	 { print 0, 1, 0, 0, 0, 0 }
$9 >= 10 && $9 < 15  { print 0, 0, 1, 0, 0, 0 }
$9 >= 15 && $9 < 20	 { print 0, 0, 0, 1, 0, 0 }
$9 >= 20 && $9 < 25	 { print 0, 0, 0, 0, 1, 0 }
$9 >= 25 && $9 < 30	 { print 0, 0, 0, 0, 0, 1 }
